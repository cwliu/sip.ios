import Foundation

class UserData {
    static let preference = UserDefaults.standard
    
    static fileprivate let GRAPH_ACCOUNT_KEY: String = "GRAPH_ACCOUNT_KEY"
    static fileprivate let GRAPH_NAME_KEY: String = "GRAPH_NAME_KEY"
    static fileprivate let SIP_ACCOUNT_KEY: String = "SIP_ACCOUNT_KEY"
    static fileprivate let SIP_PASSWORD_KEY: String = "SIP_PASSWORD_KEY"
    static fileprivate let SIP_PROXY_ADDRESS_KEY: String = "SIP_PROXY_ADDRESS_KEY"
    static fileprivate let SIP_PROXY_PORT_KEY: String = "SIP_PROXY_PORT_KEY"
    static fileprivate let SIP_BACKEND_ACCESS_TOKEN_KEY: String = "SIP_BACKEND_ACCESS_TOKEN_KEY"
    
    static func setGraphAccount(_ graphAccount: String){
        preference.setValue(graphAccount, forKey: GRAPH_ACCOUNT_KEY)
        preference.synchronize()
    }
    
    static func getGraphAccount() -> String?{
        return preference.string(forKey: GRAPH_ACCOUNT_KEY)
    }
    
    static func setGraphName(_ graphName: String){
        preference.setValue(graphName, forKey: GRAPH_NAME_KEY)
        preference.synchronize()
    }
    
    static func getGraphName() -> String?{
        return preference.string(forKey: GRAPH_NAME_KEY)
    }
    
    static func setSipAccount(_ sipAccount: String){
        preference.setValue(sipAccount, forKey: SIP_ACCOUNT_KEY)
        preference.synchronize()
    }
    
    static func getSipAccount() -> String?{
        return preference.string(forKey: SIP_ACCOUNT_KEY)
    }
    
    static func setSipPassword(_ sipPassword: String){
        preference.setValue(sipPassword, forKey: SIP_PASSWORD_KEY)
        preference.synchronize()
    }
    
    static func getSipPassword() -> String?{
        return preference.string(forKey: SIP_PASSWORD_KEY)
    }

    static func setProxyAddress(_ sipPassword: String){
        preference.setValue(sipPassword, forKey: SIP_PROXY_ADDRESS_KEY)
        preference.synchronize()
    }
    
    static func getProxyAddress() -> String?{
        return preference.string(forKey: SIP_PROXY_ADDRESS_KEY)
    }
    
    static func setProxyPort(_ proxyPort: String){
        preference.setValue(proxyPort, forKey: SIP_PROXY_PORT_KEY)
        preference.synchronize()
    }
    
    static func getProxyPort() -> String?{
        return preference.string(forKey: SIP_PROXY_PORT_KEY)
    }

    static func setBackendAccessToken(_ backendAccessToken: String){
        preference.setValue(backendAccessToken, forKey: SIP_BACKEND_ACCESS_TOKEN_KEY)
        preference.synchronize()
    }
    
    static func getBackendAccessToken() -> String?{
        return preference.string(forKey: SIP_BACKEND_ACCESS_TOKEN_KEY)
    }
    
    static func clear(){        
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
    }
}
