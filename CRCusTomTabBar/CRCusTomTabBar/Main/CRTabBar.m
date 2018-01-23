//
//  CRTabBar.m
//  CRCusTomTabBar
//
//  Created by Seven on 2018/1/23.
//  Copyright © 2018年 Seven. All rights reserved.
//

#import "CRTabBar.h"
#import "UIView+CR.h"
#import "UIImage+Color.h"

@interface CRTabBar()
@property (nonatomic,strong)UIButton *centerBtn;
@end

@implementation CRTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
        [self addSubview:self.centerBtn];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.centerBtn.centerX = self.centerX;
    //调整发布按钮的中线点Y值
    self.centerBtn.centerY = self.height * 0.5 - 2*10 ;
    
    self.centerBtn.size = CGSizeMake(self.centerBtn.currentBackgroundImage.size.width, self.centerBtn.currentBackgroundImage.size.height);
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"发布";
    label.font = [UIFont systemFontOfSize:11];
    [label sizeToFit];
    label.textColor = [UIColor grayColor];
    [self addSubview:label];
    label.centerX = self.centerBtn.centerX;
    label.centerY = CGRectGetMaxY(self.centerBtn.frame) + 10;
    
    Class class = NSClassFromString(@"UITabBarButton");
    
    int btnIndex = 0;
    for (UIView *btn in self.subviews) {//遍历tabbar的子控件
        if ([btn isKindOfClass:class]) {//如果是系统的UITabBarButton，那么就调整子控件位置，空出中间位置
            //每一个按钮的宽度==tabbar的三分之一
            btn.width = self.width / 3;
            
            btn.x = btn.width * btnIndex;
            
            btnIndex++;
            //如果是索引是1(从0开始的)，直接让索引++，目的就是让我的按钮的位置向右移动，空出来发布按钮的位置
            if (btnIndex == 1) {
                btnIndex++;
            }
            
        }
    }
    
    [self bringSubviewToFront:self.centerBtn];
}

- (void)center_btnClick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(centerBtnClick:)]) {
        [self.delegate_c centerBtnClick:btn];
    }
}

#pragma mark - getter
- (UIButton *)centerBtn{
    if (!_centerBtn) {
        _centerBtn = [[UIButton alloc] init];
        [_centerBtn setBackgroundImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
        [_centerBtn addTarget:self action:@selector(center_btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerBtn;
}

//重写hitTest方法，去监听发布按钮的点击，目的是为了让凸出的部分点击也有反应
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {

    if (self.isHidden == NO) {
        
        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];
        if ( [self.centerBtn pointInside:newPoint withEvent:event]) {
            return self.centerBtn;
        }else{
            return [super hitTest:point withEvent:event];
        }
    }
    else {
        return [super hitTest:point withEvent:event];
    }
}

@end
