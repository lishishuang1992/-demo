//
//  GetJson.h
//  news
//
//  Created by 李世爽 on 16/6/25.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONKit.h"
#import "myModelObject.h"
#import "AFNetworking.h"
@interface GetJson : NSObject

-(void)downloadTask:(NSString *)searchString;
@end
