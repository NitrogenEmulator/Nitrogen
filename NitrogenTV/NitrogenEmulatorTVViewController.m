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
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)play:(id)sender {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
