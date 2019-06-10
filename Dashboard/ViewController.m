//
//  ViewController.m
//  Dashboard
//
//  Created by 王灵博 on 2019/6/6.
//  Copyright © 2019 王灵博. All rights reserved.
//

#import "ViewController.h"
#import "Dashboard.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Dashboard *dash=[[Dashboard alloc] initWithFrame:CGRectMake(100, 100, 180, 180)];
    dash.process=75;
    [dash beginTransForm];
    [self.view addSubview:dash];
}


@end
