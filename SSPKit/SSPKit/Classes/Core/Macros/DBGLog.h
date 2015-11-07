//
//  DBGLog.h
//  SSPKit
//
//  Created by Vasiljev M.B. on 2/22/13.
//  Copyright (c) 2013 Softinform. All rights reserved.
//

#ifdef DEBUG
#define DBGLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DBGLog(fmt, ...)
#endif
