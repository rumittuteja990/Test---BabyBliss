//
//  BabysitterProfileViewController.m
//  BabyBliss
//
//  Created by Rumit Singh Tuteja on 4/11/17.
//  Copyright © 2017 Rumit Singh Tuteja. All rights reserved.
//

#import "BabysitterProfileViewController.h"
#import "BabySitterBioCellTableViewCell.h"

@interface BabysitterProfileViewController ()<UITableViewDataSource, UITableViewDelegate>{
    
    
    NSArray *arrBioNames;
    NSArray *arrBioDescs;
}


@end

@implementation BabysitterProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tblView registerNib:[UINib nibWithNibName:@"BabySitterBioCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"BSBioCell"];
    [self populateData];
    // Do any additional setup after loading the view.
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title-icon"]];
    [imgView clipsToBounds];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    imgView.frame = CGRectMake(0, 0, 70, 40);
    self.navigationItem.titleView = imgView;
    
}

-(void)populateData{
    arrBioDescs = @[@"Location",@"Price Cap",@"Expereince",@"Skills"];
    arrBioNames = @[@"New York",@"$10 - $12",@"4 years",@"CPR certified"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 1){
        return 4;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        UIView *viewHeading = [[NSBundle mainBundle] loadNibNamed:@"Views" owner:nil options:nil][2] ;
        return viewHeading.frame.size.height;
    }
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        UIView *viewHeading = [[NSBundle mainBundle] loadNibNamed:@"Views" owner:nil options:nil][3] ;
        return viewHeading;
    
    }
    
    return nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BabySitterBioCellTableViewCell *cell = (BabySitterBioCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BSBioCell"];
    cell.lblBioDEsc.text = arrBioNames[indexPath.row];
    cell.lblBioName.text = arrBioDescs[indexPath.row];
    return cell;
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
