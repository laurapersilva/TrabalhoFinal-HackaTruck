//
//  APIKey.swift
//  ProjetoFinal
//
//  Created by Turma02-28 on 04/04/25.
//

import Foundation

enum APIKey {
    //pegar a chave api de GENAI-Info
    static var `default` : String {
        guard let filePath = Bundle.main.path( forResource: "GenAI-Info", ofType: "plist") else {
            fatalError("Couldn't find this file")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key in the file")
        }
        if value.starts(with: "_") {
            fatalError("Follow the instructions better")
        }
        return value
    }
}
