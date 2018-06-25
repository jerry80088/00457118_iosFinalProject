//
//  Weight.swift
//  00357125_final
//
//  Created by user_03 on 2018/1/11.
//  Copyright © 2018年 test. All rights reserved.
//

import Foundation
import UIKit

struct Info: Codable {
    var Height: String
    var Weight: String
    var Name: String
    var AttackHeight: String
    var BlockHeight: String
    
   var imageName: String?
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static func saveToFile(infos: [Info]) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(infos) {
            let url = Info.documentsDirectory.appendingPathComponent("info")
            try? data.write(to: url)
        }
    }
    
    static func readInfosFromFile() -> [Info]? {
        let propertyDecoder = PropertyListDecoder()
        let url = Info.documentsDirectory.appendingPathComponent("info")
        if let data = try? Data(contentsOf: url), let infos = try? propertyDecoder.decode([Info].self, from: data) {
            return infos
        } else {
            return nil
        }
    }
    var image: UIImage? {
        if let imageName = imageName {
            let url = Info.documentsDirectory.appendingPathComponent(imageName)
            return UIImage(contentsOfFile: url.path)
        } else {
            return #imageLiteral(resourceName: "head")
            
        }
    }
    
    
}
