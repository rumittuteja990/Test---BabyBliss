//
//  HelpParentViewController.m
//  BabyBliss
//
//  Created by Rumit Singh Tuteja on 4/25/17.
//  Copyright © 2017 Rumit Singh Tuteja. All rights reserved.
//

#import "HelpParentViewController.h"
#import "ViewController.h"

@interface HelpParentViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnGetStarted;

@end

@implementation HelpParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_btnGetStarted setAction:@selector(btnGetStarted:)];
    // Do any additional setup after loading the view.
}
- (IBAction)btnLetsGetStarted:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"AddRequest"];
    [self.navigationController pushViewController:vc animated:YES];
    
}


-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
    [super viewWillAppear:animated];
    self.navigationItem.titleView = nil;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title-icon"]];
    [imgView clipsToBounds];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    imgView.frame = CGRectMake(0, 0, 70, 40);
    self.navigationItem.titleView = imgView;
    
}
- (IBAction)btnGetStarted:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"AddRequest"];
    [self.navigationController pushViewController:vc animated:YES];
    
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

@end
