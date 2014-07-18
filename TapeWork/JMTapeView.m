//
//  JMTapeView.m
//  TapeWork
//
//  Created by cai chenxu on 14-5-16.
//  Copyright (c) 2014年 Rjm. All rights reserved.
//

#import "JMTapeView.h"

const CGFloat TapeLineHightShort = 10.0f;
const CGFloat TapeLineHightLong  = 20.0f;

@implementation JMTapeView
@synthesize state =_state;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置背景色渐变
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = self.bounds;
        gradient.colors = [NSArray arrayWithObjects:
                           (id)[UIColor colorWithRed:225.0 / 255.0 green:225.0 / 255.0 blue:225.0 / 255.0 alpha:1.0].CGColor,
                           (id)[UIColor whiteColor].CGColor,
                           (id)[UIColor colorWithRed:225.0 / 255.0 green:225.0 / 255.0 blue:225.0 / 255.0 alpha:1.0].CGColor,
                           nil];
        [self.layer insertSublayer:gradient atIndex:0];
        
        //设置圆角。边框
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4.0;
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        
        //旋转90度
        self.transform = CGAffineTransformMakeRotation(-M_PI / 2);
        
        [self initTableView];

    }
    return self;
}

-(void)initTableView{
    //定义横向tableview
    self.tapeTable = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
    self.tapeTable.delegate = self;
    self.tapeTable.dataSource = self;
    self.tapeTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tapeTable.showsHorizontalScrollIndicator = NO;
    self.tapeTable.showsVerticalScrollIndicator = NO;
    self.tapeTable.backgroundColor = [UIColor clearColor];
    [self addSubview:self.tapeTable];
    
    //设置中线
    UIView *centerLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height / 2 + 5, self.frame.size.width, 1)];
    centerLine.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2 + 5);
    centerLine.backgroundColor = [UIColor redColor];
    centerLine.layer.shadowOpacity = 0.5;
    centerLine.layer.shadowOffset = CGSizeMake(1, 1);
    centerLine.layer.shadowRadius = 2.0;
    centerLine.layer.shadowColor = [UIColor redColor].CGColor;
    [self addSubview:centerLine];

}

#pragma mark - Table view delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2020;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ClassificationCellIdentifier = @"Cell";
    
    UIView *line = nil;
    UILabel *label = nil;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ClassificationCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ClassificationCellIdentifier];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.transform = CGAffineTransformMakeRotation(M_PI / 2);
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    switch (_state) {
        case TapeSmall:

            if ((indexPath.row - 14) % 10 == 0 && indexPath.row != 4) {
                line = [[UIView alloc]initWithFrame:CGRectMake(5, 0, 1, TapeLineHightLong)];
                line.backgroundColor = [UIColor blackColor];
                [cell.contentView addSubview:line];
        
                label = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 100, 20)];
                label.center = CGPointMake(5, 50);
                label.textAlignment = NSTextAlignmentCenter;
                label.text = [NSString stringWithFormat:@"%i",(int)(indexPath.row / 10)-1];
                [cell.contentView addSubview:label];
            }else{
                line = [[UIView alloc]initWithFrame:CGRectMake(5, 0, 1, TapeLineHightShort)];
                line.backgroundColor = [UIColor blackColor];
                [cell.contentView addSubview:line];
            }
            break;
            
        case TapeBig:
            if ((indexPath.row - 14) % 10 == 0 && indexPath.row != 4) {
                line = [[UIView alloc]initWithFrame:CGRectMake(5, 0, 1, TapeLineHightLong)];
                line.backgroundColor = [UIColor blackColor];
                [cell.contentView addSubview:line];
                
                label = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, 100, 20)];
                label.center = CGPointMake(5, 50);
                label.textAlignment = NSTextAlignmentCenter;
                label.text = [NSString stringWithFormat:@"%i",(int)(indexPath.row / 10)-1];
                [cell.contentView addSubview:label];
            }else if((indexPath.row - 14) % 5 == 0 && (indexPath.row - 14) % 10 != 0 ){
                line = [[UIView alloc]initWithFrame:CGRectMake(5, 0, 1, TapeLineHightShort)];
                line.backgroundColor = [UIColor blackColor];
                [cell.contentView addSubview:line];
            }
            break;
        default:
            break;
    }
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中了%.1f",(float)(indexPath.row/10));
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int row = self.tapeTable.contentOffset.y / 10;
    
    NSLog(@"%f",(float)row/10);
    
    float num = (float)(row)/10;
    
    if (![self respondsToSelector:@selector(TapeView:didSCroll:)]) {
        [self.delegate TapeView:self didSCroll:num];
    }

}

-(void)setState:(TapeViewState)aState{
    _state = aState;
    [self.tapeTable reloadData];
}


@end
