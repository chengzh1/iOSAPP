//
//  ParentPageViewController.h
//  Appcoda_SimpleApps
//
//  Created by chengzhang on 9/10/14.
//  Copyright (c) 2014 chengzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParentPageViewController : UIViewController<UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageController;
@end
