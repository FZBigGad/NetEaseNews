

//
//  FZNewsCollectionCell.m
//  NetEaseNews
//
//  Created by fangzhengwei on 2017/3/10.
//  Copyright © 2017年 fangzhengwei. All rights reserved.
//

#import "FZNewsCollectionCell.h"

@interface FZNewsCollectionCell ()<UITableViewDataSource>

@end

@implementation FZNewsCollectionCell

- (void)awakeFromNib{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    [self.contentView addSubview:tableView];
    
    tableView.dataSource = self;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
}
@end
