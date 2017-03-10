
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
        
        instruce = [[NetReuqestManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://c.m.163.com/nc/article/list/"]];
        
    });
    
    return instruce;
}

- (void)downLoadDataWithURLStr:(NSString *)urlStr andReuqestType:(RequestType)type andResponse:(void(^)(id reponse))response andComBlock:(void(^)(NSError *error))ComBlock{
    
    if (type == GETType) {
        
        [self GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if (response) {
                response(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            if (ComBlock) {
                ComBlock(error);
            }
        }];
    }
    
}
@end
