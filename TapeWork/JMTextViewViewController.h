//
//  JMTextViewViewController.h
//  TapeWork
//
//  Created by James Ren on 14-6-25.
//  Copyright (c) 2014年 Rjm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMTextViewViewController : UIViewController<UITextViewDelegate>
{
    UITextView *textView;
}

@property (nonatomic, strong) UITextView *textView;

@end
