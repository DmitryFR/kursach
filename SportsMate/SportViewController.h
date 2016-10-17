//
//  SportViewController.h
//  SportsMate
//
//  Created by Дмитрий Фролов on 10.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ProfileViewController.h"
@interface SportViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate>{
    
    
    IBOutlet UIPickerView *sportPicker;
    
    
    
}
@property (weak, nonatomic) IBOutlet UITextField *sportField;
@property (strong, nonatomic)NSMutableArray *sportArr;
@property (retain, nonatomic)NSManagedObject *userInf;
- (IBAction)doneBtnPressed:(id)sender;

@property (strong, nonatomic)UITabBarController *tbController;
@property (strong, nonatomic)ProfileViewController *profile;
@end
