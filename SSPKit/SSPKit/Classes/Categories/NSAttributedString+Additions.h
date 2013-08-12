//
//  NSAttributedString+Additions.h
//  SSPKit
//
//  Created by Turov Y.V. on 01.08.13.
//  Copyright (c) 2013 SoftInform. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Additions)

- (NSAttributedString *)stringByAppendingDisclosureString:(NSAttributedString *)string constrainedToSize:(CGSize)size appended:(BOOL *)appended;

- (CGSize)sizeConstrainedToSize:(CGSize)maxSize;
- (CGSize)sizeConstrainedToSize:(CGSize)maxSize fitRange:(NSRange*)fitRange;

@end
