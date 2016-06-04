// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphPostForwardRequestBuilder()


@property (nonatomic, getter=comment) NSString * comment;


@property (nonatomic, getter=toRecipients) NSArray * toRecipients;

@end

@implementation MSGraphPostForwardRequestBuilder


- (instancetype)initWithComment:(NSString *)comment toRecipients:(NSArray *)toRecipients URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _comment = comment;
        _toRecipients = toRecipients;
    }
    return self;
}

- (MSGraphPostForwardRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphPostForwardRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphPostForwardRequest alloc] initWithComment:self.comment
                                                 toRecipients:self.toRecipients
                                                          URL:self.requestURL
                                                      options:options
                                                       client:self.client];

}

@end
