//
//  UsersTableViewController.m
//  SportsMate
//
//  Created by Дмитрий Фролов on 17.10.16.
//  Copyright © 2016 Дмитрий Фролов. All rights reserved.
//

#import "UsersTableViewController.h"

@interface UsersTableViewController ()
@property NSArray *userArr;
@property AppDelegate *appdelegate;
@property NSManagedObjectContext *context;


@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _appdelegate = [[UIApplication sharedApplication]delegate];
    _context = _appdelegate.persistentContainer.viewContext;
}
-(void)viewWillAppear:(BOOL)animated{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"User" inManagedObjectContext:_context];
    [request setEntity:entityDesc];
    NSString *sport = [self.currentUser valueForKey:@"sport"];
    NSString *city = [self.currentUser valueForKey:@"city"];
    NSString *name = [self.currentUser valueForKey:@"name"];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"sport like %@ and city like %@ and name != %@", sport,city,name];
        [request setPredicate:predicate];

    self.userArr = [_context executeFetchRequest:request error:nil];
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSManagedObject *mo = self.userArr[indexPath.row];
    [cell fillCell:mo];
    self.selectedUser = self.userArr[indexPath.row];
    
 
    
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"MoreInfo"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        self.selectedUser = self.userArr[indexPath.row];
        ExistingUserViewController *vc = (ExistingUserViewController *)segue.destinationViewController;
        vc.currentUser = self.selectedUser;
    }
}


@end
