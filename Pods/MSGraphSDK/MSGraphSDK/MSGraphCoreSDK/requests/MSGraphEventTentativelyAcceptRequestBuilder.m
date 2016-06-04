// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphEventTentativelyAcceptRequestBuilder()


@property (nonatomic, getter=comment) NSString * comment;


@property (nonatomic, getter=sendResponse) BOOL  sendResponse;

@end

@implementation MSGraphEventTentativelyAcceptRequestBuilder


- (instancetype)initWithComment:(NSString *)comment sendResponse:(BOOL)sendResponse URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _comment = comment;
        _sendResponse = sendResponse;
    }
    return self;
}

- (MSGraphEventTentativelyAcceptRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphEventTentativelyAcceptRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphEventTentativelyAcceptRequest alloc] initWithComment:self.comment
                                                            sendResponse:self.sendResponse
                                                                     URL:self.requestURL
                                                                 options:options
                                                                  client:self.client];

}

@end
