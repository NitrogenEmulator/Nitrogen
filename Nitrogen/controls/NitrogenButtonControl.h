//
//  ButtonControl.h
//  Nitrogen
//
//  Created by Nitrogen on 7/5/13.
//  Copyright (c) 2014 Nitrogen. All rights reserved.
//

#import "NitrogenDirectionalControl.h"

// This class really doesn't do much. It's basically here to make the code easier to read, but also in case of future expansion.

// Below are identical to the superclass variants, just renamed for clarity
typedef NS_ENUM(NSInteger, NitrogenButtonControlButton) {
    NitrogenButtonControlButtonX     = 1 << 0,
    NitrogenButtonControlButtonB     = 1 << 1,
    NitrogenButtonControlButtonY     = 1 << 2,
    NitrogenButtonControlButtonA     = 1 << 3,
};

@interface NitrogenButtonControl : NitrogenDirectionalControl

@property (readonly, nonatomic) NitrogenButtonControlButton selectedButtons;

@end
