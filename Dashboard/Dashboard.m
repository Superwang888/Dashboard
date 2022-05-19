//
//  Dashboard.m
//  Dashboard
//
//  Created by 王灵博 on 2019/6/6.
//  Copyright © 2019 王灵博. All rights reserved.
//

#import "Dashboard.h"
#import "UIView+Extension.h"
#import "UIColor+Extension.h"
@interface Dashboard ()
@property(nonatomic,strong)UIView *transformView;
@property(nonatomic,assign)CGFloat number;
@end
@implementation Dashboard

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        //self.backgroundColor=[UIColor greenColor];
        self.number=0;
        [self drawBorder];
        [self drawScale];
        [self addScaleLable];
        [self addGrayCircle];
        [self drawTransform];
        [self addSubview:self.transformView];
        [self drawTriangle];
    }
    return self;
}
-(void)drawBorder
{
    //startAngle和endAngle详见circle图
    UIBezierPath *cicrle=[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width/2.f, self.height/2.f)
                        radius:(self.width-10)/2.f
                    startAngle:M_PI*(3.f/4)
                      endAngle:M_PI/4.f
                                                           clockwise:YES];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth     = 10.f;
    shapeLayer.fillColor     = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor   = [UIColor redColor].CGColor;
    shapeLayer.path          = cicrle.CGPath;
    
    [self.layer addSublayer:shapeLayer];
    
    
    UIColor*color1 = [UIColor colorWithHexString:@"#6FC02F"];
    UIColor*color2 =  [UIColor colorWithHexString:@"#F1E737"];
    UIColor*color3 =  [UIColor colorWithHexString:@"#F14010"];
    
    CAGradientLayer*gradientLayer =  [CAGradientLayer layer];
    
    gradientLayer.frame=self.bounds;
    
    [gradientLayer setColors:[NSArray arrayWithObjects:(id)color1.CGColor,(id)color2.CGColor,(id)color3.CGColor,nil]];
    
    gradientLayer.startPoint=CGPointMake(0,1);

    gradientLayer.endPoint=CGPointMake(1,1);

    [gradientLayer setMask:shapeLayer]; //用progressLayer来截取渐变层
    
    [self.layer addSublayer:gradientLayer];
}
-(void)drawScale
{
    CGFloat scale=((6.f/4)*M_PI)/100.f;
    for (int i=0; i<101; i++) {
        CGPoint point=[self calcCircleCoordinateWithCenter:CGPointMake(self.width/2.f, self.height/2.f) andWithAngle:(-M_PI/4.f+scale*i) andWithRadius:(self.width-20)/2.f];
        
        UIBezierPath *line=[UIBezierPath bezierPath];
        [line moveToPoint:point];
        [line addLineToPoint:CGPointMake(self.width/2.f, self.height/2.f)];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        if (i%10==0) {
            shapeLayer.strokeStart=0;
            shapeLayer.strokeEnd=0.1;
        }else
        {
            shapeLayer.strokeStart=0;
            shapeLayer.strokeEnd=0.05;
        }
        shapeLayer.lineWidth     = 0.5f;
        shapeLayer.fillColor     = [UIColor clearColor].CGColor;
        shapeLayer.strokeColor   = [UIColor colorWithHexString:@"#979DA0"].CGColor;
        shapeLayer.path          = line.CGPath;
        
        [self.layer addSublayer:shapeLayer];
    }
    
    
}
-(void)addScaleLable
{
    CGFloat scale=((6.f/4)*M_PI)/100.f;
    for (int i=0; i<11; i++) {
        CGFloat angle=(-M_PI/4.f+scale*i*10);
        CGPoint point=[self calcCircleCoordinateWithCenter:CGPointMake(self.width/2.f, self.height/2.f) andWithAngle:angle andWithRadius:(self.width-40)/2.f];
        UILabel *text      = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 10)];
        text.center=point;
        text.text          = [NSString stringWithFormat:@"%ld",100-i*10];
        text.font          = [UIFont fontWithName:@"PingFangSC-Regular" size: 10];
        text.textColor     = [UIColor colorWithHexString:@"#979DA0"];
        text.textAlignment = NSTextAlignmentCenter;
        [self addSubview:text];
        
        //旋转lable，旋转开始的位置都不同，再次转换
        CGFloat transformAngle=((3*M_PI)/4.f)-(scale*i*10);
       text.transform = CGAffineTransformRotate(text.transform, transformAngle);//控件
      
    }
}
/**
 设置缩放或旋转围绕的点
 
 @param anchorPoint 围绕的点
 @param view 设置的视图
 */
//- (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view {
//
//    CGPoint oldOrigin = view.frame.origin;
//    view.layer.anchorPoint = anchorPoint;
//
//
//    CGPoint newOrigin = view.frame.origin;
//
//    CGPoint transition;
//    transition.x = newOrigin.x - oldOrigin.x;
//    transition.y = newOrigin.y - oldOrigin.y;
//
//    view.center = CGPointMake (view.center.x - transition.x, view.center.y - transition.y);
//
//}
- (void)setAnchorPoint:(CGPoint)anchorpoint forView:(UIView *)view{
    CGRect oldFrame=view.frame;
    view.layer.anchorPoint = anchorpoint;
    view.frame = oldFrame;
}
-(void)addGrayCircle
{
    UIBezierPath *cicrle=[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width/2.f, self.height/2.f)
                                                        radius:(self.width-100)/2.f
                                                    startAngle:M_PI*(3.f/4)
                                                      endAngle:M_PI/4.f
                                                     clockwise:YES];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth     = 25.f;
    shapeLayer.fillColor     = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor   = [UIColor colorWithHexString:@"#EEEEEE"].CGColor;
    shapeLayer.path          = cicrle.CGPath;
    
    [self.layer addSublayer:shapeLayer];
    
}
-(void)drawTransform
{
    UIBezierPath *cicrle=[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width/2.f, self.height/2.f)
                                                        radius:7.5
                                                    startAngle:0
                                                      endAngle:2*M_PI
                                                     clockwise:YES];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor     = [UIColor colorWithHexString:@"#2E3030"].CGColor;
    shapeLayer.strokeColor   = [UIColor colorWithHexString:@"#2E3030"].CGColor;
    shapeLayer.path          = cicrle.CGPath;
    
    [self.layer addSublayer:shapeLayer];
    
   
    
}
//-(void)drawTriangle
//{
//
//    CGPoint point=[self calcCircleCoordinateWithCenter:CGPointMake(self.width/2.f, self.height/2.f) andWithAngle:(5*M_PI/4.f) andWithRadius:(self.width-60)/2.f];
//    CGPoint point1=[self calcCircleCoordinateWithCenter:CGPointMake(self.width/2.f, self.height/2.f) andWithAngle:(-M_PI/4.f) andWithRadius:2.f];
//
//    CGPoint point2=[self calcCircleCoordinateWithCenter:CGPointMake(self.width/2.f, self.height/2.f) andWithAngle:(3*M_PI/4.f) andWithRadius:2.f];
//
//    UIBezierPath *line=[UIBezierPath bezierPath];
//    [line moveToPoint:point1];
//    [line addLineToPoint:point];
//    [line addLineToPoint:point2];
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//
//    shapeLayer.fillColor     = [UIColor colorWithHexString:@"#2E3030"].CGColor;
//    shapeLayer.strokeColor   = [UIColor colorWithHexString:@"#2E3030"].CGColor;
//    shapeLayer.path          = line.CGPath;
//
//    [self.layer addSublayer:shapeLayer];
//
//}
-(void)drawTriangle
{
    
    CGPoint point=[self calcCircleCoordinateWithCenter:CGPointMake(self.width/2.f, self.height/2.f) andWithAngle:(5*M_PI/4.f) andWithRadius:(self.width-60)/2.f];
    CGPoint point1=[self calcCircleCoordinateWithCenter:CGPointMake(self.width/2.f, self.height/2.f) andWithAngle:(-M_PI/4.f) andWithRadius:2.f];
    
    CGPoint point2=[self calcCircleCoordinateWithCenter:CGPointMake(self.width/2.f, self.height/2.f) andWithAngle:(3*M_PI/4.f) andWithRadius:2.f];
    
     CGPoint coverPoint=[self convertPoint:point toView:self.transformView];
     CGPoint coverPoint1=[self convertPoint:point1 toView:self.transformView];
     CGPoint coverPoint2=[self convertPoint:point2 toView:self.transformView];
    
    UIBezierPath *line=[UIBezierPath bezierPath];
    [line moveToPoint:coverPoint1];
    [line addLineToPoint:coverPoint];
    [line addLineToPoint:coverPoint2];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    shapeLayer.fillColor     = [UIColor colorWithHexString:@"#2E3030"].CGColor;
    shapeLayer.strokeColor   = [UIColor colorWithHexString:@"#2E3030"].CGColor;
    shapeLayer.path          = line.CGPath;
    
    [self.transformView.layer addSublayer:shapeLayer];
   
}
-(void)setProcess:(NSInteger)process
{
    _process=process;
    CGFloat scale=((6.f/4)*M_PI)/100.f;
    CGFloat transformAngle=scale*process;
    self.transformView.transform = CGAffineTransformRotate(self.transformView.transform, transformAngle);//控件
    self.number=process;
}
-(void)beginTransForm
{
    [self performSelector:@selector(transsss) withObject:nil afterDelay:1];
}
-(void)transsss
{
    if (self.number>=100) {
        self.number=0;
        self.transformView.transform=CGAffineTransformIdentity;
    }
    CGFloat scale=((6.f/4)*M_PI)/100.f;
    CGFloat transformAngle=scale;
    self.transformView.transform = CGAffineTransformRotate(self.transformView.transform, transformAngle);//控件
    self.number= self.number+1;
    [self performSelector:@selector(transsss) withObject:nil afterDelay:1];
    
}
CGAffineTransform  GetCGAffineTransformRotateAroundPoint(float centerX, float centerY ,float x ,float y ,float angle)
{
    x = x - centerX; //计算(x,y)从(0,0)为原点的坐标系变换到(CenterX ，CenterY)为原点的坐标系下的坐标
    y = y - centerY; //(0，0)坐标系的右横轴、下竖轴是正轴,(CenterX,CenterY)坐标系的正轴也一样
    
    CGAffineTransform  trans = CGAffineTransformMakeTranslation(x, y);
    trans = CGAffineTransformRotate(trans,angle);
    trans = CGAffineTransformTranslate(trans,-x, -y);
    return trans;
    
}
-(UIView *)transformView
{
    if (_transformView==nil) {
        _transformView=[[UIView alloc] init];
        _transformView.frame=CGRectMake(0,self.height/2.f,(self.width-90)/2.f , (self.width-90)/2.f);
        _transformView.backgroundColor=[UIColor clearColor];
        _transformView.center=CGPointMake(self.width/2.f, self.height/2.f);
        
    }
    return _transformView;
}
#pragma mark 计算圆圈上点在IOS系统中的坐标
-(CGPoint)calcCircleCoordinateWithCenter:(CGPoint)center  andWithAngle : (CGFloat) angle andWithRadius: (CGFloat) radius{
    CGFloat x2 = radius*cosf(angle);
    CGFloat y2 = radius*sinf(angle);
    return CGPointMake(center.x+x2, center.y-y2);
}
@end
