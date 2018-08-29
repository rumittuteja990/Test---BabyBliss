//
//  Feedback.m
//  BabyBliss
//
//  Created by Rumit Singh Tuteja on 4/18/17.
//  Copyright © 2017 Rumit Singh Tuteja. All rights reserved.
//

#import "Feedback.h"

@implementation Feedback

+(Feedback *)addFeedback:(NSString *)strTestimonial andRating:(NSString *)rating{
    Feedback *feedback = [[Feedback alloc] init];
    feedback.strRating = rating;
    feedback.strTestimonial = strTestimonial;
    return feedback;
}

@end
