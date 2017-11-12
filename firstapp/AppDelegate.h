//
//  AppDelegate.h
//  firstapp
//
//  Created by Cheng Hu on 11/12/17.
//  Copyright © 2017 Cheng Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

