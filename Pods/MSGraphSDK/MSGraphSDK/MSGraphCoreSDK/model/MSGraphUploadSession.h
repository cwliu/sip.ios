// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.





#import "MSObject.h"

@interface MSGraphUploadSession : MSObject

	@property (nonatomic, setter=setUploadUrl:, getter=uploadUrl) NSString* uploadUrl;
		@property (nonatomic, setter=setExpirationDateTime:, getter=expirationDateTime) NSDate* expirationDateTime;
		@property (nonatomic, setter=setNextExpectedRanges:, getter=nextExpectedRanges) NSArray* nextExpectedRanges;
	
@end
