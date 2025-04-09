//
//  ViewModel.swift
//  ProjetoFinal
//
//  Created by Turma02-28 on 03/04/25.
//

import Foundation
import Charts

class ViewModel: ObservableObject {
    
    @Published var gasto: [Gasto] = []
    @Published var ganho: [Ganho] = []
    @Published var bancos : [JurosBancos] = []
    
    func fetchBanco() {
        guard let url = URL(string: "https://olinda.bcb.gov.br/olinda/servico/taxaJuros/versao/v2/odata/TaxasJurosDiariaPorInicioPeriodo?$top=100&$filter=Modalidade%20eq%20'Cart%C3%A3o%20de%20cr%C3%A9dito%20-%20parcelado%20-%20Pr%C3%A9-fixado'&$orderby=InicioPeriodo%20desc&$format=json&$select=InicioPeriodo,FimPeriodo,Segmento,Modalidade,InstituicaoFinanceira,TaxaJurosAoMes") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                // Define a structure to match the API response
                struct APIResponse: Decodable {
                    let value: [JurosBancos]
                }
                
                let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self?.bancos = apiResponse.value
                }
            } catch {
                print("Decoding error:", error)
            }
        }
        task.resume()
    }
  
    
    //Funcao para gastos
    func fetchGasto() {
        //pega a url da json
        guard let url = URL(string: "http://127.0.0.1:1880/getGasto") else {
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
                    self?.gasto = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    //funcao para ganhos
    func fetchGanho() {
        //pega a url da json
        guard let url = URL(string: "http://127.0.0.1:1880/getGanho") else {
            return
        }
            
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error
            in
            guard let data = data, error == nil else {
                return
            }
            
            do { //tentar decodificar
                let parsed = try JSONDecoder().decode([Ganho].self, from: data)
                
                //para ordernar esse processo
                DispatchQueue.main.async {
                    self?.ganho = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
   
    
        
      

}
