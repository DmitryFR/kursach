//
//  enterViewController.m
//  SportsMate
//
//  Created by Дмитрий Фролов on 15.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import "enterViewController.h"



@interface enterViewController (){
NSManagedObjectContext *context;
    AppDelegate *appdelegate;}

@end

@implementation enterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideKeyboardWhenBackgroungIsTapped];
    self.email.delegate = self;
    self.pass.delegate = self;
    
    
    appdelegate = [[UIApplication sharedApplication]delegate];
    context = appdelegate.persistentContainer.viewContext;

}
// корректное скрытие клавиатуры
-(void) hideKeyboardWhenBackgroungIsTapped{
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
    [tgr setCancelsTouchesInView:NO];
    [self.view addGestureRecognizer:tgr];
    
}
-(void)hideKeyboard{
    [self.view endEditing:YES];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
}

// проверка вводимой информации на правильность
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if (([self.email.text isEqualToString:@""])&&([self.pass.text isEqualToString: @""])){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Все поля должны быть заполнены" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [self hideKeyboard];
        [alert show];
        return NO;
    }
    else {
        NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        [request setEntity:entityDesc];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"email like %@ and password like %@", self.email.text,self.pass.text];
        [request setPredicate:predicate];
        NSArray *matchingData = [context executeFetchRequest:request error:nil];
        if (matchingData.count == 0){
            UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:nil message:@"Неправильный email или пароль!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [self hideKeyboard];
            [alert1 show];
            return NO;
        }
        else{
            self.currentUser = matchingData[0];
            

            return YES;
        }
    }

}

//передача информации в следующую форму
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    self.tbController = (UITabBarController *)[segue destinationViewController];
    self.profile = [self.tbController.viewControllers objectAtIndex:0];
    
    self.profile.currentUser = self.currentUser;
}


@end
