//
//  BrowseClickViewController.h
//  EmployeeCoreData
//
//  Created by optimusmac-12 on 03/08/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowseClickViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *empIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *designationLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imagePicture;
@property (strong) NSManagedObjectModel *emp;
@property (weak, nonatomic) NSString *picLabel;




@end
