// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphAttendee()
{
    MSGraphResponseStatus* _status;
    MSGraphAttendeeType* _type;
}
@end

@implementation MSGraphAttendee

- (MSGraphResponseStatus*) status
{
    if(!_status){
        _status = [[MSGraphResponseStatus alloc] initWithDictionary: self.dictionary[@"status"]];
    }
    return _status;
}
- (void) setStatus: (MSGraphResponseStatus*) val
{
    _status = val;
    self.dictionary[@"status"] = val;
}
- (MSGraphAttendeeType*) type
{
    if(!_type){
        _type = [self.dictionary[@"type"] toMSGraphAttendeeType];
    }
    return _type;
}
- (void) setType: (MSGraphAttendeeType*) val
{
    _type = val;
    self.dictionary[@"type"] = val;
}
@end
