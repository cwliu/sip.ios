//
//  NSArray+MSSerialization.m
//  MSGraphSDK
//
//  Created by Kevin Lam on 3/31/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

#import "NSArray+MSSerialization.h"
#import "MSObject.h"
#import "NSDate+MSSerialization.h"

@implementation NSArray (MSSerialization)

- (NSArray *) arrayFromItem
{
    NSMutableArray *retArray = [NSMutableArray arrayWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        retArray[idx] = [MSObject getNSJsonSerializationCompatibleValue:obj];
    }];
    return retArray;
}

@end
