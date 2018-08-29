//
//  ParentRequestsViewController.m
//  BabyBliss
//
//  Created by Rumit Singh Tuteja on 4/11/17.
//  Copyright © 2017 Rumit Singh Tuteja. All rights reserved.
//

#import "ParentRequestsViewController.h"
#import "ParentRequestCell.h"


@interface ParentRequestsViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *arrRequests;
}
@property (weak, nonatomic) IBOutlet UITableView *tblView;


@end

@implementation ParentRequestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tblView registerNib:[UINib nibWithNibName:@"ParentRequestCell" bundle:nil]  forCellReuseIdentifier:@"ParentRequestCell"];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title-icon"]];
    [imgView clipsToBounds];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    imgView.frame = CGRectMake(0, 0, 70, 40);
    self.navigationItem.titleView = imgView;
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    if(arrRequests.count == 0){
        arrRequests = [@[@{@"City":@"New York",
                           @"Schedule":@"Feb 20th, 2017 | 3:00 pm to 5:00 pm",
                           @"Name":@"Tommen Baratheon",
                           @"Image":@"baby-list-item"
                           },@{
                             @"City":@"New York",
                             @"Schedule":@"Feb 20th, 2017 | 3:00 pm to 5:00 pm",
                             @"Name":@"Jason Nance",
                             @"Image":@"baby-list-item-1"
                             }] mutableCopy];
        
        [self.tblView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"Views" owner:nil options:nil] lastObject];
        return view.frame.size.height;
    }
    return 0;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"Views" owner:nil options:nil] lastObject];
        return view;
    }
    return nil;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    self.lblNoData.hidden = true;
    if(arrRequests.count == 0){
        self.lblNoData.hidden = false;
    }
    return arrRequests.count;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 352;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ParentRequestCell *cell = (ParentRequestCell *)[tableView dequeueReusableCellWithIdentifier:@"ParentRequestCell"];
    cell.lblParentName.text = arrRequests[indexPath.row][@"Name"];
    cell.lblSchedule.text = arrRequests[indexPath.row][@"Schedule"];
    cell.lblLocation.text = arrRequests[indexPath.row][@"City"];
    cell.imgView.image = [UIImage imageNamed:arrRequests[indexPath.row][@"Image"]];
    [cell.btnDEny addTarget:self action:@selector(btnDenyClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.btnAccept.tag = indexPath.row;
    cell.btnDEny.tag = indexPath.row;
    [cell.btnAccept addTarget:self action:@selector(btnDenyClicked:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}

-(void)btnDenyClicked:(UIButton *)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Thank you!" message:@"Your response has beed recorded, the parent will be notified for the same." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelaction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [arrRequests removeObjectAtIndex:sender.tag];
    
    [alert addAction:cancelaction];
    [self presentViewController:alert animated:YES completion:nil];
    [self.tblView reloadData];
}

-(void)btnAcceptClicked:(UIButton *)sender{
    
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
