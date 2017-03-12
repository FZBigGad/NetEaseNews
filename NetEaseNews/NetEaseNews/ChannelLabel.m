

//
//  ChannelLabel.m
//  NetEaseNews
//
//  Created by fangzhengwei on 2017/3/10.
//  Copyright © 2017年 fangzhengwei. All rights reserved.
//

#import "ChannelLabel.h"

@implementation ChannelLabel

- (void)setScale:(CGFloat)scale{
    
    _scale = scale;
    
    self.textColor = [UIColor colorWithRed:scale green:0 blue:0 alpha:1];
    
    self.transform = CGAffineTransformMakeScale(scale * 0.3 + 1,scale * 0.3 + 1);
}
@end
