// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphMessageForwardRequestBuilder()


@property (nonatomic, getter=comment) NSString * comment;


@property (nonatomic, getter=toRecipients) NSArray * toRecipients;

@end

@implementation MSGraphMessageForwardRequestBuilder


- (instancetype)initWithComment:(NSString *)comment toRecipients:(NSArray *)toRecipients URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _comment = comment;
        _toRecipients = toRecipients;
    }
    return self;
}

- (MSGraphMessageForwardRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphMessageForwardRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphMessageForwardRequest alloc] initWithComment:self.comment
                                                    toRecipients:self.toRecipients
                                                             URL:self.requestURL
                                                         options:options
                                                          client:self.client];

}

@end
