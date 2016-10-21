//
//  ExistingPlaceViewController.h
//  SportsMate
//
//  Created by Дмитрий Фролов on 16.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import <MapKit/MapKit.h>

@interface ExistingPlaceViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *cityField;
@property (weak, nonatomic) IBOutlet UILabel *subwayField;
@property (weak, nonatomic) IBOutlet UILabel *adressField;
@property (weak, nonatomic) IBOutlet UILabel *sportField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (retain, nonatomic)NSManagedObject *chooseEvent;
@property (weak, nonatomic) IBOutlet UITextView *additionalInfo;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
