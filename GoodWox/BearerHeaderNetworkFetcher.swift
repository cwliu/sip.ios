import Foundation
import Haneke

public class BearerHeaderNetworkFetcher<T: DataConvertible> : NetworkFetcher<T> {
    public override var session : NSURLSession {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        if let token = UserData.getGraphAccessToken() {
            configuration.HTTPAdditionalHeaders = [
                "Authorization": "Bearer " + token
            ];
        }
        return NSURLSession(configuration: configuration)
    }
    
    public override init(URL : NSURL) {
        super.init(URL: URL)
    }
}