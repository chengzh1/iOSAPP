//
//  PageRootViewController.h
//  Appcoda_SimpleApps
//
//  Created by chengzhang on 9/22/14.
//  Copyright (c) 2014 chengzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageContentViewController.h"

@interface PageRootViewController : UIViewController <UIPageViewControllerDataSource>
- (IBAction)startWalkThrough:(id)sender;

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;
@end
