// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphUserAssignLicenseRequestBuilder()


@property (nonatomic, getter=addLicenses) NSArray * addLicenses;


@property (nonatomic, getter=removeLicenses) NSArray * removeLicenses;

@end

@implementation MSGraphUserAssignLicenseRequestBuilder


- (instancetype)initWithAddLicenses:(NSArray *)addLicenses removeLicenses:(NSArray *)removeLicenses URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _addLicenses = addLicenses;
        _removeLicenses = removeLicenses;
    }
    return self;
}

- (MSGraphUserAssignLicenseRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserAssignLicenseRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphUserAssignLicenseRequest alloc] initWithAddLicenses:self.addLicenses
                                                         removeLicenses:self.removeLicenses
                                                                    URL:self.requestURL
                                                                options:options
                                                                 client:self.client];

}

@end
