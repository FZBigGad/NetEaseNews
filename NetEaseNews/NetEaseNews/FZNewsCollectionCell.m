

//
//  FZNewsCollectionCell.m
//  NetEaseNews
//
//  Created by fangzhengwei on 2017/3/10.
//  Copyright © 2017年 fangzhengwei. All rights reserved.
//

#import "FZNewsCollectionCell.h"
#import "NetReuqestManager.h"
#import "TableViewModel.h"
static NSString *cellId = @"cellId";
@interface FZNewsCollectionCell ()<UITableViewDataSource>

@property (nonatomic, strong) NSArray<TableViewModel *> *tableViewData;

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation FZNewsCollectionCell

- (void)prepareForReuse{
    
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    
    [self.contentView addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];

}
- (void)setUrlStr:(NSString *)urlStr{
    
   [[NetReuqestManager shareManager] downLoadDataWithURLStr:urlStr andReuqestType:GETType andResponse:^(NSDictionary *reponse) {
       
       [TableViewModel createTableViewModelDic:reponse and:^(NSArray *tableViewData) {
           
           self.tableViewData = tableViewData;
           
           [self.tableView reloadData];
       }];
   } andComBlock:^(NSError * error) {
       
       NSLog(@"%@",error);
   }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.tableViewData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    TableViewModel *model = self.tableViewData[indexPath.row];
    
    cell.textLabel.text = model.title;
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    
    return cell;
}

- (NSArray *)tableViewData{
    if (!_tableViewData) {
        _tableViewData = [NSArray array];
    }
    return _tableViewData;
}
@end
