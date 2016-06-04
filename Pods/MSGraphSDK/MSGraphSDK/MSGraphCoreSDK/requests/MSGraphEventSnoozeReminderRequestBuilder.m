// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphEventSnoozeReminderRequestBuilder()


@property (nonatomic, getter=getNewReminderTime) MSGraphDateTimeTimeZone * newReminderTime;

@end

@implementation MSGraphEventSnoozeReminderRequestBuilder


- (instancetype)initWithNewReminderTime:(MSGraphDateTimeTimeZone *)newReminderTime URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _newReminderTime = newReminderTime;
    }
    return self;
}

- (MSGraphEventSnoozeReminderRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphEventSnoozeReminderRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphEventSnoozeReminderRequest alloc] initWithNewReminderTime:self.newReminderTime
                                                                          URL:self.requestURL
                                                                      options:options
                                                                       client:self.client];

}

@end
