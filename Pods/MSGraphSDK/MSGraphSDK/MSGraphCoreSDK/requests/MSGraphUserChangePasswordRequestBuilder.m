// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@interface MSGraphUserChangePasswordRequestBuilder()


@property (nonatomic, getter=currentPassword) NSString * currentPassword;


@property (nonatomic, getter=getNewPassword) NSString * newPassword;

@end

@implementation MSGraphUserChangePasswordRequestBuilder


- (instancetype)initWithCurrentPassword:(NSString *)currentPassword newPassword:(NSString *)newPassword URL:(NSURL *)url client:(ODataBaseClient*)client
{
    self = [super initWithURL:url client:client];
    if (self){
        _currentPassword = currentPassword;
        _newPassword = newPassword;
    }
    return self;
}

- (MSGraphUserChangePasswordRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserChangePasswordRequest *)requestWithOptions:(NSArray *)options
{

    return [[MSGraphUserChangePasswordRequest alloc] initWithCurrentPassword:self.currentPassword
                                                                 newPassword:self.newPassword
                                                                         URL:self.requestURL
                                                                     options:options
                                                                      client:self.client];

}

@end
