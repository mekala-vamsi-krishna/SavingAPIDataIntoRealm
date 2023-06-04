//
//  Petetion.swift
//  API
//
//  Created by Mekala Vamsi Krishna on 02/06/23.
//

import Foundation
import RealmSwift

class Petition: Object, Decodable {
    @Persisted var title: String
    @Persisted var body: String
}
