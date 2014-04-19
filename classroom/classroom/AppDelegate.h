//
//  AppDelegate.h
//  classroom
//
//  Created by Christopher Forehand on 3/21/14.
//  Copyright (c) 2014 Christopher Forehand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
/*
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navCtrl;
@property (strong, nonatomic) NoteViewController *noteViewController;*/

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navCtrl; // allows to have a view stack
@property (strong, nonatomic) LoginViewController *loginController;

//@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//- (void)saveContext;
//- (NSURL *)applicationDocumentsDirectory;

@end
