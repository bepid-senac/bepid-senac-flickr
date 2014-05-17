//
//  YMAppDelegate.h
//  TesteFlickr
//
//  Created by pedro  paulo on 3/12/14.
//  Copyright (c) 2014 pedro paulo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YMViewController.h"

@interface YMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
