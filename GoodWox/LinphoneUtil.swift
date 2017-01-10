import Foundation


func getUsernameFromAddress(_ address: String) -> String{
    
    var result: String = address
    if((address.range(of: "sip:")) != nil) {
        result = address.replacingOccurrences(of: "sip:", with: "");
    }
    
    if((result.range(of: "@")) != nil) {
        
        result = result.components(separatedBy: "@")[0]
    }
    
    return result
}
