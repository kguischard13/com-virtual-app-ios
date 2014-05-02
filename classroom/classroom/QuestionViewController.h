//
//  QuestionViewController.h
//  classroom
//
//  Created by Kester Guischard on 4/23/14.
//  Copyright (c) 2014 Christopher Forehand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"


@interface QuestionViewController : UIViewController{
    UILabel *test;
    User *currUser;
    id response;
}

@property (nonatomic, strong) UILabel *test;
@property(nonatomic, strong) User *currUser;
@property id response;


@end
