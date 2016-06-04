// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphMessageCopyRequestBuilder()


@property (nonatomic, getter=destinationId) NSString * destinationId;

@end

@implementation MSGraphMessageCopyRequestBuilder


- (instancetype)initWithDestinationId:(NSString *)destinationId URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _destinationId = destinationId;
    }
    return self;
}

- (MSGraphMessageCopyRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphMessageCopyRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphMessageCopyRequest alloc] initWithDestinationId:self.destinationId
                                                                URL:self.requestURL
                                                            options:options
                                                             client:self.client];

}

@end
