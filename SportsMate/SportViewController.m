//
//  SportViewController.m
//  SportsMate
//
//  Created by Дмитрий Фролов on 10.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import "SportViewController.h"


@interface SportViewController ()
@property AppDelegate *appdelegate;
@property NSManagedObjectContext *context;

@end

@implementation SportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sportArr = [[NSMutableArray alloc]init];
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
    [self.sportArr addObject:@"Стритбол"];
    
    [self.sportArr sortUsingSelector:@selector(localizedCompare:)];
    
    _appdelegate = [[UIApplication sharedApplication]delegate];
    _context = _appdelegate.persistentContainer.viewContext;
}

// Настройка pickerView
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

//Запись в базу

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([identifier isEqualToString:@"ToMain"]){
        if ([self.sportField.text isEqualToString:@""]){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Выберите любимый спорт!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            return NO;
        }
        else {
            [self.userInf setValue:self.sportField.text forKey:@"sport"];
            [_appdelegate saveContext];
            //            nextVC.currentUser = self.userInf;
            //[self presentViewController:nextVC animated:YES completion:nil];
            return YES;
        }
        
    }
    return NO;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    self.tbController = (UITabBarController *)[segue destinationViewController];
    self.profile = [self.tbController.viewControllers objectAtIndex:0];
    self.profile.currentUser = self.userInf;
    }
@end
