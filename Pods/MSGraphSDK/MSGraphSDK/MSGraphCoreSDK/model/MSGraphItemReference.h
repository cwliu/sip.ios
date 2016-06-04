// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.





#import "MSObject.h"

@interface MSGraphItemReference : MSObject

	@property (nonatomic, setter=setDriveId:, getter=driveId) NSString* driveId;
		@property (nonatomic, setter=setItemReferenceId:, getter=itemReferenceId) NSString* itemReferenceId;
		@property (nonatomic, setter=setPath:, getter=path) NSString* path;
	
@end
