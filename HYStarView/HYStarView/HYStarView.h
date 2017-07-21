//
//  HYStarView.h
//  SliderStarView
//
//  Created by zhuxuhong on 2017/7/21.
//  Copyright © 2017年 zhuxuhong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HYStarViewCallback)(float);

@interface HYStarView : UIProgressView

@property(nonatomic)float stepValue; //步进值

@property(nonatomic,copy)HYStarViewCallback valueChanged;

@end
