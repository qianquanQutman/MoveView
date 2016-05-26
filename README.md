#MoveView
####首先我们来看看效果
------
![moveView.gif](http://upload-images.jianshu.io/upload_images/1428756-b7db64fdcfe9f7d0.gif?imageMogr2/auto-orient/strip)

跟随手指移动主要用了两个方法
    - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
        UITouch *touch = [touches anyObject];
        self.black.center = [touch locationInView:self];
    }
    - (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
        UITouch *touch = [touches anyObject];
        self.black.center = [touch locationInView:self];
    }

让黑色view的中心点等于手指触摸的点就可以了
但是这样写的话，当手指触摸到圆外或者移动到圆外，黑色view也能跟随出去，那我们想让黑色view显示在圆内，就需要判断黑色view的中心点坐标是否在圆内，如果不在圆内就不让它跟随，于是添加了下面的代码：

    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];

    if (CGPathContainsPoint(path.CGPath, NULL, [touch locationInView:self], NO)) {
        
        self.black.center = [touch locationInView:self];
        
    }
这样做还有一个缺点：手指移动出圆范围内黑色view就停止不动了。我们的目标是，黑色view不会出圆的范围，但是能跟随手指有角度的移动。
博主大学没好好学导致把高中数学忘得差不多了，三角函数的用法也一个不会用了。
于是画了一个图来分析：

![分析图.png](http://upload-images.jianshu.io/upload_images/1428756-57ddbb922379b1f4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

分析：当手指移动到圆外，让黑色view的中点等于圆心到圆外任意一点的连线与圆的交点。这样当手指移动到圆外，黑色view也能跟随手指有角度的变化。
根据相似三角形来计算交点的坐标，最后代码：

    - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
      UITouch *touch = [touches anyObject];
    
      UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];

      if (CGPathContainsPoint(path.CGPath, NULL, [touch locationInView:self], NO)) {
        
        self.black.center = [touch locationInView:self];
        
      }
    
    }

    - (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
      CGFloat r = self.bounds.size.width / 2;
    
      CGPoint center = CGPointMake(r, r);
    
      UITouch *touch = [touches anyObject];
    
      CGPoint pointL = [touch locationInView:self];

    
      UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    
      if (CGPathContainsPoint(path.CGPath, NULL, [touch locationInView:self], NO)) {

        self.black.center = [touch locationInView:self];
        
      }else{
        
        CGFloat juli = sqrt(pow(center.x - pointL.x, 2) + pow(pointL.y - center.y, 2));
        
        CGFloat x = center.x - r / juli * (center.x - pointL.x);
        CGFloat y = center.y + r / juli * (pointL.y - center.y);

        self.black.center = CGPointMake(x, y);

      }

    }

---