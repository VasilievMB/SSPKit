//
//  SSPGeometry.h
//  SSPKit
//
//  Created by Vasilyev M.B. on 14/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#ifndef __SSPKit__SSPGeometry__
#define __SSPKit__SSPGeometry__

#import <CoreGraphics/CoreGraphics.h>
#import <math.h>

CGPoint CGPointScale(CGPoint point, CGFloat scale);
CGSize CGSizeScale(CGSize size, CGFloat scale);
CGRect CGRectScale(CGRect rect, CGFloat scale);

CGPoint CGRectCenter(CGRect rect);
CGRect CGRectCenterToRect(CGRect rect0, CGRect rect1);
CGRect CGRectRound(CGRect rect);

CGSize CGSizeAspectFitSize(CGSize size, CGSize containerSize);
CGSize CGSizeAspectFillSize(CGSize size, CGSize containerSize);

CGFloat CGPointDotProduct(CGPoint p0, CGPoint p1);
CGPoint CGPointAdd(CGPoint p0, CGPoint p1);
CGPoint CGPointSubtract(CGPoint p0, CGPoint p1);
CGFloat CGPointLengthSquared(CGPoint p);
CGFloat CGPointLength(CGPoint p);
CGFloat CGPointDistance(CGPoint p0, CGPoint p1);
CGFloat CGPointDistanceSquared(CGPoint p0, CGPoint p1);
CGPoint CGPointNegate(CGPoint p);

#endif /* defined(__SSPKit__SSPGeometry__) */
