// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"


@implementation MSGraphEventDismissReminderRequestBuilder

- (MSGraphEventDismissReminderRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphEventDismissReminderRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphEventDismissReminderRequest alloc] initWithURL:self.requestURL client:self.client];
}

@end
