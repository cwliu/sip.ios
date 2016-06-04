// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphDirectoryObjectGetMemberGroupsRequestBuilder()


@property (nonatomic, getter=securityEnabledOnly) BOOL  securityEnabledOnly;

@end

@implementation MSGraphDirectoryObjectGetMemberGroupsRequestBuilder


- (instancetype)initWithSecurityEnabledOnly:(BOOL)securityEnabledOnly URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _securityEnabledOnly = securityEnabledOnly;
    }
    return self;
}

- (MSGraphDirectoryObjectGetMemberGroupsRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDirectoryObjectGetMemberGroupsRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphDirectoryObjectGetMemberGroupsRequest alloc] initWithSecurityEnabledOnly:self.securityEnabledOnly
                                                                                         URL:self.requestURL
                                                                                     options:options
                                                                                      client:self.client];

}

@end
