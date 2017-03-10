//
//  NetReuqestManager.h
//  NetEaseNews
//
//  Created by fangzhengwei on 2017/3/10.
//  Copyright © 2017年 fangzhengwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef enum : NSUInteger {
    GETType,
    POSTType,
} RequestType;

@interface NetReuqestManager : AFHTTPSessionManager


+ (instancetype)shareManager;

- (void)downLoadDataWithURLStr:(NSString *)urlStr andReuqestType:(RequestType)type andResponse:(void(^)(id))response andComBlock:(void(^)(NSError *))ComBlock;

@end
