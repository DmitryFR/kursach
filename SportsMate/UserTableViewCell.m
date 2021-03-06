//
//  UserTableViewCell.m
//  SportsMate
//
//  Created by Дмитрий Фролов on 17.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)fillCell:(NSManagedObject *)obj{
   NSString *path = [obj valueForKey:@"imagePath"];
    if ([path isEqualToString:@"default_photo.jpg"]){
        self.imageView.image = [UIImage imageNamed:@"default_photo.jpg"];
    }
    else{
        self.imageView.image = [UIImage imageWithContentsOfFile:path];}
   
    self.nameField.text = [obj valueForKey:@"name"];
    self.cityField.text = [obj valueForKey:@"city"];
    self.sportField.text = [obj valueForKey:@"sport"];
   // [self layoutIfNeeded];
}

@end
