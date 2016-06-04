// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphFile, MSGraphFileSystemInfo, MSGraphFolder, MSGraphItemReference; 


#import "MSObject.h"

@interface MSGraphRemoteItem : MSObject

	@property (nonatomic, setter=setFile:, getter=file) MSGraphFile* file;
		@property (nonatomic, setter=setFileSystemInfo:, getter=fileSystemInfo) MSGraphFileSystemInfo* fileSystemInfo;
		@property (nonatomic, setter=setFolder:, getter=folder) MSGraphFolder* folder;
		@property (nonatomic, setter=setRemoteItemId:, getter=remoteItemId) NSString* remoteItemId;
		@property (nonatomic, setter=setName:, getter=name) NSString* name;
		@property (nonatomic, setter=setParentReference:, getter=parentReference) MSGraphItemReference* parentReference;
		@property (nonatomic, setter=setSize:, getter=size) int64_t size;
	
@end
