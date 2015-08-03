//
//  InsertViewController.h
//  EmployeeCoreData
//
//  Created by optimusmac-12 on 03/08/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InsertViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *empId;        //text fields which will be
@property (weak, nonatomic) IBOutlet UITextField *name;         //used to input from user
@property (weak, nonatomic) IBOutlet UITextField *designation;
@property (weak, nonatomic) IBOutlet UITextField *department;
@property (weak, nonatomic) IBOutlet UITextField *tagLine;

- (IBAction)save:(id)sender;

- (IBAction)gallery:(id)sender;
- (IBAction)camera:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end
