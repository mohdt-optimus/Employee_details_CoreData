//
//  BrowseClickViewController.m
//  EmployeeCoreData
//
//  Created by optimusmac-12 on 03/08/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "BrowseClickViewController.h"
#import "BrowseTableViewController.h"
#import <CoreData/CoreData.h>
@interface BrowseClickViewController ()

@end

@implementation BrowseClickViewController
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _empIdLabel.text=[self.emp valueForKey:@"empId"];       //Updating the values of Label with the obtained value from segue in emp
    _nameLabel.text=[self.emp valueForKey:@"name"];
    _designationLabel.text=[self.emp valueForKey:@"designation"];
    _departmentLabel.text=[self.emp valueForKey:@"department"];
    _tagLineLabel.text=[self.emp valueForKey:@"tagLine"];
    _picLabel=[self.emp valueForKey:@"pic"];
    _imagePicture.image=[self loadImage:_picLabel];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
