//
//  HistoriadoGato.swift
//  ProjetoFinal
//
//  Created by Turma02-28 on 03/04/25.
//

import SwiftUI
import GoogleGenerativeAI

struct HistoriadoGato: View {
    
    let model = GenerativeModel(name: "gemini-1.5-flash", apiKey: APIKey.default)
    @State var textInput = ""
    @State var aiResponse = ""
    @State var gasto: Float = 0.0
    @State var renda: Float = 0.0
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color("Principal").ignoresSafeArea()
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 100)
                    Text("Terapia Financeira")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                    
                    Text("Converse seus problemas financeiros com a nossa inteligência artificial")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .padding(0.25)
                    
                    
                    Spacer()
                    
                    ScrollView {
                        Text(aiResponse)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding(EdgeInsets(top: 50, leading: 50, bottom: 0, trailing: 50))
                    }
                    
                    HStack {
                        TextField("Enter a message", text: $textInput)
                            .textFieldStyle(.roundedBorder)
                            .foregroundStyle(.black)
                        Button {
                            sendMessage()
                            print(textInput)
                        } label: {
                            Image(systemName: "paperplane.fill")
                        }
                    }.padding()
                }
                
            }
        }
    }
    
    func sendMessage() {
        aiResponse = ""
        
        Task {
            do {
                let response = try await model.generateContent("Sempre me envie assuntos relacionados a financas, tendo em mente que o usuário tem o gasto \(gasto) e a renda \(renda) em:" + textInput)
                
                guard let text = response.text else  {
                    textInput = "Desculpe, não consegui processar isso."
                    return
                }
                textInput = ""
                aiResponse = text
                
            } catch {
                aiResponse = "Algo deu errado!\n\(error.localizedDescription)"
            }
        }
    }
}

#Preview {
    HistoriadoGato()
}
