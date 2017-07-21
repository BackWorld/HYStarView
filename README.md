# HYStarView
A customized `Rate` component based on UIProgressView in OC.

![最终效果](http://upload-images.jianshu.io/upload_images/1334681-1f128c46cb7320a8.gif?imageMogr2/auto-orient/strip)

##### 要求：
- Platform: iOS7.0+ 
- Language: Objective-C
- Editor: Xcode6.0+

##### 实现

- 思路
**UIPogressView + UIImage**
> 总得来说，就利用progressView的两个属性：_progressImage【顶图】和_trackImage【底图】实现不同进度值下的评分效果。

- 属性设置
![属性设置](http://upload-images.jianshu.io/upload_images/1334681-4fd7d44a0a5ba36f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 图片设置
![icon_star.png](http://upload-images.jianshu.io/upload_images/1334681-a56d286ec8953cbd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![icon_star_tinted.png](http://upload-images.jianshu.io/upload_images/1334681-ee4c0854feb34f20.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 交互逻辑代码

> 注意：_stepValue是指滑动过程中的最小步进值，0.5表示半颗星，1表示一颗星，要求0 < _stepValue <= 1。

```
// 设置progressView的进度
-(void)updateProgressWithTouches: (NSSet<UITouch *> *)touches isMoved: (BOOL)isMoved{
	UITouch *touch = touches.anyObject;
	CGPoint loc = [touch locationInView:_progressView];
	
	float value = loc.x / _progressView.bounds.size.width;
	if (value < 0) {
		return;
	}
	float progress = (_stepValue == 0) ? value : ceil(value * 5 / _stepValue) * _stepValue / 5;
	progress = MIN(progress, 1);

	_progressView.progress = progress;
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
```
- 注意

> 在设置NSLayout时，设置progressView的高度要和icon_star保持一致，宽度为图片的倍数值，否则会显示错乱。

### 简书
http://www.jianshu.com/p/3e9cd6f867f0
> 本文只是给读者展示了一种独特的最简单的实现方式，如果对你有帮助，别忘了点个❤️哦。
