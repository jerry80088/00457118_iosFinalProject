//
//  Food.swift
//  00357125_final
//
//  Created by user_03 on 2018/1/12.
//  Copyright © 2018年 test. All rights reserved.
//

import Foundation
import UIKit

struct Food: Codable {
    
    var Date: String
    var Weather: String
    var Description: String
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static func saveToFile(infos: [Food]) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(infos) {
            let url = Info.documentsDirectory.appendingPathComponent("food")
            try? data.write(to: url)
        }
    }
    static func readInfosFromFile() -> [Food]? {
        let propertyDecoder = PropertyListDecoder()
        let url = Info.documentsDirectory.appendingPathComponent("food")
        if let data = try? Data(contentsOf: url), let infos = try? propertyDecoder.decode([Food].self, from: data) {
            return infos
        } else {
            return nil
        }
    }
    
}

