//
//  ViewController.swift
//  API
//
//  Created by Mekala Vamsi Krishna on 27/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    var viewModel: ViewControllerViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        viewModel = ViewControllerViewModel()
        viewModel?.delegate = self
        
        viewModel?.apiCall()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.petitions = DatabaseHelper.shared.getPetitions()
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.petitions.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel?.petitions[indexPath.row].title
        cell.detailTextLabel?.text = viewModel?.petitions[indexPath.row].body
        return cell
    }
}

extension ViewController: ViewControllerDelegate {
    func didUpdateData(_ viewModel: ViewControllerViewModel) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
