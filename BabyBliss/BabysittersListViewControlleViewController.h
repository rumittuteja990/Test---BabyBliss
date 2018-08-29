//
//  BabysittersListViewControlleViewController.h
//  BabyBliss
//
//  Created by Rumit Singh Tuteja on 4/4/17.
//  Copyright © 2017 Rumit Singh Tuteja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BabysittersListViewControlleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property BOOL isRequestPage;
@end
