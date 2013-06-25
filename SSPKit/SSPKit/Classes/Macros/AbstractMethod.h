//
//  AbstractMethod.h
//  SSPKit
//
//  Created by Dirsha A.A. on 16.05.13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#define ABSTRACT_METHOD { @throw [NSException exceptionWithName:@"Must be overriden by subclasses" \
                              reason:[NSString stringWithFormat:@"Abstract method %s", __FUNCTION__] \
                                                       userInfo:nil]; }
