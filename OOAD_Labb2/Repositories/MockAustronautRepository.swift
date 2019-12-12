//
//  MockAustronautRepository.swift
//  OOAD_Labb2
//
//  Created by Max Friman on 2019-12-09.
//  Copyright © 2019 Max Friman. All rights reserved.
//

import Foundation

class MockAustronautRepository: AustronautRepository {
    var observer: OnFetchedAustronaut?
    
    func getAll() {
        let austronaut = Austronaut(people: [
            People(name: "Max", craft: "Challenger"),
            People(name: "Berit", craft: "Apollo"),
            People(name: "Name", craft: "USS Enterprise"),
            People(name: "Björn", craft: "Battlestar Galactica")
            ])
        observer?.didFetch(austronaut)
    }
}

