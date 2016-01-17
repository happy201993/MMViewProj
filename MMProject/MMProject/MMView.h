//
//  MMView.h
//  MMProject
//
//  Created by jack on 16/1/17.
//  Copyright © 2016年 YCompany. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MMViewMode) {
    MMViewMode_None = -3,
//    MMViewMode_Wrap_Content,
    MMViewMode_Fill_Parent,
};

@interface MMView : UIView


/** 宽度 */
@property (nonatomic,assign) MMViewMode layout_width;


/** 高度 */
@property (nonatomic,assign) MMViewMode layout_height;

/** 初始化 */
- (instancetype)initWithLayoutWidth:(MMViewMode)width LayoutHeight:(MMViewMode)height;

@end
