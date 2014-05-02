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

@synthesize test;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    test = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frameWidth*.45, frameHeight*.05)];
    test.center = CGPointMake(frameHeight/2, frameWidth*.20);
    test.textAlignment = NSTextAlignmentCenter;
    test.backgroundColor = [UIColor whiteColor];
    test.text = @"Comments";
    [self.view addSubview:test];


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
