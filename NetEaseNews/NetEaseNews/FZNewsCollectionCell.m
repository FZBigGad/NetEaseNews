

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
#define ScreenWidth 375
#define collectionHeight 667- 64-44
#import "TableViewCell.h"


@interface FZNewsCollectionCell ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray<TableViewModel *> *tableViewData;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FZNewsCollectionCell


- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, collectionHeight) style:UITableViewStylePlain];
    
    [self.contentView addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cellId"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BigPictureCell" bundle:nil] forCellReuseIdentifier:@"bigId"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ImagesCell" bundle:nil] forCellReuseIdentifier:@"bigId"];
}
- (void)setUrlStr:(NSString *)urlStr{
    
   [[NetReuqestManager shareManager] downLoadDataWithURLStr:urlStr andReuqestType:GETType andResponse:^(NSDictionary *reponse) {
       
       [TableViewModel createTableViewModelDic:reponse and:^(NSArray *tableViewData) {
           
           self.tableViewData = tableViewData;
           
       }];
         //刷新数据
         [self.tableView reloadData];
       
   } andComBlock:^(NSError * error) {
       
       NSLog(@"%@",error);
   }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.tableViewData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewModel *model = self.tableViewData[indexPath.row];
    
    TableViewCell *cell;
    
    if (model.imgType == YES) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"bigId" forIndexPath:indexPath];

    }else{
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];

    }

    
    cell.basicmodel = model;
    
    return cell;
}

- (NSArray *)tableViewData{
    if (!_tableViewData) {
        _tableViewData = [NSArray array];
    }
    return _tableViewData;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewModel *model = self.tableViewData[indexPath.row];
    
    if (model.imgType == YES) {
        
        return 180;
    }
    return 80;
}
@end

























