//
//  BrowseTableViewController.m
//  EmployeeCoreData
//
//  Created by optimusmac-12 on 03/08/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "BrowseTableViewController.h"
#import <CoreData/CoreData.h>
#import "BrowseClickViewController.h"
@interface BrowseTableViewController ()

@end

@implementation BrowseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
    self.emp = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];                 // Obtaining all the entries of persistance store to show in Table view
    
    [self.tableView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.emp.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];            //Creating object of TabelView to access each row and obtain data
    
    NSManagedObject *empp = [self.emp objectAtIndex:indexPath.row]; //obtaining the informatio of selected row in empp object
    [cell.textLabel setText:[NSString stringWithFormat:@"%@", [empp valueForKey:@"name"]]];
    [cell.detailTextLabel setText:[empp valueForKey:@"empId"]];     //Accessing and using the name and empId to show in tabelView
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{                           //Segue which is called when user selects any row, and this segue modifies the value of emp object of BrowseClickViewController with the clicked row details.
    if ([segue.identifier isEqualToString:@"recordClicked"]){
        NSManagedObject *selectedEmp = [self.emp objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        BrowseClickViewController *destViewController = segue.destinationViewController;
        destViewController.emp = selectedEmp;
    }
}
@end
