// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import <Foundation/Foundation.h>

#ifndef MSErrorCodes_h
#define MSErrorCodes_h

/**
 Error codes returned from the service
 @see https://graph.microsoft.io/en-us/docs/overview/errors for a more detailed description of errors
 */

extern NSString *const MSAccessDeniedError;
extern NSString *const MSActivityLimitReachedError;
extern NSString *const MSGeneralExceptionError;
extern NSString *const MSInvalidRangeError;
extern NSString *const MSInvalidRequestError;
extern NSString *const MSItemNotFoundError;
extern NSString *const MSMalwareDetectedError;
extern NSString *const MSNameAlreadyExistsError;
extern NSString *const MSNotAllowedError;
extern NSString *const MSNotSupportedError;
extern NSString *const MSResourceModifiedError;
extern NSString *const MSResyncRequiredError;
extern NSString *const MSServiceNotAvailableError;
extern NSString *const MSQuotaLimitReacherError;
extern NSString *const MSUnAuthenticatedError;

extern NSString *const MSMalformedErrorResponseError;

#endif
