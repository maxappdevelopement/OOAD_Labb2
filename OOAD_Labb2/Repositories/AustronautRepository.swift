//
//  AustronautRepository.swift
//  OOAD_Labb2
//
//  Created by Max Friman on 2019-12-09.
//  Copyright © 2019 Max Friman. All rights reserved.
//

import Foundation

protocol AustronautRepository {
    var observer: OnFetchedAustronaut? { get set }
    func getAll()
}
