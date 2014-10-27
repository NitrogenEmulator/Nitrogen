//
//  NitrogenMasterViewController.h
//  Nitrogen
//
//  Created by Nitrogen on 6/9/13.
//  Copyright (c) 2014 Nitrogen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DropboxSDK/DropboxSDK.h>
#import "DocWatchHelper.h"

@interface NitrogenROMTableViewController : UITableViewController <UIAlertViewDelegate>
{
    NSArray *games;
    DocWatchHelper *docWatchHelper;
    
    IBOutlet UINavigationItem *romListTitle;
}

- (void)reloadGames:(NSNotification*)aNotification;

@end
