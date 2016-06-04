// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphDirectoryObjectGetMemberObjectsRequestBuilder()


@property (nonatomic, getter=securityEnabledOnly) BOOL  securityEnabledOnly;

@end

@implementation MSGraphDirectoryObjectGetMemberObjectsRequestBuilder


- (instancetype)initWithSecurityEnabledOnly:(BOOL)securityEnabledOnly URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _securityEnabledOnly = securityEnabledOnly;
    }
    return self;
}

- (MSGraphDirectoryObjectGetMemberObjectsRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDirectoryObjectGetMemberObjectsRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphDirectoryObjectGetMemberObjectsRequest alloc] initWithSecurityEnabledOnly:self.securityEnabledOnly
                                                                                          URL:self.requestURL
                                                                                      options:options
                                                                                       client:self.client];

}

@end
