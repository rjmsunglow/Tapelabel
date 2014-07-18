//
//  JMViewController.m
//  TapeWork
//
//  Created by cai chenxu on 14-5-16.
//  Copyright (c) 2014年 Rjm. All rights reserved.
//

#import "JMViewController.h"

@interface JMViewController ()
{
    float cellHight;
}

@end

@implementation JMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"卷尺文本小组件";
    
    self.numLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    self.numLabel.center = CGPointMake(150, 200);
    self.numLabel.textAlignment = NSTextAlignmentCenter;
    self.numLabel.textColor = [UIColor redColor];
    self.numLabel.font = [UIFont boldSystemFontOfSize:22];
    self.numLabel.text = @"0";
    [self.view addSubview:self.numLabel];
    
    UILabel *danwei = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.numLabel.frame), CGRectGetMinY(self.numLabel.frame), 20, 30)];
    danwei.text = @"件";
    danwei.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:danwei];

    self.tapeView = [[JMTapeView alloc]initWithFrame:CGRectMake(0, 0, 70, 280)];
    self.tapeView.center = self.view.center;
    self.tapeView.delegate = self;
    [self.view addSubview:self.tapeView];
    
    self.toolButton = [[JMToolBotton alloc]initWithFrame:CGRectMake(60, 400, 200, 30)];
    self.toolButton.delegate = self;
    [self.view addSubview:self.toolButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tape view delegate
-(void)TapeView:(JMTapeView *)tapeView didSCroll:(float)num{
    NSLog(@"%f",num);
    switch (self.tapeView.state) {
        case TapeSmall:
        
            if (num >= 0) {
                self.numLabel.text = [NSString stringWithFormat:@"%.1f",num ];
            }else{
                self.numLabel.text = @"0.0";
            }
            break;
    
        case TapeBig:
        if (num >= 0) {
            if (num >= (int)num && num < (float)((int)num + 0.5)) {
                self.numLabel.text = [NSString stringWithFormat:@"%i",(int)num ];
            }else{
                self.numLabel.text = [NSString stringWithFormat:@"%.1f",(float)((int)num + 0.5) ];
            }
            
        }else{
            self.numLabel.text = @"0";
            }
            break;
        default:
            break;
    }
}

-(void)ToolButton:(JMToolBotton *)toolButton btnTag:(int)tag{
    if (tag == 0) {
        [self.tapeView setState:TapeSmall];
    }else{
        [self.tapeView setState:TapeBig];
    }
    NSIndexPath *ip=[NSIndexPath indexPathForRow:0 inSection:0];//更改indexpath和section来改变选中的选和行所在的section
    [self.tapeView.tapeTable selectRowAtIndexPath:ip animated:YES scrollPosition:UITableViewScrollPositionBottom];
}

@end
