// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.





#import "MSObject.h"

@interface MSGraphFileSystemInfo : MSObject

	@property (nonatomic, setter=setCreatedDateTime:, getter=createdDateTime) NSDate* createdDateTime;
		@property (nonatomic, setter=setLastModifiedDateTime:, getter=lastModifiedDateTime) NSDate* lastModifiedDateTime;
	
@end
