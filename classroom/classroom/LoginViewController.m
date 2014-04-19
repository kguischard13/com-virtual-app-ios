//
//  LoginViewController.m
//  classroom
//
//  Created by Kester Guischard on 4/18/14.
//  Copyright (c) 2014 Christopher Forehand. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

#define frameWidth self.view.frame.size.width
#define frameHeight self.view.frame.size.height

@implementation LoginViewController

@synthesize UserL, PWordL,UserText,PWordText,LoginBtn, CancelBtn;

-(id) init{
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor colorWithRed:.22 green:.72 blue:.80 alpha:1.0];
        self.title = @"Virtual Classroom Login";
        
        UserL = [[UILabel alloc] initWithFrame: CGRectMake(416, 139, 197, 21)];
        UserL.text = @"Email:";
        UserL.textAlignment = NSTextAlignmentCenter;
        UserL.font = [UIFont fontWithName: @"Courier New-Bold" size: 30];
        UserL.textColor = [UIColor blackColor];
        [self.view addSubview: UserL];
        
        UserText = [[UITextField alloc] initWithFrame: CGRectMake(323, 168, 382, 30)];
        [UserText setTextAlignment:NSTextAlignmentCenter];
        [UserText setClearButtonMode:YES];
        UserText.borderStyle = UITextBorderStyleRoundedRect;
        UserText.textColor = [UIColor blackColor];
        UserText.delegate = self;
        [self.view addSubview: UserText];
        
        PWordL = [[UILabel alloc] initWithFrame: CGRectMake(422, 250, 180, 21)];
        PWordL.text = @"Password:";
        PWordL.textAlignment = NSTextAlignmentCenter;
        PWordL.font = [UIFont fontWithName: @"Courier New-Bold" size: 30];
        PWordL.textColor = [UIColor blackColor];
        [self.view addSubview: PWordL];
        
        PWordText = [[UITextField alloc] initWithFrame: CGRectMake(323, 279, 382, 30)];
        [PWordText setTextAlignment:NSTextAlignmentCenter];
        [PWordText setClearButtonMode:YES];
        [PWordText setSecureTextEntry:YES];
        PWordText.borderStyle = UITextBorderStyleRoundedRect;
        PWordText.textColor = [UIColor blackColor];
        PWordText.delegate = self;
        [self.view addSubview: PWordText];
        
        LoginBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        LoginBtn.frame = CGRectMake(323, 361, 76, 60);
        LoginBtn.opaque = YES;
        LoginBtn.layer.cornerRadius = 12;
        LoginBtn.clipsToBounds = YES;
        LoginBtn.backgroundColor = [UIColor lightGrayColor];
        [LoginBtn setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
        [LoginBtn.titleLabel setFont:[UIFont systemFontOfSize: 15]];
        [LoginBtn setTitle:@"Login" forState:UIControlStateNormal];
        [LoginBtn addTarget:self action:@selector(LoginUser) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview: LoginBtn];
        
        CancelBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        CancelBtn.frame = CGRectMake(629, 361, 76, 60);
        CancelBtn.opaque = YES;
        CancelBtn.layer.cornerRadius = 12;
        CancelBtn.clipsToBounds = YES;
        CancelBtn.backgroundColor = [UIColor lightGrayColor];
        [CancelBtn setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
        [CancelBtn.titleLabel setFont:[UIFont systemFontOfSize: 15]];
        [CancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
        [CancelBtn addTarget:self action:@selector(ClearText) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview: CancelBtn];
        
       
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

-(void) ClearText{
    UserText.text = @"";
    PWordText.text = @"";
}

-(void) LoginUser{
    NSString *email = UserText.text;
    NSString *password = PWordText.text;
    
    if ([email isEqualToString:@""] || [password isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Enter into both fields please" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
        return;
    }
    
    NSString *str = [NSString stringWithFormat:@"http://localhost:8080/app/user/login/%@/password/%@", email, password ];
    NSURL *url=[NSURL URLWithString:str];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSError *error=nil;
    id response =[NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:&error];
    
    
    if(response != NULL){
        NSDictionary *dataRes = response;
        //NSLog(@"Account Type: %@", [dataRes objectForKey:@"Id"]);
        
        User* user = [[User alloc] init];
        user.Id = [[dataRes objectForKey:@"Id"] intValue];
        user.FirstName = [dataRes objectForKey:@"FirstName"];
        user.LastName = [dataRes objectForKey:@"LastName"];
        user.PhoneNumber = [dataRes objectForKey:@"PhoneNumber"];
        user.Email = [dataRes objectForKey:@"Email"];
        user.Password = [dataRes objectForKey:@"Password"];
        
        NSLog(@"Id: %d  First Name: %@  Last Name: %@   Phone Number: %@", user.Id, user.FirstName, user.LastName, user.PhoneNumber);
        
        //NSLog(@"Your JSON Object: %@ Or Error is: %@", response , error);
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Incorrect, please enter again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        alert = nil;
        return;
    }
    
    UserText.text=@"";
    PWordText.text = @"";
    
    
}

- (BOOL) textFieldShouldReturn: (UITextField *) txtField {
	[txtField resignFirstResponder];
	return YES;
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
