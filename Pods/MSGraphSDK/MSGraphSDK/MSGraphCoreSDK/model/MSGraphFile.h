// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphHashes; 


#import "MSObject.h"

@interface MSGraphFile : MSObject

	@property (nonatomic, setter=setHashes:, getter=hashes) MSGraphHashes* hashes;
		@property (nonatomic, setter=setMimeType:, getter=mimeType) NSString* mimeType;
	
@end
