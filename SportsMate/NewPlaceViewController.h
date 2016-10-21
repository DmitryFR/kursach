//
//  NewPlaceViewController.h
//  SportsMate
//
//  Created by Дмитрий Фролов on 16.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface NewPlaceViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIPopoverControllerDelegate,UIActionSheetDelegate,UITabBarControllerDelegate>{
    IBOutlet UIPickerView *sportPicker;
}
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *subwayField;
@property (weak, nonatomic) IBOutlet UITextField *adressField;
@property (weak, nonatomic) IBOutlet UITextField *sportField;
@property (retain, nonatomic)NSManagedObject *event;
@property (strong,nonatomic)NSMutableArray *sportArr;
@property (weak, nonatomic) IBOutlet UITextView *additionalInfo;

- (IBAction)selectSportBtnPressed:(id)sender;
- (IBAction)kkBtnPressed:(id)sender;
- (IBAction)addPhotoBtnPressed:(id)sender;

- (IBAction)addBtnPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIView *pickerViewContainer;

@end
