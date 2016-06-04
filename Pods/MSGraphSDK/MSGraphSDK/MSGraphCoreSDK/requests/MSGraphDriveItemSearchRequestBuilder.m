// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphDriveItemSearchRequestBuilder()


@property (nonatomic, getter=q) NSString * q;

@end

@implementation MSGraphDriveItemSearchRequestBuilder


- (instancetype)initWithQ:(NSString *)q URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _q = q;
    }
    return self;
}

- (MSGraphDriveItemSearchRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDriveItemSearchRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphDriveItemSearchRequest alloc] initWithQ:self.q
                                                        URL:self.requestURL
                                                    options:options
                                                     client:self.client];

}

@end
