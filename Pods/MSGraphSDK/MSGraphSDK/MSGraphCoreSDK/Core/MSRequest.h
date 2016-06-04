// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

@class ODataBaseClient;

#import <Foundation/Foundation.h>
#import "MSRequestOptionsBuilder.h"
#import "MSAsyncURLSessionDataTask.h"

@class MSObject, MSURLSessionDataTask, MSURLSessionUploadTask;

/**
 The completion handler to be called when the request is finished.
 */
typedef void (^MSObjectCompletionHandler)(id response, NSError *error);

/**
 The block to be called when the requests needs to construct an MSObject from a response dictionary.
 */
typedef id (^MSObjectWithDictionary)(NSDictionary *response);

/**
 An `MSRequest` object is used to make a request to the service.
 */
@interface MSRequest : NSObject

/**
 The client to make the request.
 */
@property (readonly) ODataBaseClient *client;

/**
 The URL of the request.
 */
@property (readonly) NSURL *requestURL;

/**
 Creates an `MSRequest` object with the given url and client.
 @param url The url to request from the service.
 @param client The client to make the request.
 */
- (instancetype)initWithURL:(NSURL *)url client:(ODataBaseClient *)client;

/**
 Creates an `MSRequest` object with the given url, client, and options.
 @param url The url to request from the service.
 @param options The options for the given request.
 @param client The client to make the request.
 @see MSRequestOptionsBuilder
 */
- (instancetype)initWithURL:(NSURL *)url options:(NSArray *)options client:(ODataBaseClient *)client;

/**
 Appends a select option to the request.
 @param select Select string.
 @return An MSRequest that represents the same request with the appended options.
 */
- (instancetype) select:(NSString *)select;

/**
 Appends an expand option to the request.
 @param expand Expand string.
 @return An MSRequest that represents the same request with the appended options.
 */
- (instancetype) expand:(NSString *)expand;

/**
 Appends an orderBy parameter to the request.
 @param orderBy orderBy string.
 @return An MSRequest that represents the same request with the appended options.
 */
- (instancetype) orderBy:(NSString *)orderBy;

/**
 Appends a top parameter to the request.
 @param top The amount of objects in the page.
 @return An MSRequest that represents the same request with the appended options.
*/
- (instancetype) top:(NSInteger)top;

/**
 Appends an ifMatch header to the request.
 @param ifMatch A string of comma separated etags/ctags.
 @return An MSRequest that represents the same request with the appended options.
 */
- (instancetype) ifMatch:(NSString *)ifMatch;

/**
 Appends an ifNoneMatch header to the request. 
 @param ifNoneMatch A string of comma separated etags/ctags.
 @return An MSRequest that represents the same request with the appended options.
 */
- (instancetype) ifNoneMatch:(NSString *)ifNoneMatch;

/**
 Appends a name conflict parameter to the request.
 @param nameConflict The MSNameConflict object to append to the request.
 @return An MSRequest that represents the same request with the appended options.
 */
- (instancetype) nameConflict:(MSNameConflict *)nameConflict;

/**
 Creates an `MSURLSessionDataTask` with the given request.
 @param The request to create the task with.
 @param castBlock A block that converts an NSDictionary to an MSObject.
 @param completionHandler The completion handler to be called when the task has finished.
 */
- (MSURLSessionDataTask *)taskWithRequest:(NSMutableURLRequest *)request
                   odObjectWithDictionary:(MSObjectWithDictionary)castBlock
                               completion:(MSObjectCompletionHandler)completionHandler;

/**
 Creates an `MSAsyncURLSessionDataTask` with the given request.
 @param request The request to create the task with.
 @param castBlock A block that converts and NSDictionary into an MSObject.
 @param completionHandler A completion handler to be called when the task is complete and/or when the status has been updated.
 */
- (MSAsyncURLSessionDataTask *)asyncTaskWithRequest:(NSMutableURLRequest *)request
                             odObjectWithDictionary:(MSObjectWithDictionary)castBlock
                                         completion:(MSAsyncActionCompletion)completionHandler;

- (MSURLSessionUploadTask *)uploadTaskWithRequest:(NSMutableURLRequest *)request
                                         fromFile:(NSURL *)fileURL
                           odobjectWithDictionary:(MSObjectWithDictionary)castBlock
                                completionHandler:(MSObjectCompletionHandler)completionHandler;


- (MSURLSessionUploadTask *)uploadTaskWithRequest:(NSMutableURLRequest *)request
                                         fromData:(NSData *)data
                           odobjectWithDictionary:(MSObjectWithDictionary)castBlock
                                completionHandler:(MSObjectCompletionHandler)completionHandler;
@end
