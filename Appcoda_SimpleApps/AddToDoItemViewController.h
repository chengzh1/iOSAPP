//
//  AddToDoItemViewController.h
//  Appcoda_SimpleApps
//
//  Created by chengzhang on 9/8/14.
//  Copyright (c) 2014 chengzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddToDoItemViewController : UIViewController
- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *toDoItem;
@property (strong, nonatomic) IBOutlet UIDatePicker *dataPicker;

@end
