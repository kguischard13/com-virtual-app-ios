//
//  QuestionViewController.m
//  classroom
//
//  Created by Kester Guischard on 4/23/14.
//  Copyright (c) 2014 Christopher Forehand. All rights reserved.
//

#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

#import "QuestionViewController.h"

@interface QuestionViewController ()

@end

@implementation QuestionViewController

@synthesize test, currUser, selCourse, response, questionList, question, numOfQuestions, questionText, qLabel, qButton;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
    test = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frameWidth*.45, frameHeight*.05)];
    test.center = CGPointMake(frameHeight/2, frameWidth*.20);
    test.textAlignment = NSTextAlignmentCenter;
    test.backgroundColor = [UIColor whiteColor];
    test.text = @"Questions";
    [self.view addSubview:test];
    */
    
    
    self.view.backgroundColor = [UIColor colorWithRed:.22 green:.72 blue:.80 alpha:1.0];
	self.title = @"Questions";
    
    
    
    response = [self getStudentQuestions];
    //response = [self getQuestion: 1];
    
    /*
     test = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frameWidth*.250, frameHeight*.05)];
     test.center = CGPointMake(frameHeight/2, frameWidth*.20);
     test.textAlignment = NSTextAlignmentCenter;
     test.backgroundColor = [UIColor whiteColor];
     test.text = response;
     [self.view addSubview:test];
    */
    
     
    
    numOfQuestions = (int) [response count];
    questionList = [[NSMutableArray alloc] initWithObjects: nil];
    Question* dbQuestion = [[Question alloc] init];
    
    for (int i =0; i < numOfQuestions; i++)
    {
        NSDictionary *dic = response[i];
        
        dbQuestion.QuestionId = [[dic objectForKey:@"Id"] intValue];
        dbQuestion.UserId = [[dic objectForKey:@"UserId"] intValue];
        dbQuestion.CourseId = [[dic objectForKey:@"CourseId"] intValue];
        dbQuestion.Comments = [[dic objectForKey:@"Comments"] intValue];
        dbQuestion.Likes = [[dic objectForKey:@"AmtOfLikes"] intValue];
        dbQuestion.QuestionType = [[dic objectForKey:@"QuestionType"] intValue];
        dbQuestion.FlagAsInappropriate = [[dic objectForKey:@"Flag"] boolValue];
        dbQuestion.IsPublic = [[dic objectForKey:@"Public"] boolValue];
        dbQuestion.Anonymous = [[dic objectForKey:@"Anonymous"] boolValue];
        dbQuestion.Contents = [dic objectForKey:@"Contents"];
        dbQuestion.FilePath = [dic objectForKey:@"FilePath"];
        dbQuestion.DateCreated = [dic objectForKey:@"DateCreated"];
        
        [questionList addObject:dbQuestion];
        
        /*
        qButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        qButton.frame = CGRectMake(323, 177+(80*i), 382, 60);
        qButton.opaque = YES;
        qButton.layer.cornerRadius = 12;
        qButton.clipsToBounds = YES;
        qButton.backgroundColor = [UIColor lightGrayColor];
        qButton.tag = i;
        [qButton setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
        [qButton.titleLabel setFont:[UIFont systemFontOfSize: 24]];
        [qButton setTitle:[dic objectForKey:@"Contents"] forState:UIControlStateNormal];
        [qButton addTarget:self action:@selector(QuestionSelector:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview: qButton];
        */
        
        
        qButton = [[UIButton alloc] initWithFrame:CGRectMake(350, 200 + (90 * i), frameHeight*.30, frameWidth*.10)];
        [qButton setTitle:[dic objectForKey:@"Contents"] forState:UIControlStateNormal];
        [[qButton layer] setBorderWidth:2.0f];
        [[qButton layer] setCornerRadius:4.0];
        [[qButton layer] setBorderColor:[UIColor whiteColor].CGColor];
        qButton.tag = i;
        [qButton addTarget:self action:@selector(questionSelector:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:qButton];


    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"+" style:UIBarButtonItemStylePlain target:self action:@selector(addQuestion)];
    
}

//Retrieve all questions for a given course and student
- (id) getStudentQuestions
{
    int userid = currUser.Id;
    int courseid = selCourse.CourseId;
    
    NSString *str = [NSString stringWithFormat:@"http://vcr-env.elasticbeanstalk.com/question/getquestions/user/%d/course/%d", userid, courseid];
    NSURL *url = [NSURL URLWithString:str];
    NSData *data = [NSData dataWithContentsOfURL:url];
    //NSLog(@"Data?: %@", data);
    NSError *error = nil;
    if (data)
    {
        return [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:&error];
    } else
    {
        NSLog(@"No data");
        return nil;
    }
}


- (id) getQuestion: (int) qid
{
    NSString *str = [NSString stringWithFormat:@"http://vcr-env.elasticbeanstalk.com/question/getquestion/question/%d/user/%d/course/%d", qid, currUser.Id, selCourse.CourseId];
    NSURL *url = [NSURL URLWithString:str];
    NSData *data = [NSData dataWithContentsOfURL:url];
    //NSLog(@"Data?: %@", data);
    NSError *error = nil;
    if (data)
    {
        return [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:&error];
    } else
    {
        NSLog(@"No data");
        return nil;
    }
}


- (void) addQuestion: (NSString*) questionText
{
    
}



- (void) questionSelector
{
    
}


- (void) didReceiveMemoryWarning
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
