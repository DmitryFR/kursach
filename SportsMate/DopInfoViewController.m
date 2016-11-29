//
//  DopInfoViewController.m
//  SportsMate
//
//  Created by Дмитрий Фролов on 10.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import "DopInfoViewController.h"
#import "AppDelegate.h"
#import "SportViewController.h"
@interface DopInfoViewController (){
    AppDelegate *appdelegate;
    NSManagedObjectContext *context;
}

@end

@implementation DopInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // назначения делегатов полей ввода
    [[self nameField]setDelegate:self ];
    [[self phoneField]setDelegate:self];
    [[self cityField]setDelegate:self];
    // вызов метода скрывание клавиатуры по нажатию на любую область вне клавиатуры
    [self hideKeyboardWhenBackgroungIsTapped];
    
    //инициализация массива пола
    genderArr = [[NSMutableArray alloc] init];
    [genderArr addObject:@"Мужской"];
    [genderArr addObject:@"Женский"];
    
    //создания помощника сохранения в базу данных
    appdelegate = [[UIApplication sharedApplication]delegate];
    context = appdelegate.persistentContainer.viewContext;
}

-(void)viewDidAppear:(BOOL)animated{
    //отрисовка контейнеров для выплывающих списков
    self.dateViewContainer.frame = CGRectMake(0,700,375,290);
    self.pickerViewContainer.frame = CGRectMake(0, 700, 375, 290);
    
    
}
// Настройка PickerVIew
//количество столбцов в выплывающем списке
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)gendrePicker {
    return 1;
    
}
//количество рядов в выплывающем списке
-(NSInteger)pickerView:(UIPickerView *)gendrePicker numberOfRowsInComponent:(NSInteger)component {
    return [genderArr count];
    
}
//назначение надписи в ряде в выплывающем списке
-(NSString *)pickerView:(UIPickerView *)gendrePicker titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [genderArr objectAtIndex:row];
}
//если выбран какой -то ряд, то записывать значение ряда в соответствующий label
-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.genderField.textColor = [UIColor blackColor];
    self.genderField.text = [genderArr objectAtIndex:[pickerView selectedRowInComponent:0]];
}

// Анимация всплывания  и скрытия списка с датами рождения
//всплывание
- (IBAction)birthDateBtn:(id)sender {
    [self.dateViewContainer setHidden:NO];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.dateViewContainer.frame = CGRectMake(0, 390, 375, 290);
    self.pickerViewContainer.frame = CGRectMake(0, 700, 375, 290);
    [self.pickerViewContainer setHidden:YES];
    [UIView commitAnimations];
    
}
//скрытие
- (IBAction)kkBirth:(id)sender {
    [self.dateViewContainer setHidden:YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    self.dateViewContainer.frame = CGRectMake(0, 700, 375, 290);
    [UIView commitAnimations];
}

//Анимация всплывания и скрытия спсиска с полом

//всплывание
- (IBAction)genderBtn:(id)sender {
    [self.pickerViewContainer setHidden: NO];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.pickerViewContainer.frame = CGRectMake(0,390, 375, 290);
    self.dateViewContainer.frame = CGRectMake(0, 700, 375, 290);
    [self.dateViewContainer setHidden:YES];
    [UIView commitAnimations];
}

//скрытие
- (IBAction)kkGender:(id)sender {
    [self.pickerViewContainer setHidden: YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    self.pickerViewContainer.frame = CGRectMake(0, 700, 375, 290);
    [UIView commitAnimations];
}

//установка формата получения даты с DataPicker
- (IBAction)getBirthDate:(id)sender {
    NSDate *selected = [birthPicker date];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];
    NSString *resDate = [format stringFromDate:selected];
    
    
    self.birthDate.textColor = [UIColor blackColor];
    self.birthDate.text = resDate;
}
//Скрывание клавиатуры
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

// запись в базу данных перед переходом на другую форму
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"ToSport"]){
       
        
        [self.creatingUser setValue:self.nameField.text forKey:@"name"];
        [self.creatingUser setValue:self.phoneField.text forKey:@"phone"];
        [self.creatingUser setValue:self.cityField.text forKey:@"city"];
        [self.creatingUser setValue:self.birthDate.text forKey:@"birth"];
        [self.creatingUser setValue:self.genderField.text forKey:@"gender"];
        [self.creatingUser setValue:0 forKey:@"winrate"];
        [self.creatingUser setValue:self.additionalInfo.text forKey:@"additional"];
        [self.creatingUser setValue:@"default_photo.jpg" forKey:@"imagePath"];
        [appdelegate saveContext];
        SportViewController *sc = (SportViewController *)segue.destinationViewController;
        sc.userInf = self.creatingUser;
        
                                       
    }
}

@end
