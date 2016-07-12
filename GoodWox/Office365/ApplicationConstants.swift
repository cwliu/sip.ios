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
    static let bizSocalURL = "https://sipphone-web-staging.azurewebsites.net/api/v1/social/"
}

struct BcrServer {
    static let bcrServiceUrl = "https://bcr1.intsig.net/BCRService/BCR_VCF2?user=%@&pass=%@&lang=7"
    
//    private static String BCR_SERVICE_URL_FORMAT = "http://bcr1.intsig.net/BCRService/BCR_VCF2?user=%s&pass=%s&lang=7";
//    private static String BCR_SERVICE_URL = String.format(BCR_SERVICE_URL_FORMAT, BuildConfig.CAMCARD_API_EMAIL, BuildConfig.CAMCARD_API_KEY);

    
}

/**
 Simple construct to encapsulate NSError. This could be expanded for more types of graph errors in future.
 */
enum MSGraphError: ErrorType {
    case NSErrorType(error: NSError)    
}