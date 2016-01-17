//
//  MMView.m
//  MMProject
//
//  Created by jack on 16/1/17.
//  Copyright © 2016年 YCompany. All rights reserved.
//

#import "MMView.h"
#import "UIViewExt.h"

#define kParentViewKeyPath @"frame"

@implementation MMView

#pragma mark init
- (instancetype)initWithLayoutWidth:(MMViewMode)width LayoutHeight:(MMViewMode)height{
    if (self = [super init]) {
        _layout_width = width;
        _layout_height = height;
        [self initViewParams];
    }
    return self;
}

-(void)awakeFromNib{
    [self initViewParams];
}

- (void)initViewParams{
    if (self.layout_width != MMViewMode_None && self.layout_width != MMViewMode_Fill_Parent) {
        self.layout_width = MMViewMode_None;
    }
    if (self.layout_height != MMViewMode_None && self.layout_height != MMViewMode_Fill_Parent) {
        self.layout_height = MMViewMode_None;
    }
    
    if (self.layout_width != MMViewMode_None || self.layout_height != MMViewMode_None) {
        [self.superview addObserver:self forKeyPath:kParentViewKeyPath options:NSKeyValueObservingOptionNew context:nil];
    }
    
    
}

#pragma mark setter getter
- (void)setLayout_width:(MMViewMode)layout_width{
    _layout_width = layout_width;
}

- (void)setLayout_height:(MMViewMode)layout_height{
    _layout_height = layout_height;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:kParentViewKeyPath]) {
        CGRect superFrame = [[change objectForKey:@"new"] CGRectValue];
        if (self.layout_width == MMViewMode_Fill_Parent) {
            self.x = 0;
            self.width = superFrame.size.width;
        }
        if (self.layout_height == MMViewMode_Fill_Parent){
            self.height = superFrame.size.height;
            self.y = 0;
        }
    }
}
- (void)removeFromSuperview{
    if (self.layout_width != MMViewMode_None || self.layout_height != MMViewMode_None) {
        [self.superview removeObserver:self forKeyPath:kParentViewKeyPath];
    }
    
}



@end
