//
//  Settings.m
//  Nitrogen
//
//  Created by Riley Testut on 7/5/13.
//  Copyright (c) 2014 Nitrogen. All rights reserved.
//

#import "NitrogenSettingsViewController.h"
#import <DropboxSDK/DropboxSDK.h>
#import "OLGhostAlertView.h"
#import "CHBgDropboxSync.h"

@interface NitrogenSettingsViewController ()

@property (weak, nonatomic) IBOutlet UINavigationItem *settingsTitle;

@property (weak, nonatomic) IBOutlet UILabel *frameSkipLabel;
@property (weak, nonatomic) IBOutlet UILabel *disableSoundLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *frameSkipControl;
@property (weak, nonatomic) IBOutlet UISwitch *disableSoundSwitch;

@property (weak, nonatomic) IBOutlet UILabel *controlPadStyleLabel;
@property (weak, nonatomic) IBOutlet UILabel *controlPositionLabel;
@property (weak, nonatomic) IBOutlet UILabel *controlOpacityLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *controlPadStyleControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *controlPositionControl;
@property (weak, nonatomic) IBOutlet UISlider *controlOpacitySlider;

@property (weak, nonatomic) IBOutlet UILabel *showFPSLabel;
@property (weak, nonatomic) IBOutlet UILabel *showPixelGridLabel;

@property (weak, nonatomic) IBOutlet UISwitch *showFPSSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *showPixelGridSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *enableJITSwitch;

@property (weak, nonatomic) IBOutlet UILabel *vibrateLabel;
@property (weak, nonatomic) IBOutlet UISwitch *vibrateSwitch;

@property (weak, nonatomic) IBOutlet UILabel *dropboxLabel;

@property (weak, nonatomic) IBOutlet UISwitch *dropboxSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *cellularSwitch;
@property (weak, nonatomic) IBOutlet UILabel *accountLabel;

- (IBAction)controlChanged:(id)sender;

@end

@implementation NitrogenSettingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:78.0/255.0 green:156.0/255.0 blue:206.0/255.0 alpha:1.0]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    self.settingsTitle.title = NSLocalizedString(@"SETTINGS", nil);
    
    self.frameSkipLabel.text = NSLocalizedString(@"FRAME_SKIP", nil);
    self.disableSoundLabel.text = NSLocalizedString(@"DISABLE_SOUND", nil);
    self.showPixelGridLabel.text = NSLocalizedString(@"OVERLAY_PIXEL_GRID", nil);

    self.controlPadStyleLabel.text = NSLocalizedString(@"CONTROL_PAD_STYLE", nil);
    self.controlPositionLabel.text = NSLocalizedString(@"CONTROL_POSITION_PORTRAIT", nil);
    self.controlOpacityLabel.text = NSLocalizedString(@"CONTROL_OPACITY_PORTRAIT", nil);
    
    self.dropboxLabel.text = NSLocalizedString(@"ENABLE_DROPBOX", nil);
    self.accountLabel.text = NSLocalizedString(@"NOT_LINKED", nil);
    
    self.showFPSLabel.text = NSLocalizedString(@"SHOW_FPS", nil);
    self.vibrateLabel.text = NSLocalizedString(@"VIBRATION", nil);

    [self.frameSkipControl setTitle:NSLocalizedString(@"AUTO", nil) forSegmentAtIndex:5];

    [self.controlPadStyleControl setTitle:NSLocalizedString(@"DPAD", nil) forSegmentAtIndex:0];
    [self.controlPadStyleControl setTitle:NSLocalizedString(@"JOYSTICK", nil) forSegmentAtIndex:1];

    [self.controlPositionControl setTitle:NSLocalizedString(@"TOP", nil) forSegmentAtIndex:0];
    [self.controlPositionControl setTitle:NSLocalizedString(@"BOTTOM", nil) forSegmentAtIndex:1];
    
    
    UIView *hiddenSettingsTapView = [[UIView alloc] initWithFrame:CGRectMake(245, 0, 75, 44)];
    
    UIBarButtonItem *hiddenSettingsBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:hiddenSettingsTapView];
    self.navigationItem.rightBarButtonItem = hiddenSettingsBarButtonItem;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(revealHiddenSettings:)];
    tapGestureRecognizer.numberOfTapsRequired = 3;
    [hiddenSettingsTapView addGestureRecognizer:tapGestureRecognizer];
    
}

- (NSString *)tableView:(UITableView *)tableView  titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = NSLocalizedString(@"EMULATOR", nil);
            break;
        case 1:
            sectionName = NSLocalizedString(@"CONTROLS", nil);
            break;
        case 2:
            sectionName = @"Dropbox";
            break;
        case 3:
            sectionName = NSLocalizedString(@"DEVELOPER", nil);
            break;
        case 4:
            sectionName = NSLocalizedString(@"EXPERIMENTAL", nil);
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

- (NSString *)tableView:(UITableView *)tableView  titleForFooterInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = NSLocalizedString(@"OVERLAY_PIXEL_GRID_DETAIL", nil);
            break;
        case 2:
            sectionName = NSLocalizedString(@"ENABLE_DROPBOX_DETAIL", nil);
            break;
        case 4:
            sectionName = NSLocalizedString(@"ARMLJIT_DETAIL", nil);
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)controlChanged:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (sender == self.frameSkipControl) {
        NSInteger frameSkip = self.frameSkipControl.selectedSegmentIndex;
        if (frameSkip == 5) frameSkip = -1;
        [defaults setInteger:frameSkip forKey:@"frameSkip"];
    } else if (sender == self.disableSoundSwitch) {
        [defaults setBool:self.disableSoundSwitch.on forKey:@"disableSound"];
    } else if (sender == self.showPixelGridSwitch) {
        [defaults setBool:self.showPixelGridSwitch.on forKey:@"showPixelGrid"];
    } else if (sender == self.controlPadStyleControl) {
        [defaults setInteger:self.controlPadStyleControl.selectedSegmentIndex forKey:@"controlPadStyle"];
    } else if (sender == self.controlPositionControl) {
        [defaults setInteger:self.controlPositionControl.selectedSegmentIndex forKey:@"controlPosition"];
    } else if (sender == self.controlOpacitySlider) {
        [defaults setFloat:self.controlOpacitySlider.value forKey:@"controlOpacity"];
    } else if (sender == self.showFPSSwitch) {
        [defaults setBool:self.showFPSSwitch.on forKey:@"showFPS"];
    } else if (sender == self.enableJITSwitch) {
        [defaults setBool:self.enableJITSwitch.on forKey:@"enableLightningJIT"];
    } else if (sender == self.vibrateSwitch) {
        [defaults setBool:self.vibrateSwitch.on forKey:@"vibrate"];
    } else if (sender == self.dropboxSwitch) {//i'll use a better more foolproof method later. <- lol yeah right
        if ([defaults boolForKey:@"enableDropbox"] == false) {
            [[DBSession sharedSession] linkFromController:self];
        } else {
            NSLog(@"unlink");
            [CHBgDropboxSync forceStopIfRunning];
            [CHBgDropboxSync clearLastSyncData];
            [[DBSession sharedSession] unlinkAll];
            OLGhostAlertView *unlinkAlert = [[OLGhostAlertView alloc] initWithTitle:NSLocalizedString(@"UNLINKED", nil) message:NSLocalizedString(@"UNLINKED_DETAIL", nil) timeout:10 dismissible:YES];
            [unlinkAlert show];
            
            [defaults setBool:false forKey:@"enableDropbox"];
            self.accountLabel.text = NSLocalizedString(@"NOT_LINKED", nil);
        }
    } else if (sender == self.cellularSwitch) {
        [defaults setBool:self.cellularSwitch.on forKey:@"enableDropboxCellular"];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSInteger frameSkip = [defaults integerForKey:@"frameSkip"];
    self.frameSkipControl.selectedSegmentIndex = frameSkip < 0 ? 5 : frameSkip;
    self.disableSoundSwitch.on = [defaults boolForKey:@"disableSound"];
    
    self.controlPadStyleControl.selectedSegmentIndex = [defaults integerForKey:@"controlPadStyle"];
    self.controlPositionControl.selectedSegmentIndex = [defaults integerForKey:@"controlPosition"];
    self.controlOpacitySlider.value = [defaults floatForKey:@"controlOpacity"];
    
    self.showFPSSwitch.on = [defaults boolForKey:@"showFPS"];
    self.showPixelGridSwitch.on = [defaults boolForKey:@"showPixelGrid"];
    
    self.enableJITSwitch.on = [defaults boolForKey:@"enableLightningJIT"];
    self.vibrateSwitch.on = [defaults boolForKey:@"vibrate"];
    
    self.dropboxSwitch.on = [defaults boolForKey:@"enableDropbox"];
    self.cellularSwitch.on = [defaults boolForKey:@"enableDropboxCellular"];
    
    if ([defaults boolForKey:@"enableDropbox"] == true) {
        self.accountLabel.text = NSLocalizedString(@"LINKED", nil);
    }
}

- (void)appDidBecomeActive:(NSNotification *)notification
{
    self.dropboxSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"enableDropbox"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"enableDropbox"] == true) {
        self.accountLabel.text = NSLocalizedString(@"LINKED", nil);
    }
}

#pragma mark - Hidden Settings

- (void)revealHiddenSettings:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"revealHiddenSettings"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.tableView reloadData];
}

#pragma mark - UITableView Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"revealHiddenSettings"]) {
        return 5;
    }
    
    return 4;//4
}

@end
