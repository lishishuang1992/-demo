//
//  myModelObject.h
//  news
//
//  Created by 李世爽 on 16/6/25.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myModelObject : NSObject
@property(strong,nonatomic)NSString *title;
@property(strong,nonatomic)NSString *content;
@property(strong,nonatomic)NSString *pdate;
@property(strong,nonatomic)NSString *src;
@property(strong,nonatomic)NSString *url;
@property(nonatomic,strong)NSString *pdate_src;
@end
