//
//  JMTextViewViewController.m
//  TapeWork
//
//  Created by James Ren on 14-6-25.
//  Copyright (c) 2014年 Rjm. All rights reserved.
//

#import "JMTextViewViewController.h"

@interface JMTextViewViewController ()

@end

@implementation JMTextViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 100, 10, 24)]; //初始化大小并自动释放
    
    self.textView.textColor = [UIColor blackColor];//设置textview里面的字体颜色
    
    self.textView.font = [UIFont fontWithName:@"Arial" size:18.0];//设置字体名字和字体大小
    
    self.textView.delegate = self;//设置它的委托方法
    
    self.textView.backgroundColor = [UIColor whiteColor];//设置它的背景颜色
    
    self.textView.showsHorizontalScrollIndicator = NO;
//    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.textView];
    
}

- (void)textViewDidChange:(UITextView *)textView{
    CGSize size = CGSizeMake(320,2000);
    CGSize sportlabelsize = [self.textView.text sizeWithFont:self.textView.font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    
    [self.textView setFrame:CGRectMake(20, 100, sportlabelsize.width, 24)];
//    NSLog(@"%f,%f",self.textView.frame.size.height,self.textView.contentSize.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
