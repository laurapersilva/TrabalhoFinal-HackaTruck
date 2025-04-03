//
//  HistoriadoGato.swift
//  ProjetoFinal
//
//  Created by Turma02-28 on 03/04/25.
//

import SwiftUI

struct HistoriadoGato: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Color("Principal").ignoresSafeArea()
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 100)
                    
                }
                
            }
        }
    }
}

#Preview {
    HistoriadoGato()
}
