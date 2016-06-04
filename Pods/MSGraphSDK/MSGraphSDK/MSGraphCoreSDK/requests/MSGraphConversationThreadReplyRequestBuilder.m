// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphConversationThreadReplyRequestBuilder()


@property (nonatomic, getter=post) MSGraphPost * post;

@end

@implementation MSGraphConversationThreadReplyRequestBuilder


- (instancetype)initWithPost:(MSGraphPost *)post URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _post = post;
    }
    return self;
}

- (MSGraphConversationThreadReplyRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphConversationThreadReplyRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphConversationThreadReplyRequest alloc] initWithPost:self.post
                                                                   URL:self.requestURL
                                                               options:options
                                                                client:self.client];

}

@end
