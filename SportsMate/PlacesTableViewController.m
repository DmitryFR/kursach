//
//  PlacesTableViewController.m
//  SportsMate
//
//  Created by Дмитрий Фролов on 16.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import "PlacesTableViewController.h"
#import "ExistingPlaceViewController.h"

@interface PlacesTableViewController ()
@property NSArray *eventArr;
@property AppDelegate *appdelegate;
@property NSManagedObjectContext *context;


@end

@implementation PlacesTableViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    _appdelegate = [[UIApplication sharedApplication]delegate];
    _context = _appdelegate.persistentContainer.viewContext;
   
    
}

-(void)viewWillAppear:(BOOL)animated{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:_context];
    [request setEntity:entityDesc];
    self.eventArr = [_context executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.eventArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    self.event = _eventArr[indexPath.row];
    cell.textLabel.text = [self.event valueForKey:@"sport"];
    cell.detailTextLabel.text = [self.event valueForKey:@"city"];
    
    return cell;
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"MoreInf"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        self.event = self.eventArr[indexPath.row];
        ExistingPlaceViewController *vc = (ExistingPlaceViewController *)segue.destinationViewController;
        vc.chooseEvent = self.event;
        
    }
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [_context deleteObject:[self.eventArr objectAtIndex:indexPath.row]];
        [_appdelegate saveContext];
        NSFetchRequest *request = [[NSFetchRequest alloc]init];
        NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:_context];
        [request setEntity:entityDesc];
        self.eventArr = [_context executeFetchRequest:request error:nil];
        [self.tableView reloadData];
        
    }
}



@end
