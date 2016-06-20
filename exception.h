#ifndef exception_h
#define exception_h

#import <Foundation/Foundation.h>

@interface Exception : NSObject

+ (BOOL)catchException:(void(^)())tryBlock error:(__autoreleasing NSError **)error;

@end

#endif /* exception_h */
