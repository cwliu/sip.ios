// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphBodyType.h"


#import "MSObject.h"

@interface MSGraphItemBody : MSObject

	@property (nonatomic, setter=setContentType:, getter=contentType) MSGraphBodyType* contentType;
		@property (nonatomic, setter=setContent:, getter=content) NSString* content;
	
@end
