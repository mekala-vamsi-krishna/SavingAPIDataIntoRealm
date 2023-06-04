//
//  ViewControllerViewModel.swift
//  API
//
//  Created by Mekala Vamsi Krishna on 02/06/23.
//

import Foundation
import RealmSwift

// 1.
protocol ViewControllerDelegate {
    func didUpdateData(_ viewModel: ViewControllerViewModel)
}

class ViewControllerViewModel {
    var petitions = List<Petition>()
    // 2.
    var delegate: ViewControllerDelegate?
    
    func apiCall() {
        //        1. Get URL String
        //        2. Give URLSession
        //        3. Give a Task
        //        4. Resume the Task
        //        GET, POST, PUT, DELETE
        guard let urlString = URL(string: "https://www.hackingwithswift.com/samples/petitions-1.json") else { return }
        URLSession.shared.dataTask(with: urlString) { data, response, error in
            guard let data = data, error == nil else { return }
            let jsonDecoder = JSONDecoder()
            if let results = try? jsonDecoder.decode(Petitions.self, from: data) {
                DispatchQueue.main.async {
                    self.petitions = results.results
                    // 3.
                    DatabaseHelper.shared.save(petetion: self.petitions)
                    self.delegate?.didUpdateData(self)
                }
            }
        }
        .resume()
    }
}

