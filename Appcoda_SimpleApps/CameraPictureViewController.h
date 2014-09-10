//
//  CameraPictureViewController.h
//  Appcoda_SimpleApps
//
//  Created by chengzhang on 9/6/14.
//  Copyright (c) 2014 chengzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraPictureViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(id)sender;
- (IBAction)selectPhoto:(id)sender;

@end
