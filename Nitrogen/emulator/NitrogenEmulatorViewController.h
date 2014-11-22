//
//  NitrogenEmulatorViewController.h
//  Nitrogen
//
//  Created by Nitrogen on 6/11/13.
//  Copyright (c) 2014 Nitrogen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NitrogenGame.h"

@interface NitrogenEmulatorViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) NitrogenGame *game;
@property (copy, nonatomic) NSString *saveState;

- (void)pauseEmulation;
- (void)resumeEmulation;
- (void)saveStateWithName:(NSString*)saveStateName;

@end
