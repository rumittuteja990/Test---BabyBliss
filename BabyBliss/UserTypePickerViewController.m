//
//  UserTypePickerViewController.m
//  BabyBliss
//
//  Created by Rumit Singh Tuteja on 4/4/17.
//  Copyright © 2017 Rumit Singh Tuteja. All rights reserved.
//

#import "UserTypePickerViewController.h"
#import "AppDelegate.h"

@interface UserTypePickerViewController ()
- (IBAction)btnParentSelected:(id)sender;
- (IBAction)btnBabysitterSelected:(id)sender;

@end

@implementation UserTypePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnParentSelected:(id)sender {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [window setRootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"parentTabBar"]];
}

- (IBAction)btnBabysitterSelected:(id)sender {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [window setRootViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"babysitterTabBar"]];
}
@end
