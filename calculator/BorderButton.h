//
//  BorderButton.h
//  calculator
//
//  Created by 伊藤孝史 on 2016/12/19.
//  Copyright © 2016年 伊藤孝史. All rights reserved.
//

#ifndef BorderButton_h
#define BorderButton_h

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface BorderButton : UIButton

@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;

@end

#endif /* BorderButton_h */
