//
//  HYStarView.m
//  SliderStarView
//
//  Created by zhuxuhong on 2017/7/21.
//  Copyright © 2017年 zhuxuhong. All rights reserved.
//

#import "HYStarView.h"

@implementation HYStarView

-(instancetype)init{
	if (self = [super init]) {
		[self setupUI];
		
		[self initData];
	}
	return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
	if (self = [super initWithCoder:aDecoder]) {
		[self setupUI];
		
		[self initData];
	}
	return self;
}

-(void)setupUI{
	super.progressImage = [UIImage imageNamed:@"icon_star_tinted"];
	super.trackImage = [UIImage imageNamed:@"icon_star"];
	
}

-(void)initData{
	_stepValue = 0.5;
	
}

#pragma mark - setters
-(void)setStepValue:(float)stepValue{
	if (stepValue > 1) {
		stepValue = 1;
	}
	_stepValue = stepValue;
}

-(void)setProgressTintColor:(UIColor *)progressTintColor{
}

-(void)setTrackTintColor:(UIColor *)trackTintColor{
}

#pragma mark - private
-(void)updateProgressWithTouches: (NSSet<UITouch *> *)touches isMoved: (BOOL)isMoved{
	UITouch *touch = touches.anyObject;
	CGPoint loc = [touch locationInView:self];
	
	float value = loc.x / self.bounds.size.width;
	if (value < 0) {
		return;
	}
	
	float progress = (_stepValue == 0) ? value : 
	(isMoved ? 
	 floor(value * 5 / _stepValue) * _stepValue / 5 : 
	 ceil(value * 5 / _stepValue) * _stepValue / 5);
	
	progress = MIN(progress, 1);
	
	_valueChanged ? _valueChanged(progress) : nil;
	
	self.progress = progress;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	[self updateProgressWithTouches:touches isMoved:false];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	[self updateProgressWithTouches:touches isMoved:false];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	[self updateProgressWithTouches:touches isMoved:true];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
	[self updateProgressWithTouches:touches isMoved:false];
}

@end
