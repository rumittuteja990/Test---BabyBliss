//
//  BSProfileManager.m
//  BabyBliss
//
//  Created by Rumit Singh Tuteja on 4/18/17.
//  Copyright © 2017 Rumit Singh Tuteja. All rights reserved.
//

#import "BSProfileManager.h"
#import "BabysitterProfile.h"

@implementation BSProfileManager

+(NSArray *)fetchBabysitterProfiles{
    //read babysitters from the plist and return to bs prfiles list
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"Babysitters" ofType:@"plist"];
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:filepath];
    NSLog(@"babysiters : %@",plist);
    NSArray *arrProfiesDicts = plist[@"Babysitters"];
    NSMutableArray *arrBSProfiles = [[NSMutableArray alloc] init];
    [arrProfiesDicts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dict = (NSDictionary *)obj;
        BabysitterProfile *objBSProfile = [[BabysitterProfile alloc] createProfile:dict];
        [arrBSProfiles addObject:objBSProfile];
    }];
    return arrBSProfiles;
}

@end
