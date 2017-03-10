//
//  NetReuqestManager.h
//  NetEaseNews
//
//  Created by fangzhengwei on 2017/3/10.
//  Copyright © 2017年 fangzhengwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetReuqestManager : NSObject


+ (instancetype)shareManager;

- (void)downLoadDataWithURLStr:(NSString *)urlStr;
@end
