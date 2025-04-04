//
//  model.swift
//  ProjetoFinal
//
//  Created by Turma02-28 on 03/04/25.
//

import Foundation

struct Gasto: Decodable, Identifiable {
    let id: String
    let nome: String?
    let spent: Spent
}

struct Spent: Codable, Hashable {
    let gasto: Float?
    let data: String?
}
