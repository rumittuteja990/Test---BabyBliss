//
//  Request.h
//  BabyBliss
//
//  Created by Rumit Singh Tuteja on 4/18/17.
//  Copyright © 2017 Rumit Singh Tuteja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ParentProfile.h"
#import "BabysitterProfile.h"
#import "Feedback.h"

@interface Request : NSObject
@property (strong,nonatomic) NSString *strName;
@property (strong,nonatomic) NSString *strDate;
@property (strong,nonatomic) NSString *strPriceCap;
@property (strong,nonatomic) NSString *strLocation;
@property Boolean isApproved;
@property Boolean isScheduled;
@property Boolean isSessionComplete;
@property (strong,nonatomic) ParentProfile *objParentProfile;
@property (strong,nonatomic) BabysitterProfile *objBabysitterProfile;
@property (strong,nonatomic) Feedback *objParentFeedback;
@property (strong,nonatomic) Feedback *objBabysitterFeedback;

@end
