//
//  TesttableViewCell.m
//  tableView多选
//
//  Created by 杨礼军 on 2017/11/21.
//  Copyright © 2017年 GLW. All rights reserved.
//

#import "TesttableViewCell.h"

@implementation TesttableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)layoutSubviews
{
    
    for (UIControl *control in self.subviews){
        if ([control isMemberOfClass:NSClassFromString(@"UITableViewCellEditControl")]){
            for (UIView *view in control.subviews)
            {
                if ([view isKindOfClass: [UIImageView class]]) {
                    UIImageView *image=(UIImageView *)view;
                    if (self.selected) {
                        image.image=[UIImage imageNamed:@"morendizhi"];
                    }
                    else
                    {
                        image.image=[UIImage imageNamed:@"tongyiweixuan"];
                    }
                }
            }
        }
    }
    
    [super layoutSubviews];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    for (UIControl *control in self.subviews){
        if ([control isMemberOfClass:NSClassFromString(@"UITableViewCellEditControl")]){
            for (UIView *view in control.subviews)
            {
                if ([view isKindOfClass: [UIImageView class]]) {
                    UIImageView *image=(UIImageView *)view;
                    if (!self.selected) {
                        image.image=[UIImage imageNamed:@"tongyiweixuan"];
                    }
                }
            }
        }
    }
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
