//
//  NitrogenDirectionalControl.h
//  Nitrogen
//
//  Created by Nitrogen
//  Copyright (c) 2014 Nitrogen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, NitrogenDirectionalControlDirection) {
    NitrogenDirectionalControlDirectionUp     = 1 << 0,
    NitrogenDirectionalControlDirectionDown   = 1 << 1,
    NitrogenDirectionalControlDirectionLeft   = 1 << 2,
    NitrogenDirectionalControlDirectionRight  = 1 << 3,
};

typedef NS_ENUM(NSInteger, NitrogenDirectionalControlStyle) {
    NitrogenDirectionalControlStyleDPad = 0,
    NitrogenDirectionalControlStyleJoystick = 1,
};

@interface NitrogenDirectionalControl : UIControl

@property (readonly, nonatomic) NitrogenDirectionalControlDirection direction;
@property (assign, nonatomic) NitrogenDirectionalControlStyle style;

@end
