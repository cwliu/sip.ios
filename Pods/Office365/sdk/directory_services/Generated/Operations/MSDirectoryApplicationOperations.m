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
#import "MSDirectoryFetchers.h"

/**
* The implementation file for type MSDirectoryApplicationOperations.
*/

@implementation MSDirectoryApplicationOperations

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent {
 
    return [super initOperationWithUrl:urlComponent parent:parent];
}

- (void)restoreWithIdentifierUris:(NSArray *)identifierUris callback:(void (^)(MSDirectoryApplication *application, MSOrcError *error))callback {
	
	NSString *identifierUrisString = [self.resolver.jsonSerializer serialize:identifierUris property:@"identifierUris"];
	return [self restoreRawWithIdentifierUris:identifierUrisString callback:^(NSString *returnValue, MSOrcError *e) {
       
	   if (e == nil) {

			MSDirectoryApplication * result = (MSDirectoryApplication *)[super.resolver.jsonSerializer deserialize:[returnValue dataUsingEncoding:NSUTF8StringEncoding] asClass:[MSDirectoryApplication class]];
            callback(result, e);
        } 
		else {

            callback(nil, e);
        }
    }];
}

- (void)restoreRawWithIdentifierUris:(NSString *) identifierUris callback:(void(^)(NSString *returnValue, MSOrcError *error))callback {

	id<MSOrcRequest> request = [super.resolver createOrcRequest];
	NSArray *parameters = [[NSArray alloc] initWithObjects:
                          [[NSDictionary alloc] initWithObjectsAndKeys :identifierUris,@"identifierUris", nil], nil];

	NSData* payload = [[MSOrcBaseContainer generatePayloadWithParameters:parameters dependencyResolver:self.resolver] dataUsingEncoding:NSUTF8StringEncoding];

	[request setContent:payload];


	
	[request setVerb:HTTP_VERB_POST];
	 	[request.url appendPathComponent:@"Microsoft.DirectoryServices.restore"];
     
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