import Foundation
import Haneke

open class BearerHeaderNetworkFetcher<T: DataConvertible> : NetworkFetcher<T> {
    
    var token: String
    
    open override var session : URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "Authorization": self.token
        ];
        
        return URLSession(configuration: configuration)
    }
    
    override init(URL : Foundation.URL) {
        self.token = ""
        
        super.init(URL: URL)
    }
    
    convenience init(URL : Foundation.URL, token: String) {
        self.init(URL: URL)
        
        self.token = token
    }
    
}
