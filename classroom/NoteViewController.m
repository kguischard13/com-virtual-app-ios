//
//  NoteViewController.m
//  classroom
//
//  Created by Christopher Forehand on 4/10/14.
//  Copyright (c) 2014 Christopher Forehand. All rights reserved.
//

#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

#import "NoteViewController.h"


@implementation NoteViewController

@synthesize lblCurrentLocation;
@synthesize txtViewLocation;
@synthesize btnSubmitComp, viewMyLocation, btnViewComps, btnViewRecos;
@synthesize managedObjectContext;

- (id)init
{
    if(self == [super init])
    {
        self.view.backgroundColor = [UIColor colorWithRed:.22 green:.72 blue:.80 alpha:1.0];
        self.title = @"City Works - Home";
        
        // test to make sure everything works
        lblCurrentLocation = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frameWidth*.45, frameHeight*.05)];
        lblCurrentLocation.center = CGPointMake(frameHeight/2, frameWidth*.20);
        lblCurrentLocation.textAlignment = NSTextAlignmentCenter;
        lblCurrentLocation.backgroundColor = [UIColor whiteColor];
        lblCurrentLocation.text = @"Current Location";
        [self.view addSubview:lblCurrentLocation];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
