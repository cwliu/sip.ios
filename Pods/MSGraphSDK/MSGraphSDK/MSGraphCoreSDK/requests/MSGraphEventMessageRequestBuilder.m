// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphEventMessageRequestBuilder

-(MSGraphEventRequestBuilder *)event
{
    return [[MSGraphEventRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"event"] client:self.client];

}


- (MSGraphEventMessageRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphEventMessageRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphEventMessageRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
