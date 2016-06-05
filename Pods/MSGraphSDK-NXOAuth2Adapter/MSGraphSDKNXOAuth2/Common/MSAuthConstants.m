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

#import <Foundation/Foundation.h>
#import "MSAuthConstants.h"

NSString * const MS_AUTH_ERROR_DOMAIN = @"com.microsoft.graphsdk.autherror";

NSString * const MS_API_HEADER_AUTHORIZATION = @"Authorization";

NSString * const MS_AADV2_AUTH_URL = @"https://login.microsoftonline.com/common/oauth2/v2.0/authorize";
NSString * const MS_AADV2_TOKEN_URL = @"https://login.microsoftonline.com/common/oauth2/v2.0/token";
NSString * const MS_AADV2_REDIRECT_URL = @"urn:ietf:wg:oauth:2.0:oob";
NSString * const MS_AADV2_LOGOUT_URL = @"https://login.microsoftonline.com/common/oauth2/v2.0/logout";
NSString * const MS_AADV2_TOKEN_TYPE = @"bearer";
