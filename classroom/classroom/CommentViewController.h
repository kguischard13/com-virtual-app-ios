//
//  CommentViewController.h
//  classroom
//
//  Created by O on 4/29/14.
//  Copyright (c) 2014 Christopher Forehand. All rights reserved.
//

#import <UIKit/UIKit.h>
<<<<<<< HEAD
#import "QuestionViewController.h"

@interface CommentViewController : UIViewController{
    UILabel *test;
}

@property (nonatomic, strong) UILabel *test;
=======
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
>>>>>>> kguischard13-master


@end
