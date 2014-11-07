//
//  PageChildViewController.m
//  Appcoda_SimpleApps
//
//  Created by chengzhang on 9/10/14.
//  Copyright (c) 2014 chengzhang. All rights reserved.
//

#import "PageChildViewController.h"

@interface PageChildViewController ()

@end

@implementation PageChildViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    self.label.text = [NSString stringWithFormat:@"Screen #%ld", (long)self.index];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
