//
//  PopoverViewController.m
//  SportsMate
//
//  Created by Дмитрий Фролов on 15.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import "PopoverViewController.h"

@interface PopoverViewController ()<UIPopoverPresentationControllerDelegate>

@end

@implementation PopoverViewController

-(instancetype)init{
    if(self = [super init]){
        self.modalPresentationStyle = UIModalPresentationPopover;
        self.popoverPresentationController.delegate = self;
    }
    return self;
}
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}

@end
