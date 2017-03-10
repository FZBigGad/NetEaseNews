//
//  ViewController.m
//  NetEaseNews
//
//  Created by fangzhengwei on 2017/3/10.
//  Copyright © 2017年 fangzhengwei. All rights reserved.
//

#import "ViewController.h"
#import "ChannelModel.h"
#import "ChannelLabel.h"
#import "FZNewsCollectionCell.h"
#define scrollLabelWidth 80
#define scrollLabelHeight 44

@interface ViewController ()<UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIScrollView *newsScrollView;

@property (weak, nonatomic) IBOutlet UICollectionView *newsCollection;

@property (nonatomic, strong) NSArray<ChannelModel *> *channelData;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self reloadNewsScrollView];
    
    [self reloadNewsCollection];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (void)reloadNewsScrollView{
   
    for (NSInteger i = 0; i < self.channelData.count; i++) {
        
        ChannelLabel *label = [[ChannelLabel alloc] init];
        
        label.font = [UIFont systemFontOfSize:15];
        
        label.text = self.channelData[i].tname;
        
        label.textAlignment = NSTextAlignmentCenter;
        
        [self.newsScrollView addSubview:label];
                               
        label.frame = CGRectMake(i * scrollLabelWidth, 0, scrollLabelWidth, scrollLabelHeight);
    }
    
    self.newsScrollView.contentSize = CGSizeMake(self.channelData.count * scrollLabelWidth , scrollLabelHeight);
    
    self.newsScrollView.showsVerticalScrollIndicator = NO;
    self.newsScrollView.showsHorizontalScrollIndicator = NO;
    
    
}

- (void)reloadNewsCollection{
    
    self.newsCollection.dataSource = self;
    
    self.flowLayout.itemSize = CGSizeMake(self.newsCollection.bounds.size.width, self.newsCollection.bounds.size.height);
    
    self.flowLayout.minimumLineSpacing = 0;
    self.flowLayout.minimumInteritemSpacing = 0;
    self.newsCollection.bounces = NO;
    
    self.newsCollection.showsVerticalScrollIndicator = NO;
    self.newsCollection.showsHorizontalScrollIndicator = NO;
    
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.newsCollection.pagingEnabled = YES;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.channelData.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FZNewsCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"newsCell" forIndexPath:indexPath];
    
    ChannelModel *model = self.channelData[indexPath.row];
    
    NSString *str = [NSString stringWithFormat:@"%@/0-20.html",model.tid];
    
    cell.urlStr = str;
    
    return cell;
}
- (void)loadData{
    
    self.channelData = [ChannelModel createChannelModel];
}

- (NSArray *)channelData{
    if (!_channelData) {
        
        _channelData = [NSArray array];
    }
    return _channelData;
}
@end
