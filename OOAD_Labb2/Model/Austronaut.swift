//
//  Austronaut.swift
//  OOAD_Labb2
//
//  Created by Max Friman on 2019-12-09.
//  Copyright © 2019 Max Friman. All rights reserved.
//

import Foundation

struct Austronaut: Codable {
    let people: [People]
}

struct People: Codable {
    let name: String
    let craft: String
}

extension Austronaut {
    static var all: Resource<Austronaut> = {
        guard let url = URL(string: "http://api.open-notify.org/astros.json") else {
            fatalError("URL is incorrect!")
        }
        return Resource<Austronaut>(url: url)
    }()
}
