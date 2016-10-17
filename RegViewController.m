//
//  RegViewController.m
//  SportsMate
//
//  Created by Дмитрий Фролов on 10.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import "RegViewController.h"
#import "AppDelegate.h"
#import "DopInfoViewController.h"
//#import "User+CoreDataProperties.h"
@interface RegViewController ()
{
    NSManagedObjectContext *context;
    AppDelegate *appdelegate;
}

@end

@implementation RegViewController




- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self hideKeyboardWhenBackgroungIsTapped];
    self.email.delegate = self;
    self.pass1.delegate = self;
    self.pass2.delegate = self;
    
    appdelegate = [[UIApplication sharedApplication]delegate];
    context = appdelegate.persistentContainer.viewContext;
    
}



-(void)viewDidAppear:(BOOL)animated{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



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



-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if([identifier isEqualToString:@"ToDopInfo"]){
        if (([self.email.text isEqualToString: @""])&&([self.pass1.text isEqualToString:@""])&&([self.pass2.text isEqualToString:@""])){
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Все поля должны быть заполнены" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [self hideKeyboard];
            [alert show];
            return NO;
            
        }
        else if ([self.pass1.text  compare:self.pass2.text ]){
            UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:nil message:@"Пароль должны совпадать!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [self hideKeyboard];
            [alert1 show];
            return NO;
        }
        else{

            NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
            NSFetchRequest *request = [[NSFetchRequest alloc]init];
            [request setEntity:entityDesc];
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"email like %@", self.email.text];
            [request setPredicate:predicate];
            NSArray *matchingData = [context executeFetchRequest:request error:nil];
            if (matchingData.count == 0){
                self.regnewUser = [[NSManagedObject alloc]initWithEntity:entityDesc insertIntoManagedObjectContext:context];
                [self.regnewUser setValue:self.email.text forKey:@"email"];
                [self.regnewUser setValue:self.pass1.text forKey:@"password"];
                [appdelegate saveContext];
                
                
                
           }
            else {
                
                UIAlertView *alert2 = [[UIAlertView alloc]initWithTitle:nil message:@"Данный email уже используется!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [self hideKeyboard];
                [alert2 show];
                return NO;
            }

                return YES;
                
            }
            
        
        
    }
    return NO;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ToDopInfo"]){
        DopInfoViewController *vc = (DopInfoViewController *)segue.destinationViewController;
        vc.creatingUser = self.regnewUser;
    }
}


@end
