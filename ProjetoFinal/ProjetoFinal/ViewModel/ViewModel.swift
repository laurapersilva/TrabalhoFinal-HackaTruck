//
//  ViewModel.swift
//  ProjetoFinal
//
//  Created by Turma02-28 on 03/04/25.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var personagens: [Gasto] = []
    
    func fetch() {
        //pega a url da json
        guard let url = URL(string: "http://127.0.0.1:1880/leituraLaura") else {
            return
        }
            
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error
            in
            guard let data = data, error == nil else {
                return
            }
            
            do { //tentar decodificar
                let parsed = try JSONDecoder().decode([Gasto].self, from: data)
                
                //para ordernar esse processo
                DispatchQueue.main.async {
                    self?.personagens = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
