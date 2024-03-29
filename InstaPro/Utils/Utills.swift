//
//  Utils.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 29/01/24.
//

import Foundation
import SwiftUI

class Utills{
    static var color1 = Color(red: 252/256,green: 175/256,blue: 69/256)
    static var color2 = Color(red: 245/256,green: 96/256,blue: 64/256)
    
    static var image1 = "https://lh6.googleusercontent.com/-9lzOk_OWZH0/URquoo4xYoI/AAAAAAAAAbs/AwgzHtNVCwU/s1024/Frantic.jpg"
    static var image2 = "https://lh4.googleusercontent.com/-JhFi4fb_Pqw/URquuX-QXbI/AAAAAAAAAbs/IXpYUxuweYM/s1024/Horseshoe%252520Bend.jpg"
    
    static func currentDate() -> String{
        let date = Date()
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = df.string(from: date)
        return dateString
    }
    
}

extension UIScreen{
    static var width = UIScreen.main.bounds.size.width
    static var height = UIScreen.main.bounds.size.height
    static var size = UIScreen.main.bounds.size
}
