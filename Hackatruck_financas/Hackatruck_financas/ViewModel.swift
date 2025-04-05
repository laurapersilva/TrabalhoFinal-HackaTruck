//
//  Model.swift
//  Hackatruck_financas
//
//  Created by Turma02-22 on 04/04/25.
//

import Foundation

//
//  ViewModel.swift
//  DesafioHacka_07
//
//  Created by Turma02-22 on 26/03/25.
//

import Foundation

class ViewModel : ObservableObject{
    @Published var bancos : [JurosBancos] = []
    
    func fetch(){
        guard let url = URL(string: "https://olinda.bcb.gov.br/olinda/servico/taxaJuros/versao/v2/odata/TaxasJurosDiariaPorInicioPeriodo?$top=100&$format=json&$select=InicioPeriodo,FimPeriodo,Segmento,Modalidade,InstituicaoFinanceira,TaxaJurosAoMes") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self]data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let parsed = try JSONDecoder().decode([JurosBancos].self, from: data)
                
                DispatchQueue.main.async{
                    self?.personagens = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
}
