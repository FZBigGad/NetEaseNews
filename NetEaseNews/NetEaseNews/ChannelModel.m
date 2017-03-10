
//
//  ChannelModel.m
//  NetEaseNews
//
//  Created by fangzhengwei on 2017/3/10.
//  Copyright © 2017年 fangzhengwei. All rights reserved.
//

#import "ChannelModel.h"
#import <YYModel.h>
@implementation ChannelModel

+ (NSArray *)createChannelModel{
    
    NSString *str = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    
    NSData *data = [NSData dataWithContentsOfFile:str];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    NSArray *array = [NSArray yy_modelArrayWithClass:[ChannelModel class] json:dict[@"tList"]];
    
    array = [array sortedArrayUsingComparator:^NSComparisonResult(ChannelModel *obj1,ChannelModel *obj2) {
        
        return [obj1.tid compare:obj2.tid];
    }];
    
    return array;
}

- (NSString *)description{
    
    NSString *str = [NSString stringWithFormat:@"%@--%@",self.tid,self.tname];
    
    return str;
}
@end
