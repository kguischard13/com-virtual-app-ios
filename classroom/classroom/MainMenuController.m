//
//  MainMenuController.m
//  classroom
//
//  Created by Kester Guischard on 4/20/14.
//  Copyright (c) 2014 Christopher Forehand. All rights reserved.
//

#import "MainMenuController.h"

@interface MainMenuController ()

@end

@implementation MainMenuController

@synthesize numofCourse, currUser, CourseL;

-(id)init{
    if (self = [super init]) {
        /*self.view.backgroundColor = [UIColor colorWithRed:.22 green:.72 blue:.80 alpha:1.0];
        self.title = @"Virtual Classroom Login";
        
        
        NSString *str = [NSString stringWithFormat:@"http://localhost:8080/app/course/getcoursesofstudent/%d", currUser.Id];
        NSURL *url=[NSURL URLWithString:str];
        NSData *data=[NSData dataWithContentsOfURL:url];
        NSError *error=nil;
        id response = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:&error];
        //id response = [self getStudentCourses];
        NSLog(@"\nYour JSON Object: %@ Or Error is", response);
        
        numofCourse = (int) [response count];
        for (int i =0; i<numofCourse; i++) {
            NSDictionary *dic = response[i];
            CourseL = [[UILabel alloc] initWithFrame: CGRectMake(416, 139+(21*i), 197, 21)];
            CourseL.text = [dic objectForKey:@"CourseCode"];
            CourseL.textAlignment = NSTextAlignmentCenter;
            CourseL.font = [UIFont fontWithName: @"Courier New-Bold" size: 30];
            CourseL.textColor = [UIColor blackColor];
            [self.view addSubview: CourseL];
        }*/
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:.22 green:.72 blue:.80 alpha:1.0];
    self.title = @"Virtual Classroom Login";
    
    
    /*NSString *str = [NSString stringWithFormat:@"http://localhost:8080/app/course/getcoursesofstudent/%d", currUser.Id];
    NSURL *url=[NSURL URLWithString:str];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSError *error=nil;
    id response = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:&error];*/
    id response = [self getStudentCourses];
    NSLog(@"\nYour JSON Object: %@ Or Error is", response);
     
     numofCourse = (int) [response count];
     for (int i =0; i<numofCourse; i++) {
         NSDictionary *dic = response[i];
         CourseL = [[UILabel alloc] initWithFrame: CGRectMake(416, 139+(21*i), 197, 21)];
         CourseL.text = [dic objectForKey:@"CourseCode"];
         CourseL.textAlignment = NSTextAlignmentCenter;
         CourseL.font = [UIFont fontWithName: @"Courier New-Bold" size: 30];
         CourseL.textColor = [UIColor blackColor];
         [self.view addSubview: CourseL];
     }
    
}

- (void) viewWillAppear: (BOOL) animated
{
	[super viewWillAppear: animated];
    //NSLog(@"\nNew View %@\n", currUser.PhoneNumber);
	
}

-(id) getStudentCourses{
    NSString *str = [NSString stringWithFormat:@"http://localhost:8080/app/course/getcoursesofstudent/%d", currUser.Id];
    NSURL *url=[NSURL URLWithString:str];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSError *error=nil;
    return [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:&error];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
