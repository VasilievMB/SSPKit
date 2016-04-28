//
//  SSPGeometry.c
//  SSPKit
//
//  Created by Vasilyev M.B. on 14/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#include "SSPGeometry.h"

CGPoint sspCGPointScale(CGPoint point, CGFloat scale) {
    return CGPointMake(point.x * scale, point.y * scale);
}

CGSize sspCGSizeScale(CGSize size, CGFloat scale) {
    return CGSizeMake(size.width * scale, size.height * scale);
}

CGRect sspCGRectScale(CGRect rect, CGFloat scale) {
    rect.origin = sspCGPointScale(rect.origin, scale);
    rect.size = sspCGSizeScale(rect.size, scale);
    return rect;
}

CGPoint sspCGRectCenter(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

CGRect sspCGRectCenterToRect(CGRect rect0, CGRect rect1) {
    rect0.origin.x = CGRectGetMinX(rect1) + 0.5 * (CGRectGetWidth(rect1) - CGRectGetWidth(rect0));
    rect0.origin.y = CGRectGetMinY(rect1) + 0.5 * (CGRectGetHeight(rect1) - CGRectGetHeight(rect0));
    return rect0;
}

CGRect sspCGRectRound(CGRect rect) {
    return CGRectMake(round(rect.origin.x),
                      round(rect.origin.y),
                      round(rect.size.width),
                      round(rect.size.height));
}

CGSize sspCGSizeAspectFitSize(CGSize size, CGSize containerSize) {
    CGFloat scale = fmin(containerSize.width / size.width,
                         containerSize.height / size.height);
    return sspCGSizeScale(size, scale);
}

CGSize sspCGSizeAspectFillSize(CGSize size, CGSize containerSize) {
    CGFloat scale = fmax(containerSize.width / size.width,
                         containerSize.height / size.height);
    return sspCGSizeScale(size, scale);
}

CGRect sspCGRectMakeWithSize(CGSize size) {
    CGRect rect = CGRectZero;
    rect.size = size;
    return rect;
}

CGRect sspCGRectAspectFitRect(CGRect rect, CGRect containerRect) {
    rect.size = sspCGSizeAspectFitSize(rect.size, containerRect.size);
    return sspCGRectCenterToRect(rect, containerRect);
}

CGRect sspCGRectAspectFillRect(CGRect rect, CGRect containerRect) {
    rect.size = sspCGSizeAspectFillSize(rect.size, containerRect.size);
    return sspCGRectCenterToRect(rect, containerRect);
}

CGFloat sspCGPointDotProduct(CGPoint p0, CGPoint p1) {
    return p0.x * p1.x + p0.y * p1.y;
}

CGPoint sspCGPointAdd(CGPoint p0, CGPoint p1) {
    return CGPointMake(p0.x + p1.x, p0.y + p1.y);
}

CGPoint sspCGPointSubtract(CGPoint p0, CGPoint p1) {
    return CGPointMake(p0.x - p1.x, p0.y - p1.y);
}

CGFloat sspCGPointLengthSquared(CGPoint p) {
    return sspCGPointDotProduct(p, p);
}

CGFloat sspCGPointLength(CGPoint p) {
    return sqrt(sspCGPointLengthSquared(p));
}

CGFloat sspCGPointDistance(CGPoint p0, CGPoint p1) {
    return sspCGPointLength(sspCGPointSubtract(p0, p1));
}

CGFloat sspCGPointDistanceSquared(CGPoint p0, CGPoint p1) {
    return sspCGPointLengthSquared(sspCGPointSubtract(p0, p1));
}

CGPoint sspCGPointNegate(CGPoint p) {
    return CGPointMake(-p.x, -p.y);
}
