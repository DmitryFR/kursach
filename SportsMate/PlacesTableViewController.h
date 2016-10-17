//
//  PlacesTableViewController.h
//  SportsMate
//
//  Created by Дмитрий Фролов on 16.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface PlacesTableViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (retain,nonatomic)NSManagedObject *currentUser;
@property (retain, nonatomic)NSManagedObject *event;


@end
