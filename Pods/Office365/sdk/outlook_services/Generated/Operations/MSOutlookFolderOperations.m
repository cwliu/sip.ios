/*******************************************************************************
**NOTE** This code was generated by a tool and will occasionally be
overwritten. We welcome comments and issues regarding this code; they will be
addressed in the generation tool. If you wish to submit pull requests, please
do so for the templates in that tool.

This code was generated by Vipr (https://github.com/microsoft/vipr) using
the T4TemplateWriter (https://github.com/msopentech/vipr-t4templatewriter).

Copyright (c) Microsoft Open Technologies, Inc. All Rights Reserved.
Licensed under the Apache License 2.0; see LICENSE in the source repository
root for authoritative license information.﻿
******************************************************************************/
#import "MSOutlookFetchers.h"

/**
* The implementation file for type MSOutlookFolderOperations.
*/

@implementation MSOutlookFolderOperations

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent {
 
    return [super initOperationWithUrl:urlComponent parent:parent];
}

- (void)copyWithDestinationId:(NSString *)destinationId callback:(void (^)(MSOutlookFolder *folder, MSOrcError *error))callback {
	
	NSString *destinationIdString = [self.resolver.jsonSerializer serialize:destinationId property:@"DestinationId"];
	return [self copyRawWithDestinationId:destinationIdString callback:^(NSString *returnValue, MSOrcError *e) {
       
	   if (e == nil) {

			MSOutlookFolder * result = (MSOutlookFolder *)[super.resolver.jsonSerializer deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] asClass:[MSOutlookFolder class]];
            callback(result, e);
        } 
		else {

            callback(nil, e);
        }
    }];
}

- (void)copyRawWithDestinationId:(NSString *) destinationId callback:(void(^)(NSString *returnValue, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	NSArray *parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId", nil], nil];

	NSData* payload = [[MSOrcBaseContainer generatePayloadWithParameters:parameters dependencyResolver:self.resolver] dataUsingEncoding:NSUTF8StringEncoding];

	[request setContent:payload];


	
	[request setVerb:HTTP_VERB_POST];
	 	[request.url appendPathComponent:@"Microsoft.OutlookServices.Copy"];
     
	return [super orcExecuteRequest:request callback:^(id<MSOrcResponse> response, MSOrcError *e) {
        
		if (e == nil) {
            
			callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {

            callback([[NSString alloc] initWithFormat:@"%d", response.status], e);
        }
    }];
}
    				
- (void)moveWithDestinationId:(NSString *)destinationId callback:(void (^)(MSOutlookFolder *folder, MSOrcError *error))callback {
	
	NSString *destinationIdString = [self.resolver.jsonSerializer serialize:destinationId property:@"DestinationId"];
	return [self moveRawWithDestinationId:destinationIdString callback:^(NSString *returnValue, MSOrcError *e) {
       
	   if (e == nil) {

			MSOutlookFolder * result = (MSOutlookFolder *)[super.resolver.jsonSerializer deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] asClass:[MSOutlookFolder class]];
            callback(result, e);
        } 
		else {

            callback(nil, e);
        }
    }];
}

- (void)moveRawWithDestinationId:(NSString *) destinationId callback:(void(^)(NSString *returnValue, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	NSArray *parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :destinationId,@"DestinationId", nil], nil];

	NSData* payload = [[MSOrcBaseContainer generatePayloadWithParameters:parameters dependencyResolver:self.resolver] dataUsingEncoding:NSUTF8StringEncoding];

	[request setContent:payload];


	
	[request setVerb:HTTP_VERB_POST];
	 	[request.url appendPathComponent:@"Microsoft.OutlookServices.Move"];
     
	return [super orcExecuteRequest:request callback:^(id<MSOrcResponse> response, MSOrcError *e) {
        
		if (e == nil) {
            
			callback([[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding], e);
        }
        else {

            callback([[NSString alloc] initWithFormat:@"%d", response.status], e);
        }
    }];
}
    				
@end