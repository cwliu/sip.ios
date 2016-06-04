//
//  NSArray+MSSerialization.h
//  MSGraphSDK
//
//  Created by Kevin Lam on 3/31/16.
//  Copyright © 2016 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (MSSerialization)

/**
 Return an array with all values compatible with NSJsonSerialization
 */
- (NSArray *) arrayFromItem;

@end
