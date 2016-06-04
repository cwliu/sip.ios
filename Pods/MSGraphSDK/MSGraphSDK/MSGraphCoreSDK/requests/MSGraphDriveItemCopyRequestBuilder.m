// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphDriveItemCopyRequestBuilder()


@property (nonatomic, getter=name) NSString * name;


@property (nonatomic, getter=parentReference) MSGraphItemReference * parentReference;

@end

@implementation MSGraphDriveItemCopyRequestBuilder


- (instancetype)initWithName:(NSString *)name parentReference:(MSGraphItemReference *)parentReference URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _name = name;
        _parentReference = parentReference;
    }
    return self;
}

- (MSGraphDriveItemCopyRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDriveItemCopyRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphDriveItemCopyRequest alloc] initWithName:self.name
                                             parentReference:self.parentReference
                                                         URL:self.requestURL
                                                     options:options
                                                      client:self.client];

}

@end
