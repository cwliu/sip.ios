// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphUserReminderViewRequestBuilder()


@property (nonatomic, getter=startDateTime) NSString * startDateTime;


@property (nonatomic, getter=endDateTime) NSString * endDateTime;

@end

@implementation MSGraphUserReminderViewRequestBuilder


- (instancetype)initWithStartDateTime:(NSString *)startDateTime endDateTime:(NSString *)endDateTime URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _startDateTime = startDateTime;
        _endDateTime = endDateTime;
    }
    return self;
}

- (MSGraphUserReminderViewRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserReminderViewRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphUserReminderViewRequest alloc] initWithStartDateTime:self.startDateTime
                                                             endDateTime:self.endDateTime
                                                                     URL:self.requestURL
                                                                 options:options
                                                                  client:self.client];

}

@end
