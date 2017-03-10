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
#define scrollLabelWidth 80
#define scrollLabelHeight 44

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *newsScrollView;

@property (weak, nonatomic) IBOutlet UICollectionView *newsCollection;

@property (nonatomic, strong) NSArray<ChannelModel *> *channelData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    [self reloadNewsScrollView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)reloadNewsScrollView{
   
    for (NSInteger i = 0; i < self.channelData.count; i++) {
        
        ChannelLabel *label = [[ChannelLabel alloc] init];
        
        label.font = [UIFont systemFontOfSize:15];
        
        label.text = self.channelData[i].tname;
        
        [self.newsScrollView addSubview:label];
                               
        label.frame = CGRectMake(i * scrollLabelWidth, 0, scrollLabelWidth, scrollLabelHeight);
    }
    
    self.newsScrollView.contentSize = CGSizeMake(self.channelData.count * scrollLabelWidth , scrollLabelHeight);
    
    self.newsScrollView.showsVerticalScrollIndicator = NO;
    self.newsScrollView.showsHorizontalScrollIndicator = NO;
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
