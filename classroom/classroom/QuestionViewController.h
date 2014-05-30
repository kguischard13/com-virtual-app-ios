/*
 * Brief: Controller for "Question" view class
 * Author: Olivia Bradley-Willemann
 * Date: 4/2014
 * Major Mods: n/a
 *
 */

#import <UIKit/UIKit.h>

#import "CommentViewController.h"
#import "User.h"
#import "Question.h"
#import "Course.h"


@interface QuestionViewController : UIViewController{
    UILabel *test;
    UIButton *qButton;
    User *currUser;
    Course *selCourse;
    id response;
    
    NSMutableArray *questionList;
    Question *question;
    int numOfQuestions;
    UITextField *questionText;
    UILabel *qLabel;
    CommentViewController *commentViewCtrl;
}

@property (nonatomic, strong) NSMutableArray *questionList;
@property int numOfQuestions;
@property (nonatomic, strong) UITextField *questionText;
@property (nonatomic, strong) UILabel *qLabel;
@property (nonatomic, strong) Question *question;

    @property id response;
    @property (nonatomic, strong) UILabel *test;
    @property (nonatomic, strong) UIButton *qButton;
    @property (nonatomic, strong) User *currUser;
    @property (nonatomic, strong) Course *selCourse;

    

@property (nonatomic, strong) CommentViewController *commentViewCtrl;




@end
