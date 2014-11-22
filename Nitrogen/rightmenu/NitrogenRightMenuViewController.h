//
//  NitrogenRightMenuViewController.h
//  Nitrogen
//
//  Created by David Chavez on 7/15/13.
//  Copyright (c) 2014 Nitrogen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SASlideMenuRootViewController.h"
#import "NitrogenGame.h"

@interface NitrogenRightMenuViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) NitrogenGame *game;

@end
