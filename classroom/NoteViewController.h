//
//  NoteViewController.h
//  classroom
//
//  Created by Christopher Forehand on 4/10/14.
//  Copyright (c) 2014 Christopher Forehand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Enums.h"

@interface NoteViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate>
{
	
    UILabel *lblCurrentLocation;
    UITextView *txtViewLocation;
    UIButton *btnSubmitComp, *viewMyLocation, *btnViewComps, *btnViewRecos;
    NSManagedObjectContext *managedObjectContext; // pointer to the object context
}

@property(nonatomic, retain) IBOutlet UILabel *lblCurrentLocation;
@property(nonatomic, retain) UITextView *txtViewLocation;
@property(nonatomic, retain) UIButton *btnSubmitComp, *viewMyLocation, *btnViewComps, *btnViewRecos;
@property(nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end
