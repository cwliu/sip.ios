// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphSharingLink()
{
    MSGraphIdentity* _application;
    NSString* _type;
    NSString* _webUrl;
}
@end

@implementation MSGraphSharingLink

- (MSGraphIdentity*) application
{
    if(!_application){
        _application = [[MSGraphIdentity alloc] initWithDictionary: self.dictionary[@"application"]];
    }
    return _application;
}
- (void) setApplication: (MSGraphIdentity*) val
{
    _application = val;
    self.dictionary[@"application"] = val;
}
- (NSString*) type
{
    return self.dictionary[@"type"];
}
- (void) setType: (NSString*) val
{
    self.dictionary[@"type"] = val;
}
- (NSString*) webUrl
{
    return self.dictionary[@"webUrl"];
}
- (void) setWebUrl: (NSString*) val
{
    self.dictionary[@"webUrl"] = val;
}
@end
