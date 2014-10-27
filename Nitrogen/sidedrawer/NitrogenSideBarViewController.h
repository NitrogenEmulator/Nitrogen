//
//  NitrogenSideBarViewController.h
//  Nitrogen
//
//  Created by David Chavez on 7/8/13.
//  Copyright (c) 2014 Nitrogen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SASlideMenuViewController.h"
#import "SASlideMenuDataSource.h"

@interface NitrogenSideBarViewController : SASlideMenuViewController {
    IBOutlet UILabel *romListLabel;
    IBOutlet UILabel *aboutLabel;
    IBOutlet UILabel *settingsLabel;
    IBOutlet UILabel *donateLabel;
}


@end
