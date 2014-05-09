/*
 * Brief: Data container for "Question" class
 * Author: Olivia Bradley-Willemann
 * Date: 4/2014
 * Major Mods: n/a
 *
 */

#import <Foundation/Foundation.h>

@interface Question : NSObject{
    int QuestionId;
    int UserId;
    int CourseId;
    int Comments;
    int Likes;
    int QuestionType;
    bool FlagAsInappropriate;
    bool IsPublic;
    bool Anonymous;
}

@property int QuestionId;
@property int UserId;
@property int CourseId;
@property int Comments;
@property int Likes;
@property int QuestionType;
@property bool FlagAsInappropriate;
@property bool IsPublic;
@property bool Anonymous;
@property (nonatomic, retain) NSString *Contents;
@property (nonatomic, retain) NSString *FilePath;
@property (nonatomic, retain) NSDate *DateCreated;
@property (nonatomic, retain) NSMutableArray *CommentsList;




@end
