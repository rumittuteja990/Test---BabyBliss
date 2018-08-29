//
//  BabysittersListViewControlleViewController.m
//  BabyBliss
//
//  Created by Rumit Singh Tuteja on 4/4/17.
//  Copyright © 2017 Rumit Singh Tuteja. All rights reserved.
//

#import "BabysittersListViewControlleViewController.h"
#import "BabySittersListCellTableViewCell.h"

@interface BabysittersListViewControlleViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *arrBabysitters;
    NSMutableArray *arrBabysitterImages;
    NSMutableArray  *arrBabySiterDetails;
}
@end

@implementation BabysittersListViewControlleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrBabysitters = [NSMutableArray arrayWithArray:@[@"JANE SMITH",@"MICHAEL MURRAY",@"JOHN MATTHEW"]];
    arrBabysitterImages = [NSMutableArray arrayWithArray:@[@"baby-list-item",@"baby-list-item-1",@"baby-list-item"]];
    arrBabySiterDetails = [NSMutableArray arrayWithArray:@[@"4 years of exp.\nNew York\n$14 - $19",@"3 years of exp.\nNew York\n$12 - $16",@"3 years of exp.\nNew York\n$10 - $15"]];
    [_tblView registerNib:[UINib nibWithNibName:@"BabySittersListCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"babysitterListCell"];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrBabySiterDetails.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    UIView *viewPageTitle = [[NSBundle mainBundle] loadNibNamed:@"Views" owner:nil options:nil][1];
    return viewPageTitle.frame.size.height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *viewPageTitle = [[NSBundle mainBundle] loadNibNamed:@"Views" owner:nil options:nil][1] ;
    return viewPageTitle;

}
- (IBAction)btnSortByRelevance:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Sort Babysitters By" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *experience=[UIAlertAction actionWithTitle:@"Years of experience, high to low" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *experience1 = [UIAlertAction actionWithTitle:@"Years of experience, low to high" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *price = [UIAlertAction actionWithTitle:@"Dollars charged per hour, high to low" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *price1 = [UIAlertAction actionWithTitle:@"Dollars charged per hour, low to high" style:UIAlertActionStyleDefault handler:nil];

    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"Nevermind, its good this way." style:UIAlertActionStyleDestructive handler:nil];

    [alert addAction:experience];
    [alert addAction:experience1];
    [alert addAction:price];
    [alert addAction:price1];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BabySittersListCellTableViewCell *cell = [_tblView dequeueReusableCellWithIdentifier:@"babysitterListCell"];
    cell.lblName.text = arrBabysitters[indexPath.row];
    cell.lblDetails.text = arrBabySiterDetails[indexPath.row];
    cell.imgView.image = [UIImage imageNamed:arrBabysitterImages[indexPath.row]];
    
    [cell.btnSendrequest setTitle:!self.isRequestPage ? @"Confirm Session" : @"Send Request" forState:UIControlStateNormal];
    [cell.btnSendrequest setTitle:!self.isRequestPage ? @"Session Confirmed!" : @"Request Sent" forState:UIControlStateSelected];
    [cell.btnSendrequest addTarget:self action:@selector(btnSendRequestAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.btnSendrequest setSelected:NO];
    cell.btnSendrequest.tag = indexPath.row;
    return cell;
}

-(void)btnSendRequestAction:(UIButton *)btn{
    NSString *strMessage = [NSString stringWithFormat:@"We have requested %@ for a session on your behalf. They would respond to your request shortly.",arrBabysitters[btn.tag]];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Thank you!" message:strMessage preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelaction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [arrBabySiterDetails removeObjectAtIndex:btn.tag];
    [arrBabysitters removeObjectAtIndex:btn.tag];
    [arrBabysitterImages removeObjectAtIndex:btn.tag];
    [_tblView reloadData];
    [alert addAction:cancelaction];
    [self presentViewController:alert animated:YES completion:nil];
    [btn setSelected:YES];
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
