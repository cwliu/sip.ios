//  Copyright 2015 Microsoft Corporation
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//  
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#ifndef MSAuthConstants_h
#define MSAuthConstants_h

typedef NS_ENUM(NSInteger, MSAccountType){
    MSAccountTypeUnknownAccount = 0,
    MSAccountTypeMSAAccount = 1,
    MSAccountTypeADAccount = 2,
};

/**
 Enum for the possible error types during the authentication process.
 These will be codes for the NSError.
 */
typedef NS_ENUM(NSInteger, MSAuthErrorType) {
    /** A network error occurred during authentication. */
    MSAuthErrorTypeNetworkError,
    /** The authentication service had an error. */
    MSAuthErrorTypeServiceError,
    /** The was an error serializing the response from the service. */
    MSAuthErrorTypeSerializationError,
    /** The user canceled the authentication flow. */
    MSAuthErrorTypeAuthCanceled,
    /** You do not have the correct account information. */
    MSAuthErrorTypeInvalidAccountType
};

extern NSString * const MS_AUTH_ERROR_DOMAIN;

extern NSString * const MS_API_HEADER_AUTHORIZATION;

extern NSString * const MS_AADV2_AUTH_URL;
extern NSString * const MS_AADV2_TOKEN_URL;
extern NSString * const MS_AADV2_REDIRECT_URL;
extern NSString * const MS_AADV2_LOGOUT_URL;
extern NSString * const MS_AADV2_TOKEN_TYPE;

#endif
