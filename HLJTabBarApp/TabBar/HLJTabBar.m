//
//  HLJTabBar.m
//  HLJNewClient
//
//  Created by xiezi on 16/6/30.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "HLJTabBar.h"
#import "HLJTab.h"

@interface HLJTabBar()

@property (nonatomic, strong) UIImageView *backgroundView;

@end

@implementation HLJTabBar


- (id)init
{
    if(self = [super init])
    {
        self.backgroundColor = [UIColor blackColor];
        
        _backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backgroundView.contentMode = UIViewContentModeScaleToFill ;
        [self addSubview:_backgroundView];
        
        self.frame = CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 49);
    }
    return self;
}

- (void) setItems:(NSArray *)items {
    
    _items = items;
    
    for(UIView *view in self.subviews) {
        if([view isKindOfClass:[HLJTab class]]) {
            [view removeFromSuperview];
        }
    }
    
    for (HLJTab* item in _items)
    {
        [self addSubview:item];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _backgroundView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    NSUInteger itemCount = [_items count];
    CGFloat tabWidth = self.frame.size.width/itemCount;

    for (NSUInteger i = 0 ; i < itemCount ; i++)
    {
        HLJTab* tab = [_items objectAtIndex:i];
        tab.frame = CGRectMake(tabWidth*i, 0.0, tabWidth, self.frame.size.height);
    }
}

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    _backgroundView.image = backgroundImage;
}

- (UIImage *)backgroundImage {
    return _backgroundView.image;
}

- (void)setSelectedItem:(HLJTab *)selectedItem {
    if ([_items containsObject:selectedItem]) {
        
        for (HLJTab* tab in _items)
        {
            if(tab == selectedItem) {
                tab.selected = YES;
            } else {
                tab.selected = NO;
            }
        }
        _selectedItem = selectedItem;
    }
}

@end
