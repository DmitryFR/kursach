//
//  NewPlaceViewController.m
//  SportsMate
//
//  Created by Дмитрий Фролов on 16.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import "NewPlaceViewController.h"

@interface NewPlaceViewController (){
    NSManagedObjectContext *context;
    AppDelegate *appdelegate;
}

@end

@implementation NewPlaceViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.sportArr = [[NSMutableArray alloc]init];
    [self.sportArr addObject:@"Стритбол"];
    [self.sportArr addObject:@"Бокс"];
    [self.sportArr addObject:@"Волейбол"];
    [self.sportArr addObject:@"Плавание"];
    [self.sportArr addObject:@"Теннис"];
    [self.sportArr addObject:@"Футбол"];
    [self.sportArr addObject:@"Хоккей"];
    [self.sportArr addObject:@"Шашки"];
    [self.sportArr addObject:@"Шахматы"];
    [self.sportArr addObject:@"Хоккей на траве"];
    [self.sportArr addObject:@"Флоробол"];
    [self.sportArr addObject:@"Фигурное катание"];
    [self.sportArr addObject:@"Фехтование"];
    [self.sportArr addObject:@"Ушу"];
    [self.sportArr addObject:@"Тяжелая атлетика"];
    [self.sportArr addObject:@"Тхэквондо"];
    [self.sportArr addObject:@"Тайский бокс"];
    [self.sportArr addObject:@"Стрельба из лука"];
    [self.sportArr addObject:@"Стрельба"];
    [self.sportArr addObject:@"Спортивный туризм"];
    [self.sportArr addObject:@"Сноубординг"];
    [self.sportArr addObject:@"Синхронное плавание"];
    [self.sportArr addObject:@"Самбо"];
    [self.sportArr addObject:@"Регби"];
    [self.sportArr addObject:@"Роликовый спорт"];
    [self.sportArr addObject:@"Прыжки в воду"];
    [self.sportArr addObject:@"Пауэрлифтинг"];
    [self.sportArr addObject:@"Парусный спорт"];
    [self.sportArr addObject:@"Пейнтбол"];
    [self.sportArr addObject:@"Настольный теннис"];
    [self.sportArr addObject:@"Мини-футбол"];
    [self.sportArr addObject:@"Микс-файт"];
    [self.sportArr addObject:@"Беговые лыжи"];
    [self.sportArr addObject:@"Легкая атлетика"];
    [self.sportArr addObject:@"Конькобежный спорт"];
    [self.sportArr addObject:@"Конный спорт"];
    [self.sportArr addObject:@"Кикбоксинг"];
    [self.sportArr addObject:@"Керлинг"];
    [self.sportArr addObject:@"Картинг"];
    [self.sportArr addObject:@"Каратэ"];
    [self.sportArr addObject:@"Капоэйра"];
    [self.sportArr addObject:@"Дзюдо"];
    [self.sportArr addObject:@"Дартс"];
    [self.sportArr addObject:@"Гребля на байдарках и каноэ"];
    [self.sportArr addObject:@"Горнолыжный спорт"];
    [self.sportArr addObject:@"Гольф"];
    [self.sportArr addObject:@"Спортивная гимнастика"];
    [self.sportArr addObject:@"Водное поло"];
    [self.sportArr addObject:@"Велоспорт"];
    [self.sportArr addObject:@"Боулинг"];
    [self.sportArr addObject:@"Вольная борьба"];
    [self.sportArr addObject:@"Бейсбол"];
    [self.sportArr addObject:@"Биатлон"];
    [self.sportArr addObject:@"Баскетбол"];
    [self.sportArr addObject:@"Бадминтон"];
    [self.sportArr addObject:@"Армреслинг"];
    [self.sportArr addObject:@"Альпинизм и скалолазание"];
    [self.sportArr addObject:@"Акробатика"];
    [self.sportArr addObject:@"Айкидо"];
    
    [self.sportArr sortUsingSelector:@selector(localizedCompare:)];

    self.cityField.delegate = self;
    self.subwayField.delegate = self;
    self.adressField.delegate = self;
    [self hideKeyboardWhenBackgroungIsTapped];
    appdelegate = [[UIApplication sharedApplication]delegate];
    context = appdelegate.persistentContainer.viewContext;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)gendrePicker {
    return 1;
    
}

-(NSInteger)pickerView:(UIPickerView *)gendrePicker numberOfRowsInComponent:(NSInteger)component {
    return [self.sportArr count];
    
}

-(NSString *)pickerView:(UIPickerView *)gendrePicker titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.sportArr objectAtIndex:row];
}
-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
    self.sportField.text = [self.sportArr objectAtIndex:[pickerView selectedRowInComponent:0]];
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


- (IBAction)selectSportBtnPressed:(id)sender {
    [self.pickerViewContainer setHidden: NO];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.pickerViewContainer.frame = CGRectMake(0,390, 375, 290);
    [UIView commitAnimations];
}

- (IBAction)kkBtnPressed:(id)sender {
    [self.pickerViewContainer setHidden: YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    self.pickerViewContainer.frame = CGRectMake(0, 700, 375, 290);
    [UIView commitAnimations];
}

- (IBAction)addPhotoBtnPressed:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIActionSheet *photoSourceSheet = [[UIActionSheet alloc]initWithTitle:@"Выберите фотографию" delegate:self cancelButtonTitle:@"Отмена" destructiveButtonTitle:nil otherButtonTitles:@"Сделать новое фото",@"Выбрать из библиотеки", nil];
        [photoSourceSheet showFromRect:((UIButton *)sender).frame inView:self.view animated:YES];
    }
    else{
        
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
        
        
        
        
    }
    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //путь к файлу в каталоге
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *uniqueFilename = [[NSUUID UUID]UUIDString];
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:uniqueFilename];
    
    //получить изображение
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    [self.event setValue:imagePath forKey:@"imagePath"];
    NSLog(@"%@", [NSString stringWithFormat:@"%@",imagePath]);
    //[appdelegate saveContext];
    self.imageView.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex == actionSheet.cancelButtonIndex){
        return;
    }
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    switch(buttonIndex){
        case 0:
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            break;
        default:
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            break;
    }
    [self presentViewController:picker animated:YES completion:nil];
    
}


- (IBAction)addBtnPressed:(id)sender {
     NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:context];
    self.event = [[NSManagedObject alloc]initWithEntity:entityDesc insertIntoManagedObjectContext:context];
    [self.event setValue:self.cityField.text forKey:@"city"];
    [self.event setValue:self.subwayField.text forKey:@"subway"];
    [self.event setValue:self.adressField.text forKey:@"adress"];
    [self.event setValue:self.sportField.text forKey:@"sport"];
    [appdelegate saveContext];
//    UIAlertView *alert1 = [[UIAlertView alloc]initWithTitle:nil message:@"Событие успешно добалено!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [self hideKeyboard];
    //[alert1 show];
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
