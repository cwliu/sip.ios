import Foundation
import Haneke

public class BearerHeaderNetworkFetcher<T: DataConvertible> : NetworkFetcher<T> {
    
    var token: String
    
    public override var session : NSURLSession {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = [
            "Authorization": self.token
        ];
        
        return NSURLSession(configuration: configuration)
    }
    
    override init(URL : NSURL) {
        self.token = ""
        
        super.init(URL: URL)
    }
    
    convenience init(URL : NSURL, token: String) {
        self.init(URL: URL)
        
        self.token = token
    }
    
}