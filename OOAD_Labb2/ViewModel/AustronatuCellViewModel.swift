//
//  AustronatuCellViewModel.swift
//  OOAD_Labb2
//
//  Created by Max Friman on 2019-12-09.
//  Copyright © 2019 Max Friman. All rights reserved.
//

import Foundation

protocol AustronautViewModelObserver: class {
    func onViewModelChanged(cellViewModel: AustronautCellViewModel)
}

class AustronautCellViewModel {
    //People skickas in som obehandlat objekt varpå datan formateras för hur den ska presenteras till vyn
    
    var austronaut : People
    weak var austronautCellViewModelObserver: AustronautViewModelObserver?
    
    var name : String {
        return austronaut.name + "!"
    }
    var craft : String {
        return austronaut.craft
    }
    
    init(austronaut: People) {
        self.austronaut = austronaut
        self.austronautCellViewModelObserver?.onViewModelChanged(cellViewModel: self)
    }
}
