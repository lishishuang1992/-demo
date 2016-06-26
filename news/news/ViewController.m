//
//  ViewController.m
//  news
//
//  Created by 李世爽 on 16/6/25.
//  Copyright © 2016年 李世爽. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UITableView *mytableview;
    GetJson *getjson;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *_titleImage = [[UIImageView alloc]init];
    _titleImage.frame = CGRectMake(0, 0, MainScreenWidth, 44);
    _titleImage.backgroundColor = [UIColor whiteColor];
    _titleImage.userInteractionEnabled = YES;
    [self.view addSubview:_titleImage];
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 43.5, MainScreenWidth, 0.5)];
    lineView.backgroundColor = LINERGBA;
    [_titleImage addSubview:lineView];
    
    UILabel *_titleLabel = [[UILabel alloc]init];
    _titleLabel.text = @"新闻";
    [_titleLabel setTextColor:RGBA(51, 51, 51)];
    [_titleLabel setBackgroundColor:[UIColor clearColor]];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setFont:[UIFont systemFontOfSize:20.0]];
    _titleLabel.frame = CGRectMake(50, 10, MainScreenWidth-100, 34);
    [_titleImage addSubview:_titleLabel];
    
    
    
    UISearchBar *myserach = [[UISearchBar alloc] init];
    [self.view addSubview:myserach];
    myserach.delegate = self;
    myserach.barStyle = UISearchBarIconSearch;
    myserach.searchBarStyle = UISearchBarStyleDefault ;
    myserach.showsCancelButton = YES;
    [myserach mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    mytableview = [[UITableView alloc] init];
    [self.view addSubview:mytableview];
    mytableview.delegate = self;
    mytableview.dataSource = self;
    [mytableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(myserach.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    getjson = [[GetJson alloc] init];
    [getjson downloadTask:@"习近平"];
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(reloadTabelView:) name:@"mydata" object:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)reloadTabelView:(NSNotification*) notification{
    self.data = [notification object];
    NSArray *array = [self.data objectForKey:@"result"];
    self.contentArray = [[NSMutableArray alloc] init];
    self.titleArray = [[NSMutableArray alloc] init];
    self.pdateArray = [[NSMutableArray alloc] init];
    self.scrArray = [[NSMutableArray alloc] init];
    self.urlArray = [[NSMutableArray alloc] init];
    //NSLog(@"%@_____",array);
    for (NSDictionary *tempData in array) {
        [self.contentArray addObject:[tempData objectForKey:@"content"]];
        [self.titleArray addObject:[tempData objectForKey:@"title"]];
        [self.pdateArray addObject:[tempData objectForKey:@"pdate"]];
        [self.scrArray addObject:[tempData objectForKey:@"src"]];
        [self.urlArray addObject:[tempData objectForKey:@"url"]];
        
    }
    [mytableview reloadData];
}


#pragma UISearchBarDelegate
//点击键盘上的search按钮时调用

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar

{

    [getjson downloadTask:searchBar.text];
   
}


//cancel按钮点击时调用

- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
}


//点击搜索框时调用

- (void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
    
}




#pragma UITableViewDelegate


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"调用了吗？？？？？？？？");
    return [self.titleArray count];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    myCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == NULL)
    {
        cell = [[myCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell title:self.titleArray[indexPath.row] content:self.contentArray[indexPath.row] pdate:self.pdateArray[indexPath.row] src:self.scrArray[indexPath.row]];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//}

@end
