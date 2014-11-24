//
//  AppDelegate.h
//  Nitrogen
//
//  Created by Nitrogen on 6/9/13.
//  Copyright (c) 2014 Nitrogen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NitrogenEmulatorViewController.h"
#import "NitrogenGame.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NitrogenGame *currentGame;
@property (strong, nonatomic) NitrogenEmulatorViewController *currentEmulatorViewController;

+ (AppDelegate *)sharedInstance;

- (NSString *)batteryDir;
- (NSString *)documentsPath;

- (void)startGame:(NitrogenGame *)game withSavedState:(NSInteger)savedState;

@end