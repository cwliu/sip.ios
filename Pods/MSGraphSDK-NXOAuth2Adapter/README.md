# Microsoft Graph iOs SDK Authentication Quick-Start Kit

## Overview
This package provides a limited-scope implementation of MSAuthenticationProvider that can be used to jump-start development with the Microsoft Graph SDK for iOs. Its functionality includes:
* Login via web UI for apps registered on apps.dev.microsoft.com
* Automatic refreshing of access tokens after login
* Logout

It is encouraged to fork or use this implementation as a starting point to develop functionality specific to your needs.

## 1. Installation

### Install via Cocoapods
* [Install Cocoapods](http://guides.cocoapods.org/using/getting-started.html) - Follow the getting started guide to install Cocoapods.
* Add the following to your Podfile : `pod 'MSGraphSDK-NXOAuth2Adapter'`
* Run the command `pod install` to install the latest version of this pod.
* Add `#import <MSGraphSDK-NXOAuth2Adapter/MSGraphSDKNXOAuth2.h>` to all files that need to reference this library.

## 2. Getting started

### 2.1 Register your application

Register your application on [apps.dev.microsoft.com](https://apps.dev.microsoft.com).

### 2.2 Setting your application Id and scopes

* You can set your application's Client ID and required access scopes on the shared NXOAuth2AuthenticationProvider instance. For example, to get read-write access to a user's calendar and OneDrive files:

```objc
[NXOAuth2AuthenticationProvider setClientId:<clientId>
                                     scopes:@[@"https://graph.microsoft.com/Files.ReadWrite",
                                              @"https://graph.microsoft.com/Calendars.ReadWrite"]];
```

* More available scopes can be found [here](https://azure.microsoft.com/en-us/documentation/articles/active-directory-v2-scopes/).


### 2.3 Getting an authenticated MSGraphClient object

* Once you have set the application Id and scopes, you must authenticate the provider and set it on your MSGraphClient instance:

```objc
[[NXOAuth2AuthenticationProvider sharedAuthProvider] loginWithViewController:nil completion:^(NSError *error) {
    if (!error) {
        [MSGraphClient setAuthenticationProvider:[NXOAuth2AuthenticationProvider sharedAuthProvider]];
        self.client = [MSGraphClient client];
    }
}];
```

* The MSGraphClient instance is now ready to make requests against the service!

## 4. Issues

For known issues, see [issues](https://github.com/MicrosoftGraph/msgraph-sdk-ios-nxoauth2-adapter/issues).

## 5. License 

[License](LICENSE.txt)






