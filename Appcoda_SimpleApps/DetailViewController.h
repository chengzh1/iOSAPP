//
//  DetailViewController.h
//  Appcoda_SimpleApps
//
//  Created by chengzhang on 9/6/14.
//  Copyright (c) 2014 chengzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (copy, nonatomic) NSString* url;  //it already have setUrl method
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@end
