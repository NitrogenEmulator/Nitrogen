//
//  NitrogenAboutViewController.h
//  Nitrogen
//
//  Created by Developer on 7/8/13.
//  Copyright (c) 2014 Nitrogen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NitrogenAboutViewController : UITableViewController {
    BOOL _canTweet;
    IBOutlet UINavigationItem *aboutTitle;    
    IBOutlet UIBarButtonItem *tweetButton;
    IBOutlet UILabel *versionLabel;
    IBOutlet UILabel *desmumeVersion;
}
- (IBAction)sendTweet:(id)sender;

@end
