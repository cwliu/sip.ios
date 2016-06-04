// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphMailFolderMoveRequestBuilder()


@property (nonatomic, getter=destinationId) NSString * destinationId;

@end

@implementation MSGraphMailFolderMoveRequestBuilder


- (instancetype)initWithDestinationId:(NSString *)destinationId URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _destinationId = destinationId;
    }
    return self;
}

- (MSGraphMailFolderMoveRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphMailFolderMoveRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphMailFolderMoveRequest alloc] initWithDestinationId:self.destinationId
                                                                   URL:self.requestURL
                                                               options:options
                                                                client:self.client];

}

@end
