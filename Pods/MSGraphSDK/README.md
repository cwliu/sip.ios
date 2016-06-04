# Get started with the Microsoft Graph SDK for iOS

This client library is a release candidate and is still in preview status - please continue to provide feedback as we iterate towards a production supported library.

## 1. Installation

### Install via Cocoapods
* [Install Cocoapods](http://guides.cocoapods.org/using/getting-started.html) - Follow the getting started guide to install Cocoapods.
* Add the following to your Podfile : `pod 'MSGraphSDK', '~> 0.10''`
* Run the command `pod install` to install the latest MSGraphSDK pod.
* Add `#import <MSGraphSDK/MSGraphSDK.h>` to all files that need to reference the SDK.

## 2. Getting started

### 2.1 Register your application

Register your application by following [these](https://graph.microsoft.io/en-us/app-registration) steps.

### 2.2 Authentication

* To make requests, a MSAuthenticationProvider must be provided which is capable of authenticating HTTPS requests with an appropriate OAuth 2.0 bearer token.

* This can be set by calling the class method `[MSGraphClient setAuthenticationProvider:myAuthProvider];`

* See [msgraph-sdk-ios-nxoauth2-adapter](https://github.com/microsoftgraph/msgraph-sdk-ios-nxoauth2-adapter) for a sample implementation of MSAuthenticationProvider that can be used to jump-start your project.

### 2.3 Getting an authenticated MSGraphClient object

* Once you have set the authentication provider, you must get an MSGraphClient 
  object to make requests against the service:

```objc
self.client = [MSGraphClient client];
```

* It is often practical to perform this step only upon successful completion of any UI login flow required by the specified authentication provider.

### 2.4 Making requests against the service

Once you have an MSGraphClient that is authenticated you can begin to make calls against the service. The requests against the service look like our [REST API](https://graph.microsoft.io/en-us/docs). 

For example, to retrieve a user's OneDrive:

```objc
[[[[graphClient me] drive] request] getWithCompletion:^(MSGraphDrive *drive, NSError *error){
    //Returns an MSGraphDrive object or an error if there was one
}];
```


To get a user's root folder of their drive:

```objc
[[[[[graphClient me] drive] items:@"root"] request] getWithCompletion:^(MSGraphDriveItem *item, NSError *error){
    //Returns an MSGraphDriveItem object or an error if there was one
}];
```

## 3. Documentation

For a more detailed documentation see:

* [Overview](docs/overview.md)
* [Auth] (docs/auth.md)
* [Items](docs/items.md)
* [Collections](docs/collections.md)
* [Enumerations](docs/enums.md)
* [Errors](docs/errors.md)

## 4. Issues

For known issues, see [issues](https://github.com/MicrosoftGraph/sdk-ios/issues).

## 5. Contributions
[Contributions](docs/contributions.md)

## 6. License 

[License](LICENSE.txt)






