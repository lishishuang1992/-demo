//
//  myCell.m
//  news
//
//  Created by 李世爽 on 16/6/25.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "myCell.h"

@implementation myCell
{
    UILabel *title;
    UILabel *pdate;
    UILabel *src;
    UITextField *content;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        title = [[UILabel alloc] init];
        pdate = [[UILabel alloc] init];
        src = [[UILabel alloc] init];
        content = [[UITextField alloc] init];
        [self addSubview:title];
        [self addSubview:pdate];
        [self addSubview:src];
        [self addSubview:content];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(2);
            make.left.equalTo(self.mas_left).with.offset(3);
            make.bottom.equalTo(self.mas_bottom).with.offset(10);
            make.right.equalTo(self.mas_centerX).with.offset(0);
        }];
        
        [pdate  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(2);
            make.bottom.equalTo(self.mas_bottom).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
        }];
        
        [src mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).with.offset(2);
           make.right.equalTo(self.mas_right).with.offset(-5);
        }];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(15);
            make.centerX.equalTo(self.mas_centerX);
            make.left.equalTo(self.mas_left).with.offset(3);
            make.bottom.equalTo(self.mas_bottom).with.offset(5);
            make.right.equalTo(self.mas_right).with.offset(-3);
        }];
       
    }
    return self;
}

-(void)title:(NSString *)newsTitle content:(NSString *)newsContent pdate:(NSString *)newsPdate src:(NSString *)newsScr
{
    title.text = newsTitle;
    content.text = newsContent;
    pdate.text = newsPdate;
    src.text = newsScr;

}
@end
