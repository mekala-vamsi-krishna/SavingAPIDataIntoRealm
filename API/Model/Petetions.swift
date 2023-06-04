//
//  Petetions.swift
//  API
//
//  Created by Mekala Vamsi Krishna on 02/06/23.
//

import Foundation
import RealmSwift

class Petitions: Object, Decodable {
    @Persisted var results: List<Petition>
}
