//
//  WebAustronautRepository.swift
//  OOAD_Labb2
//
//  Created by Max Friman on 2019-12-09.
//  Copyright © 2019 Max Friman. All rights reserved.
//

import Foundation

class WebAustronautRepository: AustronautRepository {
    var observer: OnFetchedData?
    
    func getAll() {
        WebService().load(resource: Austronaut.all) { [weak self] result in
            switch result {
            case .success(let austronaut):
                self?.observer?.didFetchData(austronaut: austronaut)
            case .failure(let error):
                print(error)
            }
        }
    }
}

