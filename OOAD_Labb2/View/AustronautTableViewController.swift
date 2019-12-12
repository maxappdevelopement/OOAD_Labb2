//
//  AustronautTableView.swift
//  OOAD_Labb2
//
//  Created by Max Friman on 2019-12-09.
//  Copyright © 2019 Max Friman. All rights reserved.
//

import Foundation
import UIKit

class AustronautTableViewController: UITableViewController {
    
    var viewModel : AustronautTableViewModel?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //viewModel = AustronautTableViewModel(austronautRepository: MockAustronautRepository())
        viewModel = AustronautTableViewModel(austronautRepository: WebAustronautRepository())
        
        viewModel?.reloadTableViewCallBack = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    //A button in the view that user can click to trigger fetching data from the api and then present them on the screen
    @IBAction func fetchData(_ sender: Any) {
         viewModel?.loadAustronauts()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.austronautCells.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "austronautCell", for: indexPath) as! AustronautCellView
        
        cell.viewModel = viewModel?.austronautCells[indexPath.row]
        
        return cell
    }
}
