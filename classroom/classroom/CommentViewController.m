//
//  CommentViewController.m
//  classroom
//
//  Created by O on 4/29/14.
//  Copyright (c) 2014 Christopher Forehand. All rights reserved.
//

#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

#import "CommentViewController.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

<<<<<<< HEAD
@synthesize test;
=======
@synthesize currUser, selCourse, selQuestion, response, numofComment ;
>>>>>>> kguischard13-master

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

<<<<<<< HEAD
- (void)viewDidLoad
{
    [super viewDidLoad];
    test = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frameWidth*.45, frameHeight*.05)];
=======


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:.22 green:.72 blue:.80 alpha:1.0];
	self.title = @"Comment";
    
    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, frameHeight, 40)];
    
    UINavigationItem *barItems = [[UINavigationItem alloc] initWithTitle:selQuestion.Contents];
    
    UIBarButtonItem *backButton =[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonPressed)];
    
    [barItems setLeftBarButtonItem:backButton];
    NSArray *barArrayItems = [[NSArray alloc]initWithObjects:barItems, nil ];
    [navbar setItems:barArrayItems];
    
    [self.view addSubview:navbar];
    /*test = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frameWidth*.45, frameHeight*.05)];
>>>>>>> kguischard13-master
    test.center = CGPointMake(frameHeight/2, frameWidth*.20);
    test.textAlignment = NSTextAlignmentCenter;
    test.backgroundColor = [UIColor whiteColor];
    test.text = @"Comments";
<<<<<<< HEAD
    [self.view addSubview:test];
=======
    [self.view addSubview:test];*/
>>>>>>> kguischard13-master


}

<<<<<<< HEAD
=======
-(void) backButtonPressed{
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Good" message:@"Worked" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    //[alert show];
    //alert = nil;
    
    self.currUser = nil;
    self.selQuestion = nil;
    self.selCourse = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

>>>>>>> kguischard13-master
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
