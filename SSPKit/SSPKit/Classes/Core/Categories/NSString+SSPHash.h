//
//  NSString+SSPHash.h
//  CarelessDrawing
//
//  Created by Vasilyev M.B. on 12/02/14.
//  Copyright (c) 2014 SSP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SSPHash)

/*
 There is 'hash' property in NSString BUT
 Apple doc says 'You should not rely on this property having the same hash value across releases of OS X / iOS'
 This property has same value across all platforms/releases.
 */

@property (readonly) UInt32 ssp_hash;

@end
