//
//  Dividas.swift
//  ProjetoFinal
//
//  Created by Turma02-10 on 08/04/25.
//

import SwiftUI

struct Dividas: View {
    @StateObject private var viewModel = ViewModel()
    @State private var selectedBancoIndex: Int = 0
    @State private var periodoMeses: String = ""
    @State private var valorInicial: String = ""
    @State private var valorJuros: Double = 0.0
    @State private var valorTotal: Double = 0.0
    @State private var isCalculated: Bool = false
    var body: some View {
       
        NavigationView {
            
            VStack(spacing: 20) {
                Text("Calculadora de Juros")
                    .font(.title)
                    .padding(.top)
                
                if viewModel.bancos.isEmpty {
                    ProgressView("Carregando dados...")
                } else {
                    // Picker para seleção de bancos
                    Picker("Instituição Financeira", selection: $selectedBancoIndex) {
                        ForEach(0..<viewModel.bancos.count, id: \.self) { index in
                            let banco = viewModel.bancos[index]
                            Text("\(banco.InstituicaoFinanceira ?? "Desconhecido") - \(String(format: "%.2f%%", banco.TaxaJurosAoMes ?? 0))").tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.horizontal)
                    
                    // Campos de entrada
                    VStack(spacing: 15) {
                        HStack {
                            Text("Valor Pendente (R$):")
                                .frame(width: 120, alignment: .leading)
                            
                            TextField("Ex: 1000", text: $valorInicial)
                                .keyboardType(.decimalPad)
                                .padding(10)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                        }
                        
                        HStack {
                            Text("Período (meses):")
                                .frame(width: 120, alignment: .leading)
                            
                            TextField("Ex: 12", text: $periodoMeses)
                                .keyboardType(.numberPad)
                                .padding(10)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                        }
                        
                        Button(action: calcularJuros) {
                            Text("Calcular")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("Principal"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.top)
                    }
                    .padding(.horizontal)
                    
                    // Resultados
                    if isCalculated {
                        VStack(spacing: 10) {
                            HStack {
                                Text("Taxa mensal:")
                                Spacer()
                                Text("\(String(format: "%.2f%%", viewModel.bancos[selectedBancoIndex].TaxaJurosAoMes ?? 0))")
                                    .fontWeight(.semibold)
                            }
                            
                            HStack {
                                Text("Juros acumulados:")
                                Spacer()
                                Text("R$ \(String(format: "%.2f", valorJuros))")
                                    .fontWeight(.semibold)
                            }
                            
                            HStack {
                                Text("Valor total:")
                                Spacer()
                                Text("R$ \(String(format: "%.2f", valorTotal))")
                                    .fontWeight(.bold)
                            }
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    
                    // Informações do banco selecionado
                    if !viewModel.bancos.isEmpty {
                        let selectedBanco = viewModel.bancos[selectedBancoIndex]
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Detalhes da instituição selecionada:")
                                .font(.headline)
                            
                            Text("Instituição: \(selectedBanco.InstituicaoFinanceira ?? "Desconhecido")")
                            
                            if let modalidade = selectedBanco.Modalidade {
                                Text("Modalidade: \(modalidade)")
                            }
                            
                            if let segmento = selectedBanco.Segmento {
                                Text("Segmento: \(segmento)")
                            }
                            
                            if let inicioPeriodo = selectedBanco.InicioPeriodo, let fimPeriodo = selectedBanco.FimPeriodo {
                                Text("Período: \(inicioPeriodo) a \(fimPeriodo)")
                            }
                            
                            if let taxaJuros = selectedBanco.TaxaJurosAoMes {
                                Text("Taxa mensal: \(String(format: "%.2f%%", taxaJuros))")
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            .navigationTitle("Simulador de Juros")
            .onAppear {
                viewModel.fetchBanco()
            }
        }
    }
    
    func calcularJuros() {
        guard !viewModel.bancos.isEmpty,
              let valorInicialDouble = Double(valorInicial.replacingOccurrences(of: ",", with: ".")),
              let periodoMesesInt = Int(periodoMeses),
              let taxaJuros = viewModel.bancos[selectedBancoIndex].TaxaJurosAoMes else {
            return
        }
        
        // Convertendo taxa de porcentagem para decimal
        let taxaDecimal = taxaJuros / 100.0
        
        // Cálculo de juros compostos
        valorTotal = valorInicialDouble * pow(1 + taxaDecimal, Double(periodoMesesInt))
        valorJuros = valorTotal - valorInicialDouble
        
        isCalculated = true
        
        // Fechar o teclado
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
    


#Preview {
    Dividas()
}
