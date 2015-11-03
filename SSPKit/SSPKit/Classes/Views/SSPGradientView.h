//
//  GradientView.h
//  Insignia
//
//  Created by Vasilyev M.B. on 02/04/15.
//
//

#import <UIKit/UIKit.h>

@interface SSPGradientView : UIView

@property (nonatomic, strong, readonly) CAGradientLayer *gradientLayer;

@property (nonatomic, strong) UIColor *startColor;
@property (nonatomic, strong) UIColor *endColor;
@property (nonatomic) CGPoint startPoint;
@property (nonatomic) CGPoint endPoint;

@end
