/*
 * Brief: Controller for "Question" view class
 * Author: Olivia Bradley-Willemann
 * Date: 4/2014
 * Major Mods: n/a
 *
 */

#import <UIKit/UIKit.h>
#import "User.h"
#import "Question.h"
#import "Course.h"

@interface CommentViewController : UIViewController{
    User* currUser;
    Course* selCourse;
    Question* selQuestion;
    id response;
    int numofComment;
}

@property id response;
@property int numofComment;
@property (nonatomic, strong) User *currUser;
@property (nonatomic, strong) Course *selCourse;
@property (nonatomic, strong) Question *selQuestion;



@end




