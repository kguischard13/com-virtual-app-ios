//
//  MainMenuController.h
//  classroom
//
//  Created by Kester Guischard on 4/20/14.
//  Copyright (c) 2014 Christopher Forehand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Course.h"

@interface MainMenuController : UIViewController <UINavigationControllerDelegate>{
    int numofCourse;
    User *currUser;
    UILabel *CourseL;
}

@property int numofCourse;
@property(nonatomic, strong) User *currUser;
@property (nonatomic, strong) UILabel *CourseL;

@end
