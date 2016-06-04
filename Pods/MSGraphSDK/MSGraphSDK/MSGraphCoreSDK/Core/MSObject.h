// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import <Foundation/Foundation.h>

/**
 The `MSObject` is the base class for all Graph objects.
 @see MSItem for an example.
 */
@interface MSObject : NSObject

/**
 Creates an MSObject with the given dictionary.
 @param dictionary The dictionary representation of the object.
 @warning This method will return nil if the dictionary is nil.
 */
- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

/**
 Creates a dictionary from the given item.
 @return dictionary Representation for the given item.
 */
- (NSDictionary*)dictionaryFromItem;

/**
 Creates an NSDate from a string returned by the server.
 @param A date string in ISO 1601 format.
 @return An NSDate object of the string.
 */
- (NSDate *)dateFromString:(NSString *)dateString;

/**
 Applies selectors (if they apply) to a value to obtain
 an NSJsonSerialization compatible value
 */
+ (id) getNSJsonSerializationCompatibleValue:(id)val;

@end
