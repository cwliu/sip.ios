// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphMessageReplyAllRequestBuilder()


@property (nonatomic, getter=comment) NSString * comment;

@end

@implementation MSGraphMessageReplyAllRequestBuilder


- (instancetype)initWithComment:(NSString *)comment URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _comment = comment;
    }
    return self;
}

- (MSGraphMessageReplyAllRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphMessageReplyAllRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphMessageReplyAllRequest alloc] initWithComment:self.comment
                                                              URL:self.requestURL
                                                          options:options
                                                           client:self.client];

}

@end
