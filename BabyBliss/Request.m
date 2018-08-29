//
//  Request.m
//  BabyBliss
//
//  Created by Rumit Singh Tuteja on 4/18/17.
//  Copyright © 2017 Rumit Singh Tuteja. All rights reserved.
//

#import "Request.h"

@implementation Request


-(id)initRequestWithDict:(NSDictionary *)dict{
    if(self == nil){
        self = [super init];
    }
    self.isScheduled = NO;
    self.isApproved = NO;
    self.isSessionComplete = NO;
    self.objParentFeedback = nil;
    self.objBabysitterFeedback = nil;
    self.strPriceCap = dict[@"priceCap"];
    self.strLocation = dict[@"location"];
    self.strDate = dict[@"date"];
    return self;
}

-(Request *)addRequest:(NSDictionary *)reqParams{
    return [self initRequestWithDict:reqParams];
}

-(void)updateApprovalStatus:(BOOL)isApproved{
    self.isApproved = isApproved;
}

-(void)updateSessionScheduleStatus:(BOOL)isScheduled{
    self.isScheduled = isScheduled;
}

-(void)updateSessionCompletionStatus:(BOOL)isSessionComplete{
    self.isSessionComplete = isSessionComplete;
}


@end
