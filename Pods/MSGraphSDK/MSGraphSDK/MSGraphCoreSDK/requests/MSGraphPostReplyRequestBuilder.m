// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphPostReplyRequestBuilder()


@property (nonatomic, getter=post) MSGraphPost * post;

@end

@implementation MSGraphPostReplyRequestBuilder


- (instancetype)initWithPost:(MSGraphPost *)post URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _post = post;
    }
    return self;
}

- (MSGraphPostReplyRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphPostReplyRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphPostReplyRequest alloc] initWithPost:self.post
                                                     URL:self.requestURL
                                                 options:options
                                                  client:self.client];

}

@end
