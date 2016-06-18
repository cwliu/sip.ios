import Foundation

class UserData {
    static let preference = NSUserDefaults.standardUserDefaults()
    
    static private let ACCESS_TOKEN_KEY: String = "ACCESS_TOKEN_KEY"
    static private let GRAPH_ACCOUNT_KEY: String = "GRAPH_ACCOUNT_KEY"
    static private let GRAPH_NAME_KEY: String = "GRAPH_NAME_KEY"
    static private let SIP_ACCOUNT_KEY: String = "SIP_ACCOUNT_KEY"
    static private let SIP_PASSWORD_KEY: String = "SIP_PASSWORD_KEY"
    static private let SIP_PROXY_ADDRESS_KEY: String = "SIP_PROXY_ADDRESS_KEY"
    static private let SIP_PROXY_PORT_KEY: String = "SIP_PROXY_PORT_KEY"
    static private let SIP_BACKEND_ACCESS_TOKEN_KEY: String = "SIP_BACKEND_ACCESS_TOKEN_KEY"
    
    static func setGraphAccesssToken(accessToken: String){
        preference.setValue(accessToken, forKey: ACCESS_TOKEN_KEY)
        preference.synchronize()
    }
    
    static func getGraphAccessToken() -> String? {
        return preference.stringForKey(ACCESS_TOKEN_KEY)
    }
    
    static func setGraphAccount(graphAccount: String){
        preference.setValue(graphAccount, forKey: GRAPH_ACCOUNT_KEY)
        preference.synchronize()
    }
    
    static func getGraphAccount() -> String?{
        return preference.stringForKey(GRAPH_ACCOUNT_KEY)
    }
    
    static func setGraphName(graphName: String){
        preference.setValue(graphName, forKey: GRAPH_NAME_KEY)
        preference.synchronize()
    }
    
    static func getGraphName() -> String?{
        return preference.stringForKey(GRAPH_NAME_KEY)
    }
    
    static func setSipAccount(sipAccount: String){
        preference.setValue(sipAccount, forKey: SIP_ACCOUNT_KEY)
        preference.synchronize()
    }
    
    static func getSipAccount() -> String?{
        return preference.stringForKey(SIP_ACCOUNT_KEY)
    }
    
    static func setSipPassword(sipPassword: String){
        preference.setValue(sipPassword, forKey: SIP_PASSWORD_KEY)
        preference.synchronize()
    }
    
    static func getSipPassword() -> String?{
        return preference.stringForKey(SIP_PASSWORD_KEY)
    }

    static func setProxyAddress(sipPassword: String){
        preference.setValue(sipPassword, forKey: SIP_PROXY_ADDRESS_KEY)
        preference.synchronize()
    }
    
    static func getProxyAddress() -> String?{
        return preference.stringForKey(SIP_PROXY_ADDRESS_KEY)
    }
    
    static func setProxyPort(proxyPort: String){
        preference.setValue(proxyPort, forKey: SIP_PROXY_PORT_KEY)
        preference.synchronize()
    }
    
    static func getProxyPort() -> String?{
        return preference.stringForKey(SIP_PROXY_PORT_KEY)
    }

    static func setBackendAccessToken(backendAccessToken: String){
        preference.setValue(backendAccessToken, forKey: SIP_BACKEND_ACCESS_TOKEN_KEY)
        preference.synchronize()
    }
    
    static func getBackendAccessToken() -> String?{
        return preference.stringForKey(SIP_BACKEND_ACCESS_TOKEN_KEY)
    }
    
    static func clear(){        
        let appDomain = NSBundle.mainBundle().bundleIdentifier!
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain)
    }
}