//
//  ExistingPlaceViewController.m
//  SportsMate
//
//  Created by Дмитрий Фролов on 16.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import "ExistingPlaceViewController.h"
#import "MapPin.h"

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
    
   
    MKCoordinateRegion region;

      CLLocationCoordinate2D location = [self addressLocation];
    region.span.latitudeDelta = 0.5;
    region.span.longitudeDelta = 0.5;
    MapPin *ann = [[MapPin alloc]init];
    ann.title = self.sportField.text;
    ann.subtitle = self.adressField.text;
    ann.coordinate = location;
    region.center=location;
    [self.mapView addAnnotation:ann];
    
    [self.mapView setRegion:region animated:YES];
   
    
    
  
}

// Получение географический координат с портала  GOOGLE MAPs используя адрес

-(CLLocationCoordinate2D) addressLocation {
    NSString *urlString = [NSString stringWithFormat:@"https://www.google.ru/maps/place/%@",
                           [self.adressField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSString *locationString = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlString]];
    NSArray *listItems = [locationString componentsSeparatedByString:@","];
    
    double latitude = 0.0;
    double longitude = 0.0;
        longitude= [[listItems objectAtIndex:2] doubleValue];
        latitude = [[listItems objectAtIndex:3] doubleValue];

    CLLocationCoordinate2D location;
    location.latitude = latitude;
    location.longitude = longitude;
    listItems = nil;
    return location;
}
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id ) annotation{
    MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
    annView.pinColor = MKPinAnnotationColorGreen;
    annView.animatesDrop=TRUE;
    annView.canShowCallout = YES;
    annView.calloutOffset = CGPointMake(-5, 5);
    return annView;
}

@end
