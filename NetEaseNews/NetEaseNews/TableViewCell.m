//
//  TableViewCell.m
//  NetEaseNews
//
//  Created by fangzhengwei on 2017/3/10.
//  Copyright © 2017年 fangzhengwei. All rights reserved.
//

#import "TableViewCell.h"
#import <UIImageView+WebCache.h>
#import "ImagesModel.h"
@interface TableViewCell ()
//图片
@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;
//标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//来源
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
//回复数
@property (weak, nonatomic) IBOutlet UILabel *replaycountLabel;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imagesArray;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
}

- (void)setBasicmodel:(TableViewModel *)basicmodel{
    
    _basicmodel = basicmodel;
   [self.imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:basicmodel.imgsrc]];
    self.titleLabel.text = basicmodel.title;
    self.sourceLabel.text = basicmodel.source;
    self.replaycountLabel.text = [NSString stringWithFormat:@"%zd",basicmodel.replyCount];
    
    for (NSInteger i = 0; i < self.imagesArray.count; i++) {
        
      ImagesModel *imageM = basicmodel.imgextra[i];
        [self.imagesArray[i] sd_setImageWithURL:[NSURL URLWithString:imageM.imgsrc]];
        
    }
}
@end





