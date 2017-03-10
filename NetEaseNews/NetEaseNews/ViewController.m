//
//  ViewController.m
//  NetEaseNews
//
//  Created by fangzhengwei on 2017/3/10.
//  Copyright © 2017年 fangzhengwei. All rights reserved.
//

#import "ViewController.h"
#import "ChannelModel.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *newsScrollView;

@property (weak, nonatomic) IBOutlet UICollectionView *newsCollection;

@property (nonatomic, strong) NSArray *channelData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];

}

- (void)loadData{
    
    self.channelData = [ChannelModel createChannelModel];
    for (ChannelModel *model in self.channelData) {
        NSLog(@"%@",model);
    }
}

- (NSArray *)channelData{
    if (!_channelData) {
        
        _channelData = [NSArray array];

    }
    return _channelData;
}
@end
