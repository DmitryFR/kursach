//
//  RegViewController.h
//  SportsMate
//
//  Created by Дмитрий Фролов on 10.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DopInfoViewController.h"


@interface RegViewController : UIViewController <UITextFieldDelegate, NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *pass1;
@property (weak, nonatomic) IBOutlet UITextField *pass2;
@property (retain,nonatomic)NSManagedObject *regnewUser;

@end
