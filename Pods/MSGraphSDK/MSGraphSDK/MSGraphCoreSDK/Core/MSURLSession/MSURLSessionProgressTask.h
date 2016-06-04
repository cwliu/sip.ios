// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSURLSessionTask.h"

/**
 An `MSURLSessionTask` that contains a NSProgress object.  When you create the task, the progress property will be updated as the task completes.
 */
@interface MSURLSessionProgressTask : MSURLSessionTask


/**
 The NSProgress to monitor.
 */
@property (strong, readonly) NSProgress *progress;

- (NSProgress *)createProgress;

@end
