import Foundation


class RecommendContact {
    
    var name: String
    var percent: Float
    var phoneList = [String]()
    
    init(name: String, percent: Float, phoneList: [String]){
        self.name = name
        self.percent = percent
        self.phoneList = phoneList
    }
}
