
//
//  TableViewModel.m
//  NetEaseNews
//
//  Created by fangzhengwei on 2017/3/10.
//  Copyright © 2017年 fangzhengwei. All rights reserved.
//

#import "TableViewModel.h"

@implementation TableViewModel

+ (void)createTableViewModelDic:(NSDictionary *)dictData and:(void(^)(NSArray *))arrayData {
    
    NSString *key = dictData.allKeys.firstObject;
    
    NSArray *array = [dictData objectForKey:key];
    
    array = [NSArray yy_modelArrayWithClass:[TableViewModel class] json:array];
    
    if (arrayData) {
        arrayData(array);
    }
}
@end
