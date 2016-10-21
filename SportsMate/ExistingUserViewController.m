//
//  ExistingUserViewController.m
//  SportsMate
//
//  Created by Дмитрий Фролов on 17.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import "ExistingUserViewController.h"

@interface ExistingUserViewController ()

@end

@implementation ExistingUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameField.text = [self.currentUser valueForKey:@"name"];
    self.phoneField.text = [self.currentUser valueForKey:@"phone"];
    self.cityField.text = [self.currentUser valueForKey:@"city"];
    self.genderField.text = [self.currentUser valueForKey:@"gender"];
    self.birthField.text = [self.currentUser valueForKey:@"birth"];
    self.sportfield.text = [self.currentUser valueForKey:@"sport"];
    self.additionalInfo.text = [self.currentUser valueForKey:@"additional"];
    self.imageView.image = [UIImage imageWithContentsOfFile:[self.currentUser valueForKey:@"imagePath"]];
   
}


@end
