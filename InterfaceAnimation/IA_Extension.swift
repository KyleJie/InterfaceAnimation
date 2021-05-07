//
//  IA_Extension.swift
//  InterfaceAnimation
//
//  Created by NightSword on 7/5/21.
//

import Foundation
import UIKit

extension UIColor {

    convenience init(r : CGFloat, g : CGFloat, b : CGFloat, a : CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
   
//    convenience init?(Hex : String, a : CGFloat = 1.0) {
//
//        guard Hex.count == 6 else {
//            fatalError("UIColor String count not equal to 6.")
//            return nil
//        }
//
//        let rrlgHex = Hex.uppercased()
//
//        var range = NSRange(location: 0, length: 2)
//        let rHex = (rrlgHex as NSString).substring(with: range)
//        range.location = 2
//        let gHex = (rrlgHex as NSString).substring(with: range)
//        range.location = 4
//        let bHex = (rrlgHex as NSString).substring(with: range)
//
//        var r : UInt32 = 0, g : UInt32 = 0, b : UInt32 = 0
//        Scanner(string: rHex).scanHexInt32(&r)
//        Scanner(string: gHex).scanHexInt32(&g)
//        Scanner(string: bHex).scanHexInt32(&b)
//        
//        self.init(r : CGFloat(r), g : CGFloat(g), b : CGFloat(b), a:a)
//    }
 
    class func random() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}
