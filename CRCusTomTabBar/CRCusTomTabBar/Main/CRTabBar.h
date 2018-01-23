//
//  CRTabBar.h
//  CRCusTomTabBar
//
//  Created by Seven on 2018/1/23.
//  Copyright © 2018年 Seven. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CRTabBarDelegate
@optional
- (void)centerBtnClick:(UIButton *)button;
@end

@interface CRTabBar : UITabBar
@property (nonatomic,weak) id <CRTabBarDelegate>delegate_c;
@end
