/*
 * Brief: Data container for "Comment" class
 * Author: Olivia Bradley-Willemann
 * Date: 4/2014
 * Major Mods: n/a
 *
 */

#import <Foundation/Foundation.h>


@interface Comment : NSObject{
    int Id;
    int QuestionId;
    int UserId;
}

@property int Id;
@property int QuestionId;
@property int UserId;
@property (nonatomic, retain) NSString *Content;
@property (nonatomic, retain) NSDate *DateCreated;

@end
