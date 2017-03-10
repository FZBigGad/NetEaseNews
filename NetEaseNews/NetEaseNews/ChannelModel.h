//
//  ChannelModel.h
//  NetEaseNews
//
//  Created by fangzhengwei on 2017/3/10.
//  Copyright © 2017年 fangzhengwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *tid;

+ (NSArray *)createChannelModel;
@end
