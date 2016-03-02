//
//  ViewController.h
//  PdLink
//
//  Created by Peter Brinkmann on 2/26/16.
//  Copyright © 2016 Peter Brinkmann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *tempoLabel;
@property (weak, nonatomic) IBOutlet UILabel *resolutionLabel;
@property (weak, nonatomic) IBOutlet UILabel *quantumLabel;
@property (weak, nonatomic) IBOutlet UISlider *tempoSlider;
@property (weak, nonatomic) IBOutlet UISlider *resolutionSlider;
@property (weak, nonatomic) IBOutlet UISlider *quantumSlider;

@end

