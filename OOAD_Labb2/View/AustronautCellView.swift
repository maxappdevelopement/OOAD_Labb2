//
//  AustronautCellView.swift
//  OOAD_Labb2
//
//  Created by Max Friman on 2019-12-09.
//  Copyright © 2019 Max Friman. All rights reserved.
//

import Foundation
import UIKit

class AustronautCellView: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    
    var viewModel: AustronautCellViewModel? {
        didSet {
            viewModel?.austronautCellViewModelObserver = self
            titleLabel.text = viewModel?.name
            detailLabel.text = viewModel?.craft
        }
    }
}

extension AustronautCellView : AustronautViewModelObserver {
    func onViewModelChanged(cellViewModel: AustronautCellViewModel) {
        self.viewModel = cellViewModel
    }
}
