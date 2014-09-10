//
//  VideoViewController.h
//  Appcoda_SimpleApps
//
//  Created by chengzhang on 9/6/14.
//  Copyright (c) 2014 chengzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface VideoViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property(strong, nonatomic) NSURL *videoURL;
@property(strong, nonatomic) MPMoviePlayerController *videoController;
- (IBAction)captureVideo:(id)sender;

@end
