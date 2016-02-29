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

@end

@implementation ViewController {
    PdDispatcher *dispatcher_;
    PdFile *patch_;
    UIViewController *linkSettings_;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dispatcher_ = [[PdDispatcher alloc] init];
    [PdBase setDelegate:dispatcher_];
    patch_ = [PdFile openFileNamed:@"ping.pd" path:[[NSBundle mainBundle] resourcePath]];
    linkSettings_ = [ABLLinkSettingsViewController instance:[PdAudioUnit getLinkRef]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)triggerSound:(id)sender {
    [PdBase sendBangToReceiver:@"ping"];
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

@end
