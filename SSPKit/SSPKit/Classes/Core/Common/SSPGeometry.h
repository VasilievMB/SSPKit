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

CGPoint sspCGPointScale(CGPoint point, CGFloat scale);
CGSize sspCGSizeScale(CGSize size, CGFloat scale);
CGRect sspCGRectScale(CGRect rect, CGFloat scale);

CGPoint sspCGRectCenter(CGRect rect);
CGRect sspCGRectCenterToRect(CGRect rect0, CGRect rect1);
CGRect sspCGRectRound(CGRect rect);

CGSize sspCGSizeAspectFitSize(CGSize size, CGSize containerSize);
CGSize sspCGSizeAspectFillSize(CGSize size, CGSize containerSize);

CGRect sspCGRectAspectFitRect(CGRect rect, CGRect containerRect);
CGRect sspCGRectAspectFillRect(CGRect rect, CGRect containerRect);

CGRect sspCGRectMakeWithSize(CGSize size);

CGFloat sspCGPointDotProduct(CGPoint p0, CGPoint p1);
CGPoint sspCGPointAdd(CGPoint p0, CGPoint p1);
CGPoint sspCGPointSubtract(CGPoint p0, CGPoint p1);
CGFloat sspCGPointLengthSquared(CGPoint p);
CGFloat sspCGPointLength(CGPoint p);
CGFloat sspCGPointDistance(CGPoint p0, CGPoint p1);
CGFloat sspCGPointDistanceSquared(CGPoint p0, CGPoint p1);
CGPoint sspCGPointNegate(CGPoint p);

#endif /* defined(__SSPKit__SSPGeometry__) */
