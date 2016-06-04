// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphMessageMoveRequestBuilder()


@property (nonatomic, getter=destinationId) NSString * destinationId;

@end

@implementation MSGraphMessageMoveRequestBuilder


- (instancetype)initWithDestinationId:(NSString *)destinationId URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _destinationId = destinationId;
    }
    return self;
}

- (MSGraphMessageMoveRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphMessageMoveRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphMessageMoveRequest alloc] initWithDestinationId:self.destinationId
                                                                URL:self.requestURL
                                                            options:options
                                                             client:self.client];

}

@end
