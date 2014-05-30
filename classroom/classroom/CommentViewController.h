/*
 * Brief: Controller for "Question" view class
 * Author: Olivia Bradley-Willemann
 * Date: 4/2014
 * Major Mods: n/a
 *
 */

#import <UIKit/UIKit.h>
<<<<<<< HEAD

@interface CommentViewController : UIViewController{
    UILabel *test;
}

@property (nonatomic, strong) UILabel *test;

=======
>>>>>>> 98be5bb2d1663d57f888ac9082c2debac513cf30
#import "User.h"
#import "Question.h"
#import "Course.h"
#import "Comment.h"

@interface CommentViewController : UIViewController<UIAlertViewDelegate, NSURLConnectionDelegate,NSURLConnectionDataDelegate>{
    User* currUser;
    Course* selCourse;
    Question* selQuestion;
    id response;
    int numofComment;
    UILabel *commentLbl;
    NSString *contentString;
}

@property id response;
@property int numofComment;
@property (nonatomic, strong) User *currUser;
@property (nonatomic, strong) Course *selCourse;
@property (nonatomic, strong) Question *selQuestion;
<<<<<<< HEAD
@property (nonatomic, strong) UILabel *commentLbl;
@property (nonatomic, strong) NSString *contentString;
=======


>>>>>>> 98be5bb2d1663d57f888ac9082c2debac513cf30

@end




