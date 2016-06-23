import Foundation


func getUsernameFromAddress(address: String) -> String{
    
    var result: String = address
    if((address.rangeOfString("sip:")) != nil) {
        result = address.stringByReplacingOccurrencesOfString("sip:", withString: "");
    }
    
    if((result.rangeOfString("@")) != nil) {
        
        result = result.componentsSeparatedByString("@")[0]
    }
    
    return result
}