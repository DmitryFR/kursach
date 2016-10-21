//
//  ProfileViewController.h
//  SportsMate
//
//  Created by Дмитрий Фролов on 15.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "PlacesTableViewController.h"
#import "UsersTableViewController.h"


@interface ProfileViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIPopoverControllerDelegate,UIActionSheetDelegate,UITabBarControllerDelegate>{
    
    IBOutlet UIPickerView *sportPicker;
}
@property (weak, nonatomic) IBOutlet UILabel *nameField;
@property (weak, nonatomic) IBOutlet UILabel *phoneField;
@property (weak, nonatomic) IBOutlet UILabel *cityField;
@property (weak, nonatomic) IBOutlet UILabel *birthField;
@property (weak, nonatomic) IBOutlet UILabel *GenderField;
- (IBAction)exitBtnPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *sportField;
@property (weak, nonatomic) IBOutlet UIView *pickerViewContainer;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (retain,nonatomic)NSManagedObject *currentUser;
@property (weak, nonatomic) IBOutlet UIButton *takePictureBtn;
@property (strong, nonatomic)NSMutableArray *sportArr;

@property (weak, nonatomic) IBOutlet UITextView *additionalInfo;
@property(weak, nonatomic)NSArray *arr;
- (IBAction)sportHasChanged:(id)sender;


@property(strong, nonatomic)PlacesTableViewController *places;
@property (strong, nonatomic)UsersTableViewController *users;

- (IBAction)kkBtn:(id)sender;
- (IBAction)changeBtn:(id)sender;
- (IBAction)takePictureBtn:(id)sender;

@end
