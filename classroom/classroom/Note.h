//
//  Note.h
//  classroom
//
//  Created by Christopher Forehand on 4/9/14.
//  Copyright (c) 2014 Christopher Forehand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject

@property (nonatomic, retain) NSNumber * noteId;
@property (nonatomic, retain) NSNumber * courseId;
@property (nonatomic, retain) NSNumber * ownerId;
@property (nonatomic, retain) NSString * filepath;
@property (nonatomic, retain) NSDate * dateCreated;

@end