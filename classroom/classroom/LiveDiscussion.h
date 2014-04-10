//
//  LiveDiscussion.h
//  classroom
//
//  Created by Christopher Forehand on 4/9/14.
//  Copyright (c) 2014 Christopher Forehand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"

@interface LiveDiscussion : Note

@property (nonatomic, retain) NSNumber * courseSessionId;
@property (nonatomic, retain) NSArray * userList;
@property (nonatomic, retain) NSString * topic;

@end