//
//  JMTapeView.h
//  TapeWork
//
//  Created by cai chenxu on 14-5-16.
//  Copyright (c) 2014年 Rjm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
	TapeSmall = 0,
	TapeBig,
} TapeViewState;

@protocol tapeViewDelegate;

@interface JMTapeView : UIView<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    TapeViewState _state;
}

@property (nonatomic, strong) UITableView *tapeTable;
@property (nonatomic, strong) id<tapeViewDelegate> delegate;
@property (nonatomic, assign) TapeViewState state;

-(void)setState:(TapeViewState)aState;

@end

@protocol tapeViewDelegate <NSObject>

-(void)TapeView:(JMTapeView *)tapeView didSCroll:(float)num;

@end
