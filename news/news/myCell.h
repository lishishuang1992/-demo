//
//  myCell.h
//  news
//
//  Created by 李世爽 on 16/6/25.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
@interface myCell : UITableViewCell
-(void)title:(NSString *)newsTitle content:(NSString *)newsContent pdate:(NSString *)newsPdate src:(NSString *)newsScr;
@end
