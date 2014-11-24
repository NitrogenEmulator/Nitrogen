//
//  NitrogenDirectionalControl.m
//  Nitrogen
//
//  Created by Nitrogen
//  Copyright (c) 2014 Nitrogen. All rights reserved.
//

#import "NitrogenDirectionalControl.h"

@interface NitrogenDirectionalControl()

@property (readwrite, nonatomic) NitrogenDirectionalControlDirection direction;
@property (assign, nonatomic) CGSize deadZone; // dead zone in the middle of the control
@property (strong, nonatomic) UIImageView *backgroundImageView;
@property (assign, nonatomic) CGRect deadZoneRect;
@property (strong, nonatomic) UIImageView *buttonImageView;

@end

@implementation NitrogenDirectionalControl

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        _backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self addSubview:_backgroundImageView];
        
        _buttonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 56, 56)];
        _buttonImageView.image = [UIImage imageNamed:@"JoystickButton"];
        _buttonImageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addSubview:_buttonImageView];
        
        self.deadZone = CGSizeMake(self.frame.size.width/3, self.frame.size.height/3);
        
        [self setStyle:NitrogenDirectionalControlStyleDPad];
    }
    return self;
}

- (NitrogenDirectionalControlDirection)directionForTouch:(UITouch *)touch
{
    // convert coords to based on center of control
    CGPoint loc = [touch locationInView:self];
    if (!CGRectContainsPoint(self.bounds, loc)) return 0;
    NitrogenDirectionalControlDirection direction = 0;
    
    if (loc.x > (self.bounds.size.width + self.deadZone.width)/2) direction |= NitrogenDirectionalControlDirectionRight;
    else if (loc.x < (self.bounds.size.width - self.deadZone.width)/2) direction |= NitrogenDirectionalControlDirectionLeft;
    if (loc.y > (self.bounds.size.height + self.deadZone.height)/2) direction |= NitrogenDirectionalControlDirectionDown;
    else if (loc.y < (self.bounds.size.height - self.deadZone.height)/2) direction |= NitrogenDirectionalControlDirectionUp;
    
    return direction;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.direction = [self directionForTouch:touch];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    if (self.style == NitrogenDirectionalControlStyleJoystick) {
        CGPoint loc = [touch locationInView:self];
        self.deadZoneRect = CGRectMake((self.bounds.size.width - self.deadZone.width)/2, (self.bounds.size.height - self.deadZone.height)/2, self.deadZone.width, self.deadZone.height);
        if (!CGRectContainsPoint(self.deadZoneRect, loc)) return NO;
        self.buttonImageView.center = loc;
    }
    
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.direction = [self directionForTouch:touch];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    if (self.style == NitrogenDirectionalControlStyleJoystick) {
        if (![super continueTrackingWithTouch:touch withEvent:event]) return NO;
        
        // keep button inside
        CGPoint loc = [touch locationInView:self];
        loc.x -= self.bounds.size.width/2;
        loc.y -= self.bounds.size.height/2;
        double radius = sqrt(loc.x*loc.x+loc.y*loc.y);
        double maxRadius = self.bounds.size.width * 0.45;
        if (radius > maxRadius) {
            double angle = atan(loc.y/loc.x);
            if (loc.x < 0) angle += M_PI;
            radius = maxRadius;
            loc.x = radius * cos(angle);
            loc.y = radius * sin(angle);
        }
        loc.x += self.bounds.size.width/2;
        loc.y += self.bounds.size.height/2;
        self.buttonImageView.center = loc;
        
    }
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    self.direction = 0;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    if (self.style == NitrogenDirectionalControlStyleJoystick) {
        self.buttonImageView.center = self.backgroundImageView.center;
    }
}

#pragma mark - Getters/Setters

- (void)setStyle:(NitrogenDirectionalControlStyle)style {
    switch (style) {
        case NitrogenDirectionalControlStyleDPad: {
            self.buttonImageView.hidden = YES;
            self.backgroundImageView.image = [UIImage imageNamed:@"DPad"];
            break;
        }
            
        case NitrogenDirectionalControlStyleJoystick: {
            self.buttonImageView.hidden = NO;
            self.backgroundImageView.image = [UIImage imageNamed:@"JoystickBackground"];
            break;
        }
    }
    
    _style = style;
}

@end
