//
//  ButtonControl.m
//  Nitrogen
//
//  Created by Riley Testut on 7/5/13.
//  Copyright (c) 2014 Nitrogen. All rights reserved.
//

#import "NitrogenButtonControl.h"

@interface NitrogenDirectionalControl ()

@property (strong, nonatomic) UIImageView *backgroundImageView;

@end

@interface NitrogenButtonControl ()

@property (readwrite, nonatomic) NitrogenButtonControlButton selectedButtons;

@end

@implementation NitrogenButtonControl

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        
        self.backgroundImageView.image = [UIImage imageNamed:@"ABXYPad"];
    }
    return self;
}

- (NitrogenButtonControlButton)selectedButtons {
    return (NitrogenButtonControlButton)self.direction;
}

@end
