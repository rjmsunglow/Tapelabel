//
//  JMViewController.h
//  TapeWork
//
//  Created by cai chenxu on 14-5-16.
//  Copyright (c) 2014年 Rjm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMTapeView.h"
#import "JMToolBotton.h"

@interface JMViewController : UIViewController<tapeViewDelegate,ToolButtonDelegate>

@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, strong) JMTapeView *tapeView;
@property (nonatomic, strong) JMToolBotton *toolButton;

@end
