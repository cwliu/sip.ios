import Foundation

struct ApplicationConstants {
    static let clientId = "79d4b5a2-08f6-4a5e-89a9-71c8ec463e70"
    static let scopes   = ["https://graph.microsoft.com/User.ReadBasic.All"]
}

struct MicrosoftGraphApi {
    static let apiBaseURL = "https://graph.microsoft.com/v1.0/"
    static let myPhotoURL = MicrosoftGraphApi.apiBaseURL + "me/photo/$value"
    static let userPhotoURL = MicrosoftGraphApi.apiBaseURL + "Users('%@')/photo/$value"
}

struct SipServerBackend{
    static let sipURL = "https://sipphone-web-staging.azurewebsites.net/api/v1/sips/"
    static let contactURL = "https://sipphone-web-staging.azurewebsites.net/api/v1/contacts/"
    
}

/**
 Simple construct to encapsulate NSError. This could be expanded for more types of graph errors in future.
 */
enum MSGraphError: ErrorType {
    case NSErrorType(error: NSError)    
}