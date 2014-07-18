//
//  JMToolBotton.h
//  TapeWork
//
//  Created by cai chenxu on 14-5-16.
//  Copyright (c) 2014年 Rjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ToolButtonDelegate;

@interface JMToolBotton : UIView

@property (nonatomic, strong) id<ToolButtonDelegate> delegate;

@end

@protocol ToolButtonDelegate <NSObject>

-(void)ToolButton:(JMToolBotton *)toolButton btnTag:(int)tag;

@end
