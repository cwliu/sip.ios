import Foundation

struct ApplicationConstants {
    static let clientId = "dcd04b40-11f3-4dba-b7da-ce9474ed8c92"
    static let scopes   = ["https://graph.microsoft.com/Mail.Send", "https://graph.microsoft.com/User.Read", "offline_access"]
}


/**
 Simple construct to encapsulate NSError. This could be expanded for more types of graph errors in future.
 */
enum MSGraphError: ErrorType {
    case NSErrorType(error: NSError)
    
}