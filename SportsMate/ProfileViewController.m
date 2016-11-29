//
//  ProfileViewController.m
//  SportsMate
//
//  Created by Дмитрий Фролов on 15.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

    @property AppDelegate *appdelegate;
    @property NSManagedObjectContext *context;
@property UINavigationController *navi;
@property UINavigationController *navi2;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 self.navi = (UINavigationController *)[self.tabBarController.viewControllers objectAtIndex:2];
     self.navi2 = (UINavigationController *)[self.tabBarController.viewControllers objectAtIndex:1];
    NSString *name;
    NSString *phone;
    NSString *city;
    NSString *gender;
    NSString *sport;
    NSString *birth;
    NSString *path;
    
    
           name = [self.currentUser valueForKey:@"name"];
          phone= [self.currentUser valueForKey:@"phone"];
        city = [self.currentUser valueForKey:@"city"];
            gender= [self.currentUser valueForKey:@"gender"];
            sport= [self.currentUser valueForKey:@"sport"];
            birth= [self.currentUser valueForKey:@"birth"];
    path = [self.currentUser valueForKey:@"imagePath"];
    if ([path isEqualToString:@"default_photo.jpg"]){
        self.profileImage.image = [UIImage imageNamed:@"default_photo.jpg"];
    }
    else{
    self.profileImage.image = [UIImage imageWithContentsOfFile:path];}
    NSLog(@"%@", [NSString stringWithFormat:@"%@",path]);
    self.additionalInfo.text = [self.currentUser valueForKey:@"additional"];
    
    self.nameField.text = name;
    self.phoneField.text = phone;
    self.cityField.text = city;
    self.GenderField.text = gender;
    self.sportField.text = sport;
    self.birthField.text = birth;
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
    
    _appdelegate = [[UIApplication sharedApplication]delegate];
    _context = _appdelegate.persistentContainer.viewContext;

}

//Настройка параметров всплывающего списка
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


//получение фотографии пользователя из библиотеки или с помощью камеры телефона

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //путь к файлу в каталоге
    // NSDocument dirctory  погуглить и может быть заменить на другое
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *uniqueFilename = [[NSUUID UUID]UUIDString];
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:uniqueFilename];
    
    //получить изображение
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
    [self.currentUser setValue:imagePath forKey:@"imagePath"];
     NSLog(@"%@", [NSString stringWithFormat:@"%@",imagePath]);
    [_appdelegate saveContext];
    self.profileImage.image = image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)takePictureBtn:(id)sender {
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

// анимация всплывания списка
- (IBAction)kkBtn:(id)sender {
    [self.pickerViewContainer setHidden: YES];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    self.pickerViewContainer.frame = CGRectMake(0, 700, 375, 290);
    [self.currentUser setValue:self.sportField.text forKey:@"sport"];
    [_appdelegate saveContext];
    [UIView commitAnimations];
}

- (IBAction)changeBtn:(id)sender {
    [self.pickerViewContainer setHidden: NO];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    self.pickerViewContainer.frame = CGRectMake(0,362, 375, 290);
    [UIView commitAnimations];
}


-(void)viewWillDisappear:(BOOL)animated{
    self.users = _navi.topViewController;
    self.users.currentUser = self.currentUser;
    self.places = _navi2.topViewController;
    self.places.currentUser = self.currentUser;

}
//  logout
- (IBAction)exitBtnPressed:(id)sender {
    
    NSMutableArray *navArr = [[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
    [navArr removeAllObjects];
    self.navigationController.viewControllers = navArr;
}
@end
