// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.





#import "MSObject.h"

@interface MSGraphVideo : MSObject

	@property (nonatomic, setter=setBitrate:, getter=bitrate) int32_t bitrate;
		@property (nonatomic, setter=setDuration:, getter=duration) int64_t duration;
		@property (nonatomic, setter=setHeight:, getter=height) int32_t height;
		@property (nonatomic, setter=setWidth:, getter=width) int32_t width;
	
@end
