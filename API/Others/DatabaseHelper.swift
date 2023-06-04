//
//  DatabaseHelper.swift
//  API
//
//  Created by Mekala Vamsi Krishna on 04/06/23.
//

import Foundation
import RealmSwift

class DatabaseHelper {
    static let shared = DatabaseHelper()
    
    let realm = try! Realm()
    
    func getURL() -> URL? {
        return Realm.Configuration.defaultConfiguration.fileURL
    }
    
    func save(petetion: List<Petition>) {
        try! realm.write({
            realm.add(petetion)
        })
    }
    
    func getPetitions() -> List<Petition> {
        let results = realm.objects(Petition.self)
        let petitionList = List<Petition>()
        petitionList.append(objectsIn: results)
        return petitionList
    }
}
