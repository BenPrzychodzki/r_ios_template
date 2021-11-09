//
//  PlayerModel.swift
//  SquidGameMeter
//
//  Created by Szymon Trochimiak on 09/11/2021.
//

import Foundation

struct PlayerModel: Codable {
   let id, name: String
   let pict: String?
   let description: String
}

class MyVariables: ObservableObject {
    @Published var isEliminated = [false, false, false, false, false, false, false]
}
