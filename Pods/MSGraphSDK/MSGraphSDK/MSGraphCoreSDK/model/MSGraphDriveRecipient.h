// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.





#import "MSObject.h"

@interface MSGraphDriveRecipient : MSObject

	@property (nonatomic, setter=setEmail:, getter=email) NSString* email;
		@property (nonatomic, setter=setAlias:, getter=alias) NSString* alias;
		@property (nonatomic, setter=setObjectId:, getter=objectId) NSString* objectId;
	
@end
