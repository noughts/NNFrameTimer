
// a) Use NBULog for logging when available
#if __has_include("NBULog.h")

#import "NBULog+NBUKit.h"

#undef  LOG_CONTEXT
#define LOG_CONTEXT NBUKIT_LOG_CONTEXT

#undef  LOG_MODULE
#define LOG_MODULE  NBUKIT_MODULE_DEFAULT

#undef  LOG_LEVEL
#define LOG_LEVEL   [NBULog kitLogLevel]


// b) Else try CocoaLumberjack
#elif __has_include("DDLog.h")

#ifdef DEBUG
#define NBUKIT_LOG_LEVEL DDLogLevelVerbose
#else
#define NBUKIT_LOG_LEVEL DDLogLevelWarning
#endif

#define LOG_LEVEL_DEF   NBUKIT_LOG_LEVEL
#import <CocoaLumberjack/DDLog.h>

#define NBULogError(frmt, ...)      DDLogError(frmt, ##__VA_ARGS__)
#define NBULogWarn(frmt, ...)       DDLogWarn(frmt, ##__VA_ARGS__)
#define NBULogInfo(frmt, ...)       DDLogInfo(frmt, ##__VA_ARGS__)
#define NBULogDebug(frmt, ...)      DDLogDebug(frmt, ##__VA_ARGS__)
#define NBULogVerbose(frmt, ...)    DDLogVerbose(frmt, ##__VA_ARGS__)
#define NBULogTrace()               NBULogDebug(@"%@", THIS_METHOD)


// c) Else fallback to NSLog
#else

#ifdef DEBUG
#define LOG_LEVEL 3
#else
#define LOG_LEVEL 2
#endif

#define THIS_METHOD                 NSStringFromSelector(_cmd)
#define NBULogError(frmt, ...)      do{ if(LOG_LEVEL >= 1) NSLog((frmt), ##__VA_ARGS__); } while(0)
#define NBULogWarn(frmt, ...)       do{ if(LOG_LEVEL >= 2) NSLog((frmt), ##__VA_ARGS__); } while(0)
#define NBULogInfo(frmt, ...)       do{ if(LOG_LEVEL >= 3) NSLog((frmt), ##__VA_ARGS__); } while(0)
#define NBULogDebug(frmt, ...)      do{ if(LOG_LEVEL >= 4) NSLog((frmt), ##__VA_ARGS__); } while(0)
#define NBULogVerbose(frmt, ...)    do{ if(LOG_LEVEL >= 5) NSLog((frmt), ##__VA_ARGS__); } while(0)
#define NBULogTrace()               NBULogDebug(@"%@", THIS_METHOD)

#endif