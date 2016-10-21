//
//  ExistingPlaceViewController.m
//  SportsMate
//
//  Created by Дмитрий Фролов on 16.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import "ExistingPlaceViewController.h"


@interface ExistingPlaceViewController ()
@property AppDelegate *appdelegate;
@property NSManagedObjectContext *context;

@end

@implementation ExistingPlaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _appdelegate = [[UIApplication sharedApplication]delegate];
    _context = _appdelegate.persistentContainer.viewContext;
    self.cityField.text = [self.chooseEvent valueForKey:@"city"];
    self.additionalInfo.text = [self.chooseEvent valueForKey:@"additional"];
    self.subwayField.text = [self.chooseEvent valueForKey:@"subway"];
    self.adressField.text = [self.chooseEvent valueForKey:@"adress"];
    NSString *path = [self.chooseEvent valueForKey:@"imagePath"];
    self.imageView.image = [UIImage imageWithContentsOfFile:path];
    self.sportField.text = [self.chooseEvent valueForKey:@"sport"];
    /* CLLocationCoordinate2D *coord = CLLocationCoordinate2DMake([[self.chooseEvent valueForKey:@"lat"]doubleValue], [[self.chooseEvent valueForKey:@"lon"]doubleValue]);
    if ([self.chooseEvent valueForKey:@"lat"]!=nil && [self.chooseEvent valueForKey:@"lon"]!=nil){
        [_mapView setCenterCoordinate:coord animated:YES];
         
    }
*/
}



@end
