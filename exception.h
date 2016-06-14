//
//  exception.h
//  GoodWox
//
//  Created by Cody Liu on 6/14/16.
//  Copyright © 2016 WiAdvance. All rights reserved.
//

#ifndef exception_h
#define exception_h

#import <Foundation/Foundation.h>

@interface Exception : NSObject

+ (BOOL)catchException:(void(^)())tryBlock error:(__autoreleasing NSError **)error;

@end

#endif /* exception_h */
