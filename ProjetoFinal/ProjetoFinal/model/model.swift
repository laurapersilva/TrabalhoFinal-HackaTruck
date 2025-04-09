//
//  model.swift
//  ProjetoFinal
//
//  Created by Turma02-28 on 03/04/25.
//

import Foundation

struct Gasto: Decodable, Identifiable {
    let id: Int
    let nome: String?
    let spent: [Spent]
}

struct Spent: Codable, Hashable {
    let gasto: Float?
    let data: String?
}

struct Ganho: Decodable, Identifiable{
    let id: Int
    let ganho: Float?
    let daattaa: String?
}

struct JurosBancos: Codable, Identifiable {
    // Create an ID from existing fields
    var id: String {
        return "\(InstituicaoFinanceira ?? "")-\(Modalidade ?? "")-\(InicioPeriodo ?? "")"
    }
    
    let InicioPeriodo: String?
    let FimPeriodo: String?
    let Segmento: String?
    let Modalidade: String?
    let InstituicaoFinanceira: String?
    let TaxaJurosAoMes: Double?
}


