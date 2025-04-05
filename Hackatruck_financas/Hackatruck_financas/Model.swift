//
//  Model.swift
//  Hackatruck_financas
//
//  Created by Turma02-22 on 04/04/25.
//

import Foundation


struct JurosBancos: Codable {
    let inicioPeriodo: String
    let fimPeriodo: String
    let segmento: String
    let modalidade: String
    let instituicaoFinanceira: String
    let taxaJurosAoMes: Double
}
