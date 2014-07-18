//
//  JMToolBotton.m
//  TapeWork
//
//  Created by cai chenxu on 14-5-16.
//  Copyright (c) 2014年 Rjm. All rights reserved.
//

#import "JMToolBotton.h"

@implementation JMToolBotton
{
    NSMutableArray *btnArray;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        btnArray = [[NSMutableArray alloc]init];
        for (int i = 0; i<2; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setFrame:CGRectMake(i*self.frame.size.width/2, 0, self.frame.size.width/2, self.frame.size.height)];
            [button setBackgroundColor:[UIColor whiteColor]];
            if (i == 0) {
                [button setTitle:@"紧凑模式" forState:UIControlStateNormal];
                button.selected = YES;
                [button setBackgroundColor:UIColorFromRGB(0x00bf8f)];
            }else{
                [button setTitle:@"大模式" forState:UIControlStateNormal];
            }
            button.tag = i;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            [button setTitleColor:UIColorFromRGB(0x00bf8f) forState:UIControlStateNormal];
            [button addTarget:self action:@selector(didSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
            [btnArray addObject:button];
            [self addSubview:button];
        }
    }
    return self;
}

-(void)didSelectBtn:(id)sender{
    UIButton *btn = sender;
    for (UIButton *button in btnArray) {
        button.selected = NO;
        button.backgroundColor = [UIColor whiteColor];
        if (button == btn) {
            button.selected = YES;
            button.backgroundColor = UIColorFromRGB(0x00bf8f);
        }
    }
    if (![self respondsToSelector:@selector(ToolButton:btnTag:)]) {
        [self.delegate ToolButton:self btnTag:btn.tag];
    }
}

@end
