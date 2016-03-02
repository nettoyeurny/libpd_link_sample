//
//  ViewController.m
//  PdLink
//
//  Created by Peter Brinkmann on 2/26/16.
//  Copyright © 2016 Peter Brinkmann. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "PdBase.h"
#import "PdFile.h"
#import "PdDispatcher.h"
#include "ABLLinkSettingsViewController.h"
#include "ABLLink.h"

@interface ViewController ()
- (void)updateTempo:(int)tempo;
@end

@implementation ViewController {
    PdDispatcher *dispatcher_;
    PdFile *patch_;
    UIViewController *linkSettings_;
}

void sessionTempoCallback(double tempo, void *context) {
    ViewController *vc = (__bridge ViewController*) context;
    [vc updateTempo:tempo];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dispatcher_ = [[PdDispatcher alloc] init];
    [PdBase setDelegate:dispatcher_];
    patch_ = [PdFile openFileNamed:@"ping.pd" path:[[NSBundle mainBundle] resourcePath]];
    linkSettings_ = [ABLLinkSettingsViewController instance:[PdAudioUnit getLinkRef]];
    ABLLinkSetSessionTempoCallback([PdAudioUnit getLinkRef], sessionTempoCallback, (__bridge void *)(self));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tempoChanged:(id)sender {
    UISlider *slider = (UISlider*) sender;
    int tempo = slider.value;
    [self updateTempo:tempo];
    [PdBase sendFloat:tempo toReceiver:@"tempo"];
}

- (IBAction)resolutionChanged:(id)sender {
    UISlider *slider = (UISlider*) sender;
    int res = slider.value;
    self.resolutionLabel.text = [NSString stringWithFormat:@"Resolution: %d", res];
    [PdBase sendFloat:(int)res toReceiver:@"resolution"];
}

- (IBAction)quantumChanged:(id)sender {
    UISlider *slider = (UISlider*) sender;
    int quantum = slider.value;
    self.quantumLabel.text = [NSString stringWithFormat:@"Quantum: %d", quantum];
    [PdBase sendFloat:quantum toReceiver:@"quantum"];
}

-(IBAction)showLinkSettings:(id)sender
{
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:linkSettings_];
    // this will present a view controller as a popover in iPad and a modal VC on iPhone
    linkSettings_.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  target:self
                                                  action:@selector(hideLinkSettings:)];
    
    navController.modalPresentationStyle = UIModalPresentationPopover;
    
    UIPopoverPresentationController *popC = navController.popoverPresentationController;
    popC.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popC.sourceRect = [sender frame];
    
    // we recommend using a size of 320x400 for the display in a popover
    linkSettings_.preferredContentSize = CGSizeMake(320.f, 400.f);
    
    UIButton *button = (UIButton *)sender;
    popC.sourceView = button.superview;
    
    [self presentViewController:navController animated:YES completion:nil];
}

- (void)hideLinkSettings:(id)sender
{
#pragma unused(sender)
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)updateTempo:(int)tempo {
    self.tempoLabel.text = [NSString stringWithFormat:@"Tempo: %d", tempo];
}

@end

