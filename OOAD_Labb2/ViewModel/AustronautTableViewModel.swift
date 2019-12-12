//
//  AustronatuTableViewModel.swift
//  OOAD_Labb2
//
//  Created by Max Friman on 2019-12-09.
//  Copyright © 2019 Max Friman. All rights reserved.
//

import Foundation

class AustronautTableViewModel: OnFetchedAustronaut {
   
    private var austronautRepository: AustronautRepository
    var reloadTableViewCallBack: (() -> Void)?
    var austronautCells = [AustronautCellViewModel]() {
        didSet {
            self.reloadTableViewCallBack?()
        }
    }
    
    init(austronautRepository: AustronautRepository) {
        self.austronautRepository = austronautRepository
    }
    
    func loadAustronauts() {
        austronautRepository.observer = self
        austronautRepository.getAll()
    }
    
    func didFetch(_ austronaut: Austronaut) {
        self.austronautCells = austronaut.people.map {
            AustronautCellViewModel(austronaut: $0)
        }
    }
}

