//
//  SSPGeometry.c
//  SSPKit
//
//  Created by Vasilyev M.B. on 14/08/15.
//  Copyright (c) 2015 Softinform. All rights reserved.
//

#include "SSPGeometry.h"

CGPoint CGPointScale(CGPoint point, CGFloat scale) {
    return CGPointMake(point.x * scale, point.y * scale);
}

CGSize CGSizeScale(CGSize size, CGFloat scale) {
    return CGSizeMake(size.width * scale, size.height * scale);
}

CGRect CGRectScale(CGRect rect, CGFloat scale) {
    rect.origin = CGPointScale(rect.origin, scale);
    rect.size = CGSizeScale(rect.size, scale);
    return rect;
}

CGPoint CGRectCenter(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

CGRect CGRectCenterToRect(CGRect rect0, CGRect rect1) {
    rect0.origin.x = CGRectGetMinX(rect1) + 0.5 * (CGRectGetWidth(rect1) - CGRectGetWidth(rect0));
    rect0.origin.y = CGRectGetMinY(rect1) + 0.5 * (CGRectGetHeight(rect1) - CGRectGetHeight(rect0));
    return rect0;
}

CGRect CGRectRound(CGRect rect) {
    return CGRectMake(round(rect.origin.x),
                      round(rect.origin.y),
                      round(rect.size.width),
                      round(rect.size.height));
}

CGSize CGSizeAspectFitSize(CGSize size, CGSize containerSize) {
    CGFloat scale = fmin(containerSize.width / size.width,
                         containerSize.height / size.height);
    return CGSizeScale(size, scale);
}

CGSize CGSizeAspectFillSize(CGSize size, CGSize containerSize) {
    CGFloat scale = fmax(containerSize.width / size.width,
                         containerSize.height / size.height);
    return CGSizeScale(size, scale);
}

CGRect CGRectMakeWithSize(CGSize size) {
    CGRect rect = CGRectZero;
    rect.size = size;
    return rect;
}

CGRect CGRectAspectFitRect(CGRect rect, CGRect containerRect) {
    rect.size = CGSizeAspectFitSize(rect.size, containerRect.size);
    return CGRectCenterToRect(rect, containerRect);
}

CGRect CGRectAspectFillRect(CGRect rect, CGRect containerRect) {
    rect.size = CGSizeAspectFillSize(rect.size, containerRect.size);
    return CGRectCenterToRect(rect, containerRect);
}

CGFloat CGPointDotProduct(CGPoint p0, CGPoint p1) {
    return p0.x * p1.x + p0.y * p1.y;
}

CGPoint CGPointAdd(CGPoint p0, CGPoint p1) {
    return CGPointMake(p0.x + p1.x, p0.y + p1.y);
}

CGPoint CGPointSubtract(CGPoint p0, CGPoint p1) {
    return CGPointMake(p0.x - p1.x, p0.y - p1.y);
}

CGFloat CGPointLengthSquared(CGPoint p) {
    return CGPointDotProduct(p, p);
}

CGFloat CGPointLength(CGPoint p) {
    return sqrt(CGPointLengthSquared(p));
}

CGFloat CGPointDistance(CGPoint p0, CGPoint p1) {
    return CGPointLength(CGPointSubtract(p0, p1));
}

CGFloat CGPointDistanceSquared(CGPoint p0, CGPoint p1) {
    return CGPointLengthSquared(CGPointSubtract(p0, p1));
}

CGPoint CGPointNegate(CGPoint p) {
    return CGPointMake(-p.x, -p.y);
}
