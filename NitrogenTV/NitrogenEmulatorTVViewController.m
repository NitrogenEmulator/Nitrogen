//
//  NitrogenEmulatorTVViewController.m
//  Nitrogen
//
//  Created by Brian Tung on 10/15/15.
//  Copyright © 2015 Nitrogen. All rights reserved.
//

#import "NitrogenEmulatorTVViewController.h"

@interface NitrogenEmulatorTVViewController ()

@end

@implementation NitrogenEmulatorTVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"nds"];
    self.game = [[NitrogenGame alloc] initWithPath:path saveStateDirectoryPath:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateFPS:) name:@"fps" object:nil];
    
    // Do any additional setup after loading the view.
}

- (void)updateFPS:(NSNotification *)notification
{
    self.frameLabel.frame = CGRectMake(0, 0, 200, 50);
    
    NSNumber *fps = notification.userInfo[@"fps"];
    self.frameLabel.text = [NSString stringWithFormat:@"%i FPS", fps.intValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)play:(id)sender {
    
}

@end
