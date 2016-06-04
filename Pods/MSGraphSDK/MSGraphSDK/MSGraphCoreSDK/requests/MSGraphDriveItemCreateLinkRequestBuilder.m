// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphDriveItemCreateLinkRequestBuilder()


@property (nonatomic, getter=type) NSString * type;


@property (nonatomic, getter=scope) NSString * scope;

@end

@implementation MSGraphDriveItemCreateLinkRequestBuilder


- (instancetype)initWithType:(NSString *)type scope:(NSString *)scope URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _type = type;
        _scope = scope;
    }
    return self;
}

- (MSGraphDriveItemCreateLinkRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDriveItemCreateLinkRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphDriveItemCreateLinkRequest alloc] initWithType:self.type
                                                             scope:self.scope
                                                               URL:self.requestURL
                                                           options:options
                                                            client:self.client];

}

@end
