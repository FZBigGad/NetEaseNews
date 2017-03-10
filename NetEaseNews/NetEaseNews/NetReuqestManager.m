
//
//  NetReuqestManager.m
//  NetEaseNews
//
//  Created by fangzhengwei on 2017/3/10.
//  Copyright © 2017年 fangzhengwei. All rights reserved.
//

#import "NetReuqestManager.h"

@implementation NetReuqestManager

+ (instancetype)shareManager{
    
    static id instruce;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instruce = [[NetReuqestManager alloc] init];
    });
    
    return instruce;
}

- (void)downLoadDataWithURLStr:(NSString *)urlStr{
    
    
    
}
@end
