//
//  ExistingUserViewController.h
//  SportsMate
//
//  Created by Дмитрий Фролов on 17.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ExistingUserViewController : UIViewController

@property (retain, nonatomic)NSManagedObject *currentUser;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameField;
@property (weak, nonatomic) IBOutlet UILabel *phoneField;
@property (weak, nonatomic) IBOutlet UILabel *cityField;
@property (weak, nonatomic) IBOutlet UILabel *genderField;
@property (weak, nonatomic) IBOutlet UILabel *birthField;
@property (weak, nonatomic) IBOutlet UILabel *sportfield;
@property (weak, nonatomic) IBOutlet UITextView *additionalInfo;

@end
