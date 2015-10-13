//
//  UIView+Masonry_PCfans.h
//  
//
//  Created by PilotLab on 15/10/12.
//
//
/*
 横向或者纵向等间隙的排列一组view
 */
#import <UIKit/UIKit.h>

@interface UIView (Masonry_PCfans)

//水平等间隙
-(void) distributeSpacingHorizontallyWith:(NSArray*)views;

//垂直等间隙
- (void) distributeSpacingVerticallyWith:(NSArray*)views;
@end
