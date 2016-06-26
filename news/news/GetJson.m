//
//  GetJson.m
//  news
//
//  Created by 李世爽 on 16/6/25.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "GetJson.h"

@implementation GetJson

-(instancetype)init{
    self = [super init];
    if (self) {
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
        
        // 检测网络连接的单例,网络变化时的回调方法
        [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            NSLog(@"%ld", (long)status);
        }];
    }
    return self;
}




- (void)downloadTask:(NSString *)searchString
{
    // 1. URL
    NSString *urlString = [NSString stringWithFormat:@"http://op.juhe.cn/onebox/news/query?key=80c8863c23f49138b8c2d80147ff3a60&q=%@",searchString];
    urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    // 2. Request
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:0 timeoutInterval:2.0];
    // 3. Session
    NSURLSession *session = [NSURLSession sharedSession];
    // 4. download
    [[session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        // 下载的位置,沙盒中tmp目录中的临时文件,会被及时删除
        NSLog(@"下载完成 %@ %@", location, [NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            // 从网络下载下来的是二进制数据
            NSData *data = [NSData dataWithContentsOfURL:location];
            NSString *strJson =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSDictionary *jsonDictionary = [strJson objectFromJSONString];
             [[NSNotificationCenter defaultCenter] postNotificationName:@"mydata" object:jsonDictionary];
            
        });
        if (error) {
            NSLog(@"error%@",error);
        }
    }] resume];
    NSLog(@"这回事个标记");
}

@end
