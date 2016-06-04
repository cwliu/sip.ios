// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphDirectoryObjectCheckMemberGroupsRequestBuilder()


@property (nonatomic, getter=groupIds) NSArray * groupIds;

@end

@implementation MSGraphDirectoryObjectCheckMemberGroupsRequestBuilder


- (instancetype)initWithGroupIds:(NSArray *)groupIds URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _groupIds = groupIds;
    }
    return self;
}

- (MSGraphDirectoryObjectCheckMemberGroupsRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDirectoryObjectCheckMemberGroupsRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphDirectoryObjectCheckMemberGroupsRequest alloc] initWithGroupIds:self.groupIds
                                                                                URL:self.requestURL
                                                                            options:options
                                                                             client:self.client];

}

@end
