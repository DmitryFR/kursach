//
//  UsersTableViewController.h
//  SportsMate
//
//  Created by Дмитрий Фролов on 17.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "UserTableViewCell.h"
#import "ExistingUserViewController.h"

@interface UsersTableViewController : UITableViewController<NSFetchedResultsControllerDelegate>


@property(retain, nonatomic)NSManagedObject *currentUser;
@property (retain, nonatomic)NSManagedObject *selectedUser;
@end
