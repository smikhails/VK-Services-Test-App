//
//  Main.swift
//  vk
//
//  Created by Mikhail on 13.07.2022.
//

import Foundation
import UIKit


func open_file(url: String)->String{

    if (URL(string: url) != nil){
        let file = try? String(contentsOf: URL(string: url)!)
        return file!
    }
    return ""
}
struct Data_str: Decodable {
    let body: Body
}
struct Body: Decodable {
    let services: [Services]
}
struct Services: Decodable {
    let name: String
    let description: String
    let link: String
    let icon_url: String
}

let json = open_file(url: "https://publicstorage.hb.bizmrg.com/sirius/result.json")
let data = json.data(using: .utf8)
let results: Data_str = try! JSONDecoder().decode(Data_str.self, from: data!)


