//
//  Graficos.swift
//  ProjetoFinal
//
//  Created by Turma02-28 on 02/04/25.
//

import SwiftUI
import Charts


struct Graficos: View {
    
    @StateObject var model = ViewModel()
    
    var meses = ["Janeiro", "Fevereiro", "Marco", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]
    @State private var mesSelecionado: String = "l"
    @State private var aux: String = "l"
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color("Principal").ignoresSafeArea()
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 90)
                    
                    ZStack{
                        Color(.white).ignoresSafeArea()
                        
                        VStack{
                            Spacer()
                            
                            Chart {
                                ForEach(model.gasto) { data in
                                    ForEach(data.spent, id: \.self) { s in
                                        BarMark(x: .value("Nomes", data.nome!) ,
                                                y: .value("Gastos", s.gasto!)
                                        ).foregroundStyle(Color("Principal"))
                                    }
                                }
                            }
                            .chartLegend(.hidden)
                            .frame(maxWidth: 300, maxHeight: 150)
                            
                            Spacer()
                            
                            
                            
                            Chart {
                                ForEach(model.ganho) { d in
                                    BarMark(x: .value("Nomes", d.daattaa!) ,
                                            y: .value("Ganhos", d.ganho!)
                                    ).foregroundStyle(Color("Principal"))
                                }
                            }
                            .chartLegend(.hidden)
                            .frame(maxWidth: 300, maxHeight: 150)
                            
                            Spacer()
                            
                            Text("Lucro do mês de").font(.title).foregroundStyle(Color("Principal"))
                            VStack{
                                Picker("meses", selection: $mesSelecionado) {
                                    ForEach(meses, id: \.self) { mes in
                                        Text(mes).onTapGesture {
                                            aux = mes
                                        }
                                    }
                                }
                            }.frame(maxWidth: .infinity, alignment: .center)
                                
                                //lucro, specifier: "%.2f"
                            Text(" R$ \(calcularMes(mes: aux))")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                        }
                    }.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/).cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/).padding()
                }
            }
            .onAppear() {
                model.fetchGasto()
                model.fetchGanho()
            }
        }
        
    }
    func calcularMes(mes: String) ->  Float {
        var lucro: Float = 0.0
        var x: Float = 0.0
        var y: Float = 0.0
    
        if mes == "Janeiro" {
            //somatorio dos ganhos
            for d in model.ganho {
                let data = d.daattaa!
                let components = data.components(separatedBy: "/")
                let mesmes = Int(components[1])
                
                if mesmes == 01 {
                    x = x + d.ganho!
                }
            }
            
            //somatorio dos gastos
            for d in model.gasto {
                for s in d.spent{
                    let data = s.data!
                    let components = data.components(separatedBy: "/")
                    let mesmes = Int(components[1])
                    
                    if mesmes == 01 {
                        y = y + s.gasto!
                    }
                }
            }
            
            lucro = x - y
            
        }
        else if mes == "Fevereiro" {
            //somatorio dos ganhos
            for d in model.ganho {
                let data = d.daattaa!
                let components = data.components(separatedBy: "/")
                let mesmes = Int(components[1])
                
                if mesmes == 02 {
                    x = x + d.ganho!
                }
            }
            
            //somatorio dos gastos
            for d in model.gasto {
                for s in d.spent{
                    let data = s.data!
                    let components = data.components(separatedBy: "/")
                    let mesmes = Int(components[1])
                    
                    if mesmes == 02 {
                        y = y + s.gasto!
                    }
                }
            }
            
            lucro = x - y
        }
        else if mes == "Marco" {
            //somatorio dos ganhos
            for d in model.ganho {
                let data = d.daattaa!
                let components = data.components(separatedBy: "/")
                let mesmes = Int(components[1])
                
                if mesmes == 03 {
                    x = x + d.ganho!
                }
            }
            
            //somatorio dos gastos
            for d in model.gasto {
                for s in d.spent{
                    let data = s.data!
                    let components = data.components(separatedBy: "/")
                    let mesmes = Int(components[1])
                    
                    if mesmes == 03 {
                        y = y + s.gasto!
                    }
                }
            }
            
            lucro = x - y
        }
        else if mes == "Abril" {
            //somatorio dos ganhos
            for d in model.ganho {
                let data = d.daattaa!
                let components = data.components(separatedBy: "/")
                let mesmes = Int(components[1])
                
                if mesmes == 04 {
                    x = x + d.ganho!
                }
            }
            
            //somatorio dos gastos
            for d in model.gasto {
                for s in d.spent{
                    let data = s.data!
                    let components = data.components(separatedBy: "/")
                    let mesmes = Int(components[1])
                    
                    if mesmes == 04 {
                        y = y + s.gasto!
                    }
                }
            }
            
            lucro = x - y
        }
        else if mes == "Maio" {
            //somatorio dos ganhos
            for d in model.ganho {
                let data = d.daattaa!
                let components = data.components(separatedBy: "/")
                let mesmes = Int(components[1])
                
                if mesmes == 05 {
                    x = x + d.ganho!
                }
            }
            
            //somatorio dos gastos
            for d in model.gasto {
                for s in d.spent{
                    let data = s.data!
                    let components = data.components(separatedBy: "/")
                    let mesmes = Int(components[1])
                    
                    if mesmes == 05 {
                        y = y + s.gasto!
                    }
                }
            }
            
            lucro = x - y
        }
        else if mes == "Junho" {
            //somatorio dos ganhos
            for d in model.ganho {
                let data = d.daattaa!
                let components = data.components(separatedBy: "/")
                let mesmes = Int(components[1])
                
                if mesmes == 06 {
                    x = x + d.ganho!
                }
            }
            
            //somatorio dos gastos
            for d in model.gasto {
                for s in d.spent{
                    let data = s.data!
                    let components = data.components(separatedBy: "/")
                    let mesmes = Int(components[1])
                    
                    if mesmes == 06 {
                        y = y + s.gasto!
                    }
                }
            }
            
            lucro = x - y
        }
        else if mes == "Julho" {
            //somatorio dos ganhos
            for d in model.ganho {
                let data = d.daattaa!
                let components = data.components(separatedBy: "/")
                let mesmes = Int(components[1])
                
                if mesmes == 07 {
                    x = x + d.ganho!
                }
            }
            
            //somatorio dos gastos
            for d in model.gasto {
                for s in d.spent{
                    let data = s.data!
                    let components = data.components(separatedBy: "/")
                    let mesmes = Int(components[1])
                    
                    if mesmes == 07 {
                        y = y + s.gasto!
                    }
                }
            }
            
            lucro = x - y
        }
        else if mes == "Agosto" {
            //somatorio dos ganhos
            for d in model.ganho {
                let data = d.daattaa!
                let components = data.components(separatedBy: "/")
                let mesmes = Int(components[1])
                
                if mesmes == 08 {
                    x = x + d.ganho!
                }
            }
            
            //somatorio dos gastos
            for d in model.gasto {
                for s in d.spent{
                    let data = s.data!
                    let components = data.components(separatedBy: "/")
                    let mesmes = Int(components[1])
                    
                    if mesmes == 08 {
                        y = y + s.gasto!
                    }
                }
            }
            
            lucro = x - y
        }
        else if mes == "Setembro" {
            //somatorio dos ganhos
            for d in model.ganho {
                let data = d.daattaa!
                let components = data.components(separatedBy: "/")
                let mesmes = Int(components[1])
                
                if mesmes == 09 {
                    x = x + d.ganho!
                }
            }
            
            //somatorio dos gastos
            for d in model.gasto {
                for s in d.spent{
                    let data = s.data!
                    let components = data.components(separatedBy: "/")
                    let mesmes = Int(components[1])
                    
                    if mesmes == 09 {
                        y = y + s.gasto!
                    }
                }
            }
            
            lucro = x - y
        }
        else if mes == "Outubro"{
            //somatorio dos ganhos
            for d in model.ganho {
                let data = d.daattaa!
                let components = data.components(separatedBy: "/")
                let mesmes = Int(components[1])
                
                if mesmes == 10 {
                    x = x + d.ganho!
                }
            }
            
            //somatorio dos gastos
            for d in model.gasto {
                for s in d.spent{
                    let data = s.data!
                    let components = data.components(separatedBy: "/")
                    let mesmes = Int(components[1])
                    
                    if mesmes == 10 {
                        y = y + s.gasto!
                    }
                }
            }
            
            lucro = x - y
        }
        else if mes == "Novembro" {
            //somatorio dos ganhos
            for d in model.ganho {
                let data = d.daattaa!
                let components = data.components(separatedBy: "/")
                let mesmes = Int(components[1])
                
                if mesmes == 11 {
                    x = x + d.ganho!
                }
            }
            
            //somatorio dos gastos
            for d in model.gasto {
                for s in d.spent{
                    let data = s.data!
                    let components = data.components(separatedBy: "/")
                    let mesmes = Int(components[1])
                    
                    if mesmes == 11 {
                        y = y + s.gasto!
                    }
                }
            }
            
            lucro = x - y
        }
        else if mes == "Dezembro" {
            //somatorio dos ganhos
            for d in model.ganho {
                let data = d.daattaa!
                let components = data.components(separatedBy: "/")
                let mesmes = Int(components[1])
                
                if mesmes == 12 {
                    x = x + d.ganho!
                }
            }
            
            //somatorio dos gastos
            for d in model.gasto {
                for s in d.spent{
                    let data = s.data!
                    let components = data.components(separatedBy: "/")
                    let mesmes = Int(components[1])
                    
                    if mesmes == 12 {
                        y = y + s.gasto!
                    }
                }
            }
            
            lucro = x - y
        }
        return lucro
    }
}



#Preview {
    Graficos()
}



