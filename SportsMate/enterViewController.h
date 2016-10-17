//
//  enterViewController.h
//  SportsMate
//
//  Created by Дмитрий Фролов on 15.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ProfileViewController.h"

@interface enterViewController : UIViewController <UITextFieldDelegate, NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *pass;
@property (retain, nonatomic) NSManagedObject *currentUser;
-(IBAction)enterBtnPressed:(id)sender;

@property (strong, nonatomic)UITabBarController *tbController;
@property (strong, nonatomic)ProfileViewController *profile;


@end
