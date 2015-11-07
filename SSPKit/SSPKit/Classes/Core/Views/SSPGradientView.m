//
//  GradientView.m
//  Insignia
//
//  Created by Vasilyev M.B. on 02/04/15.
//
//

#import "SSPGradientView.h"

@implementation SSPGradientView

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupGradient];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupGradient];
        [self.layer insertSublayer:self.gradientLayer atIndex:0];
    }
    return self;
}

- (void)setupGradient {
    _gradientLayer = [CAGradientLayer layer];
    _gradientLayer.locations = @[@0, @1];
    
    self.startColor = [UIColor colorWithWhite:0.0 alpha:1.0];
    self.endColor = [UIColor colorWithWhite:1.0 alpha:1.0];
    self.startPoint = CGPointZero;
    self.endPoint = CGPointMake(0.0, 1.0);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.layer insertSublayer:self.gradientLayer atIndex:0];
}

- (void)updateColors {
    if (self.startColor && self.endColor) {
        self.gradientLayer.colors = @[(id)self.startColor.CGColor, (id)self.endColor.CGColor];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.layer.bounds;
}

- (void)setStartColor:(UIColor *)startColor {
    _startColor = startColor;
    [self updateColors];
}

- (void)setEndColor:(UIColor *)endColor {
    _endColor = endColor;
    [self updateColors];
}

- (void)setStartPoint:(CGPoint)startPoint {
    _startPoint = startPoint;
    self.gradientLayer.startPoint = startPoint;
}

- (void)setEndPoint:(CGPoint)endPoint {
    _endPoint = endPoint;
    self.gradientLayer.endPoint = endPoint;
}

@end
