// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSObject.h"
#import "MSCollection.h"
#import "NSDate+MSSerialization.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@implementation MSObject

- (instancetype)init
{
    self = [super init];
    if (self){
        _dictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary*)dictionary
{
    // if there is no dictionary we don't want to create the object
    if (!dictionary){
        return nil;
    }
    self = [super init];
    if (self){
        _dictionary = [dictionary mutableCopy];
    }
    return self;
}

- (NSDictionary*)dictionaryFromItem
{
    NSMutableDictionary *fullDictionary = [NSMutableDictionary dictionary];
    [self.dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop){
            fullDictionary[key] = [MSObject getNSJsonSerializationCompatibleValue:obj];
    }];
    return fullDictionary;
}

- (NSDate *)dateFromString:(NSString *)dateString
{
    return [NSDate ms_dateFromString:dateString];
}

- (NSString *)description
{
    return [[self dictionaryFromItem] description];
}

+ (id) getNSJsonSerializationCompatibleValue:(id)val
{
    if (!val) {
        return [NSNull null];
    }
    if ([val respondsToSelector:@selector(dictionaryFromItem)]){
        return [val dictionaryFromItem];
    }
    if ([val respondsToSelector:@selector(arrayFromItem)]){
        return [val arrayFromItem];
    }
    if ([val respondsToSelector:@selector(ms_toString)]){
        return [val ms_toString];
    }
    
    return val;
}

@end


