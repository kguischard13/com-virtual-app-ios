//
//  CourseViewController.m
//  classroom
//
//  Created by Kester Guischard on 4/20/14.
//  Copyright (c) 2014 Christopher Forehand. All rights reserved.
//

#import "CourseViewController.h"

#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

@interface CourseViewController ()

@end

@implementation CourseViewController

@synthesize selCourse,currUser, containerView;




- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:.22 green:.72 blue:.80 alpha:1.0];
    self.title = selCourse.CourseTitle;
    
    NSArray *buttonNames = [NSArray arrayWithObjects:@"Notes", @"Documents", @"Questions", @"Live Discussion", nil];
    segCtrl = [[UISegmentedControl alloc] initWithItems: buttonNames];
    segCtrl.tintColor = [UIColor blackColor];
    segCtrl.frame = CGRectMake(0, 65, frameHeight, 35);
    segCtrl.backgroundColor = [UIColor whiteColor];
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:24], NSFontAttributeName, nil];
    [segCtrl setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    segCtrl.momentary = YES;
    [segCtrl addTarget:self action:@selector(SelectedSegment:) forControlEvents: UIControlEventValueChanged];
    [self.view addSubview:segCtrl ];
    
    
    CGRect  viewRect = CGRectMake(0, 100, frameHeight, frameWidth);
    containerView = [[UIView alloc] initWithFrame:viewRect];
    [self.view addSubview:containerView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) SelectedSegment: (id) sender{
    //change views of the container view
    return;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
