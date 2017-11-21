//
//  ViewController.m
//  tableView多选
//
//  Created by 杨礼军 on 2017/11/21.
//  Copyright © 2017年 GLW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * mytableView;
    UIButton * btn;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mytableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    mytableView.delegate =self;
    mytableView.dataSource = self;
    mytableView.rowHeight = 50;
    [self.view addSubview:mytableView];
    
    //允许编辑的时候多选
    mytableView.allowsMultipleSelectionDuringEditing = YES;
    // Do any additional setup after loading the view, typically from a nib.
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 30, 20);
    [btn setTitle:@"多选" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarButtomItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightBarButtomItem;
}

-(void)rightAction:(UIButton *)sender{
    if (sender.selected) {
        sender.selected = NO;
        [mytableView setEditing:NO animated:YES];
    }else {
        sender.selected = YES;
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        [mytableView setEditing:YES animated:YES];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rererere"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"哈哈哈";
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    return cell;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *subviews = [[tableView cellForRowAtIndexPath:indexPath] subviews];
    for (id subCell in subviews) {
        if ([subCell isKindOfClass:[UIControl class]]) {
            for (UIImageView *circleImage in [subCell subviews]) {
                
                circleImage.image = [UIImage imageNamed:@"morendizhi"];
            }
        }
    }
    
     if (tableView.isEditing == NO) {//没编辑的时候
         
     }
}

//反选行的时候
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *subviews = [[tableView cellForRowAtIndexPath:indexPath] subviews];
    for (id subCell in subviews) {
        if ([subCell isKindOfClass:[UIControl class]]) {
            
            for (UIImageView *circleImage in [subCell subviews]) {
                
                circleImage.image = [UIImage imageNamed:@"tongyiweixuan"];
                
            }
        }
        
    }
    
    if (tableView.isEditing == YES) {
        
    } else {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
