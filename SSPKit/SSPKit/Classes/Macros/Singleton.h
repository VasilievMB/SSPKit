//
//  Singleton.h
//  SSPKit
//
//  Created by Vasiljev M.B. on 1/13/12.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#define DEFINE_SHARED_INSTANCE_USING_BLOCK(block) \
    static dispatch_once_t pred = 0; \
    __strong static id _sharedObject = nil; \
    dispatch_once(&pred, ^{ \
    _sharedObject = block(); \
    }); \
    return _sharedObject; \
