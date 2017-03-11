
//
//  TableViewModel.m
//  NetEaseNews
//
//  Created by fangzhengwei on 2017/3/10.
//  Copyright © 2017年 fangzhengwei. All rights reserved.
//

#import "TableViewModel.h"
#import "ImagesModel.h"

@implementation TableViewModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    
    return @{@"imgextra" : [ImagesModel class]};
}


+ (void)createTableViewModelDic:(NSDictionary *)dictData and:(void(^)(NSArray *))arrayData {
    
    NSString *key = dictData.allKeys.firstObject;
    
    NSArray *array = [dictData objectForKey:key];
    
    array = [NSArray yy_modelArrayWithClass:[TableViewModel class] json:array];
    
    if (arrayData) {
        arrayData(array);
    }
}

- (NSString *)description{
    
    NSString *str = [NSString stringWithFormat:@"%@-",self.title];
    
    return str;
}
@end
