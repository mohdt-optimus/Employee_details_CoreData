//
//  SearchViewController.h
//  EmployeeCoreData
//
//  Created by optimusmac-12 on 03/08/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *showView;

@property (weak, nonatomic) IBOutlet UITextField *nameSearch;       //To take the search
@property (weak, nonatomic) IBOutlet UITextField *designationSearch;//key as name,designation combination or Employee Code
@property (weak, nonatomic) IBOutlet UITextField *empCodeSearch;
- (IBAction)searchNameDesignation:(id)sender;
- (IBAction)searchEmpCode:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *empCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *designationLabel;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLineLabel;

@property (weak,nonatomic) NSString *picLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
