//
//  HLJTab.h
//  HLJNewClient
//
//  Created by xiezi on 16/6/30.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void  (^tapBlock) ();

@interface HLJTab : UIView

@property (nonatomic, assign) BOOL                           selected;

@property (nonatomic,strong) NSString                *title;

@property (nonatomic, readonly, strong) UIColor        *currentTitleColor;        // normal/selected
@property (nonatomic, readonly, strong) UIColor        *currentTitleShadowColor;  // normal/selected
@property (nonatomic, readonly, strong) UIImage        *currentImage;             // normal/selected

@property (nonatomic, readonly, strong) UILabel        *titleLabel;
@property (nonatomic, readonly, strong) UIImageView    *imageView;

//  设置选中的背景图片
@property (nonatomic, strong) UIImage                 *selectedBackgroundImage;

- (void) setTitleColor: (UIColor*)titleColor selected: (BOOL)selected;
- (void) setTitleShadowColor: (UIColor*)titleShadowColor selected: (BOOL)selected;
- (void) setImage: (UIImage*)image selected: (BOOL)selected;

- (void) setTouchDownBlock: (tapBlock)block;

+ (HLJTab *)tabWithImage:(UIImage *)image
           selectedImage:(UIImage *)selectedImage
 selectedBackgroundImage:(UIImage *)selectedBackgroundImage
                   title:(NSString *)title;

@end
