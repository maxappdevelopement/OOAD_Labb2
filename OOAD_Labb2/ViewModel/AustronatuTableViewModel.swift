//
//  AustronatuTableViewModel.swift
//  OOAD_Labb2
//
//  Created by Max Friman on 2019-12-09.
//  Copyright © 2019 Max Friman. All rights reserved.
//

import Foundation

class AustronautTableViewModel: OnFetchedData {
   
    private var austronautRepository: AustronautRepository
    var austronautCells : [AustronautCellViewModel] = [AustronautCellViewModel]() {
        didSet {
            self.reloadTableViewCallBack?()
        }
    }
    var reloadTableViewCallBack: (() -> Void)?
    
    init(austronautRepository: AustronautRepository) {
        self.austronautRepository = austronautRepository
    }
    
    func loadAustronauts() {
        austronautRepository.observer = self
        austronautRepository.getAll()
    }
    
    func didFetchData(austronaut: Austronaut) {
        self.austronautCells = austronaut.people.map {
            AustronautCellViewModel(austronaut: $0)
        }
    }
}

