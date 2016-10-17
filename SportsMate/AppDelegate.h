//
//  AppDelegate.h
//  SportsMate
//
//  Created by Дмитрий Фролов on 09.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

