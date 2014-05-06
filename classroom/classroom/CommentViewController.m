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

@synthesize currUser, selCourse, selQuestion, response, numofComment, commentLbl, contentString;

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
    self.view.backgroundColor = [UIColor colorWithRed:.22 green:.72 blue:.80 alpha:1.0];
	
    
    UINavigationBar *navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, frameHeight, 40)];
    
    UINavigationItem *barItems = [[UINavigationItem alloc] initWithTitle:selQuestion.Contents];
    
    UIBarButtonItem *backButton =[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonPressed)];
    UIBarButtonItem *addButton =[[UIBarButtonItem alloc] initWithTitle:@"Comment" style:UIBarButtonItemStyleBordered target:self action:@selector(addButtonPressed)];
    
    [barItems setLeftBarButtonItem:backButton];
    [barItems setRightBarButtonItem:addButton
     ];
    NSArray *barArrayItems = [[NSArray alloc]initWithObjects:barItems, nil ];
    [navbar setItems:barArrayItems];
    
    [self.view addSubview:navbar];
    
    response = [self getComments];
    
    /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Good" message:[NSString stringWithFormat:@"%@", response[0]] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    alert = nil;*/
    
    numofComment = (int)[response count];
    
    
    User *teacher = [self getTeacher:selCourse.User_Id];
    
    
    for (int i=0; i<numofComment; i++) {
        NSDictionary *dic = response[i];
        
        commentLbl = [[UILabel alloc]initWithFrame:CGRectMake(323, 150+(80*i), frameWidth*.45, frameHeight*.05)];
        //commentLbl.center = CGPointMake(frameHeight/2 , frameWidth*.20);
        
        
        
        commentLbl.textAlignment = NSTextAlignmentCenter;
        commentLbl.backgroundColor = [UIColor whiteColor];
        commentLbl.text = [NSString stringWithFormat:@"%@ %@ says:\n\n%@",teacher.FirstName, teacher.LastName, [dic objectForKey:@"Content"]];
        commentLbl.numberOfLines = 0;
        
        commentLbl.font = [UIFont systemFontOfSize:16];
        [commentLbl sizeToFit];
        
        
        
        [self.view addSubview:commentLbl];
    }
    


}



-(id) getComments{
    NSString *str = [NSString stringWithFormat:@"http://vcr-env.elasticbeanstalk.com/comment/getcomments/question/%d", selQuestion.QuestionId];
    NSURL *url=[NSURL URLWithString:str];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSError *error=nil;
    
    if (data)
    {
        return [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:&error];
    } else
    {
        NSLog(@"No data");
        return nil;
    }
    
}

-(User*) getTeacher: (int) userid{
    
    
    NSString *str = [NSString stringWithFormat:@"http://vcr-env.elasticbeanstalk.com/user/getuser/%d",userid ];
    NSURL *url=[NSURL URLWithString:str];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSError *error=nil;
    id responses =[NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error:&error];
    User* teacher = [[User alloc] init];
    
    
    NSDictionary *dataRes = responses;
        //NSLog(@"Account Type: %@", [dataRes objectForKey:@"Id"]);
        
        
    teacher.Id = [[dataRes objectForKey:@"Id"] intValue];
    teacher.FirstName = [dataRes objectForKey:@"FirstName"];
    teacher.LastName = [dataRes objectForKey:@"LastName"];
    teacher.PhoneNumber = [dataRes objectForKey:@"PhoneNumber"];
    teacher.Email = [dataRes objectForKey:@"Email"];
    teacher.Password = [dataRes objectForKey:@"Password"];
    teacher.AccountType = [dataRes objectForKey:@"AccountType"];
        
    return teacher;
    
        /*UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:user.FirstName delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
         [alert show];
         alert = nil;*/
        
        //
        
        //NSLog(@"Your JSON Object: %@ Or Error is: %@", response , error);
        
    
}

-(void) backButtonPressed{
    //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Good" message:@"Worked" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    //[alert show];
    //alert = nil;
    
    self.currUser = nil;
    self.selQuestion = nil;
    self.selCourse = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) addButtonPressed{
    UIAlertView *addCommentAlert = [[UIAlertView alloc] initWithTitle:@"Comment" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: @"Add",nil];
    
    [addCommentAlert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    
    [[addCommentAlert textFieldAtIndex:0] setPlaceholder:@"Type Comment"];
    [addCommentAlert show];
}



-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        contentString = [[alertView textFieldAtIndex:0] text];
        
        NSDate *today = [NSDate date];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy/dd/MM"];
        NSString *dateString = [dateFormat stringFromDate:today];
        //NSLog(@"date: %@", dateString);
        
        Comment *newComment = [[Comment alloc]init];
        
        newComment.QuestionId = selQuestion.QuestionId;
        newComment.UserId = currUser.Id;
        newComment.Content =contentString;
        newComment.DateCreated = [dateFormat dateFromString:dateString];
        
        //NSString *jsonString = [NSString stringWithFormat:@"QuestionId=%d&UserId=%d&Content=%@&DateCreated=%@", newComment.QuestionId, newComment.UserId, newComment.Content, newComment.DateCreated];
        //NSLog(@":%@", jsonString);
        
        
        //NSString *post = [NSString stringWithFormat:@"example=test&p=1&test=yourPostMessage&this=isNotReal"];
        NSMutableDictionary *jsonDic=[[NSMutableDictionary alloc]init];
        
        [jsonDic setObject:[NSString stringWithFormat:@"%d", newComment.QuestionId] forKey:@"QuestionId"];
        [jsonDic setObject:[NSString stringWithFormat:@"%d", newComment.UserId]forKey:@"UserId"];
        [jsonDic setObject:newComment.Content forKey:@"Content"];
        [jsonDic setObject:[NSString stringWithFormat:@"%@", newComment.DateCreated] forKey:@"DateCreated"];
        NSError *error = nil;
        NSData *postData = [NSJSONSerialization dataWithJSONObject:jsonDic options:NSJSONWritingPrettyPrinted error:&error];
        //NSData *postData = [jsonString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *jsonString =[[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
        //NSString *temp = [[NSString alloc] initWithData:postData encoding:NSUTF8StringEncoding];
        
        //postData = [temp dataUsingEncoding:NSUTF8StringEncoding];
        
        //NSLog(@"%@", postData);
        
        NSData *responseData = nil;
        NSString *urlString = [NSString stringWithFormat:@"http://localhost:8080/app/comment/createcomment/%d/", selCourse.User_Id];
        NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        responseData = [NSMutableData data];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        NSString *bodydata = [NSString stringWithFormat:@"data=%@", jsonString];
        
        [request setHTTPMethod:@"POST"];
        NSData *req = [NSData dataWithBytes:[bodydata UTF8String] length:[bodydata length]];
        [request setHTTPBody:req];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        NSURLResponse *URLresponse;
        
        responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&URLresponse error:&error];
        NSLog(@"%@", [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
        /*
          NSString *postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];
         NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        //NSString *url = [NSString stringWithFormat:@"http://vcr-env.elasticbeanstalk.com/comment/createcomment/%d/", selCourse.User_Id];
        //NSString *url = [NSString stringWithFormat:@"http://localhost:8080/app/comment/createcomment/%d/", selCourse.User_Id];
        [request setURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        //[request setValue:@"application/x-www-form-urlencoded;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];*/
        
        //NSURLConnection *POSTReply = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        //[POSTReply start];
        //NSLog(@"\n\nReply: %@", POSTReply);
        
        //NSURLResponse *URLresponse;
        //NSData *POSTReply = [NSURLConnection sendSynchronousRequest:request returningResponse:&URLresponse error:nil];
        //NSString *theReply = [[NSString alloc] initWithBytes:[POSTReply bytes] length:[POSTReply length] encoding: NSASCIIStringEncoding];
        //NSLog(@"\n\nReply: %@", URLresponse);
        //NSLog(@"\n\nReply: %@", theReply);
    }
}



-(BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView{
    NSString *inputText = [[alertView textFieldAtIndex:0] text];
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    if ([[inputText stringByTrimmingCharactersInSet: set] length] != 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
/*
#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)Bresponse {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    //_responseData = [[NSMutableData alloc] init];
    
    NSLog(@"\n\nRespone:%@",Bresponse);
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    //[_responseData appendData:data];
    
    NSLog(@"\n\nData %@", data);
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}*/

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
