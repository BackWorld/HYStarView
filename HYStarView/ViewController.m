//
//  ViewController.m
//  HYStarView
//
//  Created by zhuxuhong on 2017/7/21.
//  Copyright © 2017年 zhuxuhong. All rights reserved.
//

#import "ViewController.h"
#import "HYStarView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HYStarView *starView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	_starView.valueChanged = ^(float value) {
		NSLog(@"progress: %f",value);
	};
}




@end
