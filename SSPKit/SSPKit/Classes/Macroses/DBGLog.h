//
//  DBGLog.h
//  MoPals
//
//  Created by Vasiljev M.B. on 2/22/13.
//  Copyright (c) 2013 Dirsha A.A. All rights reserved.
//

#ifndef MoPals_DBGLog_h
#define MoPals_DBGLog_h

#ifdef DEBUG
#define DBGLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DBGLog(fmt, ...)
#endif

#endif
