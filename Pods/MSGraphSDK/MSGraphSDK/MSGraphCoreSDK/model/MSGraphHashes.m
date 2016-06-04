// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphHashes()
{
    NSString* _crc32Hash;
    NSString* _sha1Hash;
}
@end

@implementation MSGraphHashes

- (NSString*) crc32Hash
{
    return self.dictionary[@"crc32Hash"];
}
- (void) setCrc32Hash: (NSString*) val
{
    self.dictionary[@"crc32Hash"] = val;
}
- (NSString*) sha1Hash
{
    return self.dictionary[@"sha1Hash"];
}
- (void) setSha1Hash: (NSString*) val
{
    self.dictionary[@"sha1Hash"] = val;
}
@end
