//
//  AppDelegate.h
//  PdLink
//
//  Created by Peter Brinkmann on 2/26/16.
//  Copyright © 2016 Peter Brinkmann. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PdAudioController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PdAudioController *pd;

@end

