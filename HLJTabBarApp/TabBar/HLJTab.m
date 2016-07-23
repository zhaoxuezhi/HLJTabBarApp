//
//  HLJTab.m
//  HLJNewClient
//
//  Created by xiezi on 16/6/30.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "HLJTab.h"

@interface HLJTab()

@property (nonatomic, strong) UIImageView           *backgroundView;

@property (nonatomic,strong) UIColor                 *normalTitleColor;
@property (nonatomic,strong) UIColor                 *normalTitleShadowColor;
@property (nonatomic,strong) UIImage                 *normalImage;

@property (nonatomic,strong) UIColor                 *selectedTitleColor;
@property (nonatomic,strong) UIColor                 *selectedTitleShadowColor;
@property (nonatomic,strong) UIImage                 *selectedImage;

@property (nonatomic,strong) tapBlock                 touchDownBlock;

@end

@implementation HLJTab

- (id)init
{
    self = [super init];
    if (self) {
        _backgroundView = [[UIImageView alloc] init];
        _backgroundView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_backgroundView];
        
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_titleLabel];
        
        [self setTitleColor:[UIColor whiteColor] selected:NO];
        [self setTitleShadowColor:[UIColor clearColor] selected:NO];
        
        [self configureViewsSelected:NO];
        self.userInteractionEnabled = YES;
    }
    return self;
}

+ (HLJTab *)tabWithImage:(UIImage *)image
           selectedImage:(UIImage *)selectedImage
 selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                   title:(NSString *)title
{
    HLJTab* tab = [[HLJTab alloc] init];
    tab.titleLabel.font = [UIFont boldSystemFontOfSize:10.0f];
    tab.titleLabel.textAlignment = NSTextAlignmentCenter;
    tab.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [tab setTitleColor:[UIColor colorWithWhite:0.6f alpha:1.0f] selected:NO];
    [tab setTitleColor:[UIColor whiteColor] selected:YES];
    
    [tab setImage:image selected:NO];
    [tab setImage:selectedImage selected:YES];
    
    tab.selectedBackgroundImage = selectedBackgroundImage;
    
    tab.title = title;
    
    return tab;
}


- (void) layoutSubviews {
    [super layoutSubviews];
    
    
    _backgroundView.frame = self.bounds;
    
    CGFloat paddingH = 3.0f;
    CGFloat paddingV = 3.0f;
    CGFloat requiredWidth = self.bounds.size.width - 2*paddingH;
   
    CGSize titleSize = [self.titleLabel sizeThatFits:CGSizeMake(requiredWidth, MAXFLOAT)];

    if (self.currentImage && self.title.length > 0) {
        CGFloat imageHeight = self.bounds.size.height - titleSize.height - paddingV;
        
        self.imageView.frame = CGRectMake(paddingH, paddingV, requiredWidth, imageHeight);
        
        self.titleLabel.frame = CGRectMake(paddingH, imageHeight + paddingV, requiredWidth, titleSize.height);
        
    } else if (self.title.length > 0) {
        self.titleLabel.frame = CGRectMake(paddingH, (self.bounds.size.height-titleSize.height)/2, requiredWidth, titleSize.height);
        
    } else if (self.currentImage) {
        self.imageView.frame = CGRectMake((self.frame.size.width-49)/2, 0, 49, 49);
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (_touchDownBlock) {
        _touchDownBlock();
    }
}

- (void)setSelected:(BOOL)selected {
    if (_selected != selected) {
        [self configureViewsSelected:selected];
    }
    _selected = selected;
}

- (void) configureViewsSelected:(BOOL)selected {
    _backgroundView.hidden = !selected;
    
    if (selected) {
        _titleLabel.textColor = _selectedTitleColor;
        _titleLabel.shadowColor = _selectedTitleShadowColor;
        
        _imageView.image = _selectedImage;
    } else {
        _titleLabel.textColor = _normalTitleColor;
        _titleLabel.shadowColor = _normalTitleShadowColor;
        
        _imageView.image = _normalImage;
    }
}

- (void) setTitleColor:(UIColor*)titleColor selected:(BOOL)selected {
    if (!_normalTitleColor || !selected) {
        _normalTitleColor = titleColor;
    }
    
    if (!_selectedTitleColor || selected) {
        _selectedTitleColor = titleColor;
    }
    
    if (selected == self.selected) {
        _titleLabel.textColor = titleColor;
    }
}

- (void) setTitleShadowColor:(UIColor*)titleShadowColor selected:(BOOL)selected {
    if (!_normalTitleShadowColor || !selected) {
        _normalTitleShadowColor = titleShadowColor;
    }
    
    if (!_selectedTitleShadowColor || selected) {
        _selectedTitleShadowColor = titleShadowColor;
    }
    
    if (selected == self.selected) {
        _titleLabel.shadowColor = titleShadowColor;
    }
}

- (void) setImage:(UIImage*)image selected:(BOOL)selected {
    
    if (!_normalImage || !selected) {
        _normalImage = image;
    }
    
    if (!_selectedImage || selected) {
        _selectedImage = image;
    }
    
    if (selected == self.selected) {
        _imageView.image = image;
    }
}

- (void)setTouchDownBlock:(tapBlock)block {
    _touchDownBlock = [block copy];
}

#pragma mark Convenience Methods

- (void) setTitle:(NSString*)title {
    _titleLabel.text = title;
}

- (NSString*) title {
    return _titleLabel.text;
}

- (void) setSelectedBackgroundImage:(UIImage *)selectedBackgroundImage {
    _backgroundView.image = selectedBackgroundImage;
}

- (UIImage*) selectedBackgroundImage {
    return _backgroundView.image;
}

- (UIColor *)currentTitleColor {
    return (_selected) ? _selectedTitleColor : _normalTitleColor;
}

- (UIColor *)currentTitleShadowColor {
    return (_selected) ? _selectedTitleShadowColor : _normalTitleShadowColor;
}

- (UIImage*)currentImage {
    return (_selected) ? _selectedImage : _normalImage;
}

@end
