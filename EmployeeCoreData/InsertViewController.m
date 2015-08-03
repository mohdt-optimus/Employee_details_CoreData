//
//  InsertViewController.m
//  EmployeeCoreData
//
//  Created by optimusmac-12 on 03/08/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "InsertViewController.h"
#import <CoreData/CoreData.h>
@interface InsertViewController ()

@end

@implementation InsertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSManagedObjectContext *)managedObjectContext {          //This allows us to get the managed object context from the AppDelegate
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (IBAction)save:(id)sender {
    
    if(_empId.text==nil || _name.text==nil || _designation.text==nil || _department.text==nil || _tagLine.text==nil){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Message"
                                                          message:@"Please Fill all the entries. Then Click Save"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        
    }
    else{
        
    
    NSManagedObjectContext *context = [self managedObjectContext];
        NSManagedObject *newEmp = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context]; // create a new managedd object to take the input
   
    [newEmp setValue:self.empId.text forKey:@"empId"];     //taking input from textfields to set the attributes
    [newEmp setValue:self.name.text forKey:@"name"];
    [newEmp setValue:self.designation.text forKey:@"designation"];
    [newEmp setValue:self.department.text forKey:@"department"];
    [newEmp setValue:self.tagLine.text forKey:@"tagLine"];
    
    NSString *picName=self.empId.text;
    NSString *nameWithExt=[picName stringByAppendingString:@".jpg"];
    
    [newEmp setValue:nameWithExt forKey:@"pic"];
    
    [self saveImage:_imageView imgName:nameWithExt];
    
    NSError *error = nil;
    
    if (![context save:&error]) {           //saving the data to persistance store

        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Message"
                                                          message:@"Record Save Unsuccessful"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
              
    }
    else{
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Message"
                                                          message:@"Record Saved Successfully"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        [self.navigationController popViewControllerAnimated:YES];
    }
    }
}



- (IBAction)gallery:(id)sender {        //To select the image from gallery. This wil open up the gallery.
    UIImagePickerController *photoPicker = [[UIImagePickerController alloc] init];
    photoPicker.delegate = self;
    photoPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:photoPicker animated:YES completion:NULL];
}

- (IBAction)camera:(id)sender {         //To select the image from camera. This wil open up the camera to take picture

    UIImagePickerController *photoPicker = [[UIImagePickerController alloc] init];
    photoPicker.delegate = self;
    photoPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:photoPicker animated:YES completion:NULL];
}
- (void)imagePickerController:(UIImagePickerController *)photoPicker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *selectedImage = [info valueForKey:UIImagePickerControllerOriginalImage];
    
    [self.imageView setImage:selectedImage];
    
    [photoPicker dismissModalViewControllerAnimated:YES];
}
- (void)saveImage: (UIImageView *)imageView imgName:(NSString *)name{
    if (imageView != nil){
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
        
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSString* path = [documentsDirectory stringByAppendingPathComponent:
                          name];
        UIImage *img=imageView.image;
        
        NSData* data = UIImagePNGRepresentation(img);
        
        [data writeToFile:path atomically:YES];
    }
    else {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Message"
                                                          message:@"Please Select an Image to proceed"
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        
        [message show];
        
    }
}
@end
