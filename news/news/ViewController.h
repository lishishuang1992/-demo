//
//  ViewController.h
//  news
//
//  Created by 李世爽 on 16/6/25.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

#import "GetJson.h"
#import "myCell.h"
#define MainScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define MainScreenHEIGHT ([UIScreen mainScreen].bounds.size.height)
#define RGBA(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define LINERGBA [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0]
@interface ViewController : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSDictionary *data;
@property(nonatomic,strong)NSMutableArray *titleArray;
@property(nonatomic,strong)NSMutableArray *contentArray;
@property(nonatomic,strong)NSMutableArray *pdateArray;
@property(nonatomic,strong)NSMutableArray *scrArray;
@property(nonatomic,strong)NSMutableArray *urlArray;


@end

