//
//  DopInfoViewController.h
//  SportsMate
//
//  Created by Дмитрий Фролов on 10.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface DopInfoViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate>{
    
    
    IBOutlet UIPickerView *gendrePicker;
    
    NSMutableArray *genderArr;
    NSMutableArray *dateArr;
    IBOutlet UIDatePicker *birthPicker;
    
    
}


@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *phoneField;

@property (strong, nonatomic) IBOutlet UITextField *cityField;

@property (weak, nonatomic) IBOutlet UITextField *birthDate;

@property (weak, nonatomic) IBOutlet UITextField *genderField;

@property (retain,nonatomic)NSManagedObject *creatingUser;



@property (strong, nonatomic) IBOutlet UIView *pickerViewContainer;

@property (weak, nonatomic) IBOutlet UIView *dateViewContainer;
- (IBAction)birthDateBtn:(id)sender;
- (IBAction)genderBtn:(id)sender;
- (IBAction)kkBirth:(id)sender;
- (IBAction)kkGender:(id)sender;
- (IBAction)getBirthDate:(id)sender;


@end
