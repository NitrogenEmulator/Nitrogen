//
//  UIScreen+Widescreen.m
//  Nitrogen
//
//  Created by Nitrogen on 6/2/13.
//  Copyright (c) 2013 Homebrew. All rights reserved.
//

#import "UIScreen+Widescreen.h"

@implementation UIScreen (Widescreen)

- (BOOL)isWidescreen {
#if defined(TARGET_OS_TV)
    return YES;
#else
    return [self bounds].size.height >= 568;
#endif
}

@end
