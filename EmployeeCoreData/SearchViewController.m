//
//  SearchViewController.m
//  EmployeeCoreData
//
//  Created by optimusmac-12 on 03/08/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "SearchViewController.h"
#import <CoreData/CoreData.h>
@interface SearchViewController ()

@end

@implementation SearchViewController
{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)searchNameDesignation:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *desc=[NSEntityDescription entityForName:@"Employee" inManagedObjectContext:context];
    NSFetchRequest *fetch=[[NSFetchRequest alloc]init];     //Talking fetch Request by creating object of Fetch Request Class
    
    [fetch setEntity:desc];
    NSPredicate *pred=[NSPredicate predicateWithFormat:@"name like %@ and designation like %@",_nameSearch.text,_designationSearch.text];   //Query is being created for searching data with name and designation combination
    
    [fetch setPredicate:pred];
    NSError *error;
    NSArray *matchData=[context executeFetchRequest:fetch error:&error];    //Query Executed
    if(matchData.count<=0)    {                 //Checking if query returned any row,if returned the count will be greater than 0 and it will execute else block to display fetched details
        _showView.hidden=true;
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Message"
                                                          message:@"Record Not Found"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];

    }
    else{
        for(NSManagedObject *obj in matchData){
            _nameLabel.text=[obj valueForKey:@"name"];          //Updating the values of all the Labels to Show fetched details
            _empCodeLabel.text=[obj valueForKey:@"empId"];
            _designationLabel.text=[obj valueForKey:@"designation"];
            _departmentLabel.text=[obj valueForKey:@"department"];
            _tagLineLabel.text=[obj valueForKey:@"tagLine"];
            _picLabel=[obj valueForKey:@"pic"];
            _imageView.image=[self loadImage:_picLabel];
            
            _showView.hidden=false;         //Making all the labels visible
        }
    }
    
}
-(UIImage *)loadImage: (NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:
                      [NSString stringWithString:name] ];
    UIImage* image = [UIImage imageWithContentsOfFile:path];
    return image;
}


- (IBAction)searchEmpCode:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSEntityDescription *desc=[NSEntityDescription entityForName:@"Employee" inManagedObjectContext:context];
    NSFetchRequest *fetch=[[NSFetchRequest alloc]init];
    
    [fetch setEntity:desc];
    NSPredicate *pred=[NSPredicate predicateWithFormat:@"empId like %@",_empCodeSearch.text];
    //This will take search key as Employee Code
    [fetch setPredicate:pred];
    NSError *error;
    NSArray *matchData=[context executeFetchRequest:fetch error:&error];
    if(matchData.count<=0)    {
        _showView.hidden=true;
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Message"
                                                          message:@"Record Not Found"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        
    }
    else{
        for(NSManagedObject *obj in matchData){
            _nameLabel.text=[obj valueForKey:@"name"];          //Updating the values of all the Labels to Show fetched details

            _empCodeLabel.text=[obj valueForKey:@"empId"];
            _designationLabel.text=[obj valueForKey:@"designation"];
            _departmentLabel.text=[obj valueForKey:@"department"];
            _tagLineLabel.text=[obj valueForKey:@"tagLine"];
            _picLabel=[obj valueForKey:@"pic"];
            _imageView.image=[self loadImage:_picLabel];
            
            _showView.hidden=false;                     //Making all the labels visible
        }
    }

}
@end
