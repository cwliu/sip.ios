// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphUserSendMailRequestBuilder()


@property (nonatomic, getter=message) MSGraphMessage * message;


@property (nonatomic, getter=saveToSentItems) BOOL  saveToSentItems;

@end

@implementation MSGraphUserSendMailRequestBuilder


- (instancetype)initWithMessage:(MSGraphMessage *)message saveToSentItems:(BOOL)saveToSentItems URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _message = message;
        _saveToSentItems = saveToSentItems;
    }
    return self;
}

- (MSGraphUserSendMailRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserSendMailRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphUserSendMailRequest alloc] initWithMessage:self.message
                                               saveToSentItems:self.saveToSentItems
                                                           URL:self.requestURL
                                                       options:options
                                                        client:self.client];

}

@end
