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
#define ScreenWidth 375
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *newsScrollView;

@property (weak, nonatomic) IBOutlet UICollectionView *newsCollection;

@property (nonatomic, strong) NSArray<ChannelModel *> *channelData;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property (nonatomic, strong) NSMutableArray *channelArray;

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
        
        label.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapGesture:)];
        
        [label addGestureRecognizer:tap];
        
        [self.channelArray addObject:label];
    }
    
    self.newsScrollView.contentSize = CGSizeMake(self.channelData.count * scrollLabelWidth , scrollLabelHeight);
    
    
    self.newsScrollView.showsVerticalScrollIndicator = NO;
    self.newsScrollView.showsHorizontalScrollIndicator = NO;
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetXScale = scrollView.contentOffset.x / ScreenWidth;
    
    
    
}

- (void)labelTapGesture:(UITapGestureRecognizer *)gesture{
    
    ChannelLabel *label = (ChannelLabel *)gesture.view;
    
    [self channelLabelScrollToMiddle:label];
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForItem:[self.channelArray indexOfObject:label] inSection:0];
    
    [self.newsCollection scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

- (void)channelLabelScrollToMiddle:(UILabel *)channelLabel{
    
    CGFloat offsetX = channelLabel.center.x - ScreenWidth * 0.5;
    
    if (offsetX > 0 && offsetX < self.newsScrollView.contentSize.width - ScreenWidth) {
        
        [self.newsScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger index = scrollView.contentOffset.x / ScreenWidth;
    
    ChannelLabel *label = [self.channelArray objectAtIndex:index];
    
    [self channelLabelScrollToMiddle:label];
    
}

- (void)reloadNewsCollection{
    
    self.newsCollection.dataSource = self;
    self.newsCollection.delegate = self;
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
    
    ChannelModel *model = self.channelData[indexPath.item];
    
    NSString *str = [NSString stringWithFormat:@"%@/0-20.html",model.tid];
    
    cell.urlStr = str;
    
    return cell;
}

- (NSMutableArray *)channelArray{
    if (!_channelArray) {
        _channelArray = [NSMutableArray array];
    }
    
    return _channelArray;
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
