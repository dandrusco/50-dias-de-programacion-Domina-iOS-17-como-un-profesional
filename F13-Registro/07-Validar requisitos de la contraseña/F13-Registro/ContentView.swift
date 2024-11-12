//
//  ContentView.swift
//  F13-Registro
//
//  Created by Danilo Andrusco on 24-04-24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var passwordValidation = ""
    
    let viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack {
            Text("Crear nueva cuenta")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(24)
            
            FormView(fieldName: "Nombre de Usuario", fieldValue: $username)
            RequirementText(iconName: viewModel.isPassordLengthValid ? "lock.open" : "lock", iconColor: viewModel.isPassordLengthValid ? Color.green : Color.red, requirementText: "Minimo 6 Caracteres", isVerified: viewModel.isPassordLengthValid)
                .padding()
            
            FormView(fieldName: "Contraseña", fieldValue: $password, isSecure: true)
            VStack {
                RequirementText(requirementText: "Minimo 8 Caracteres")
                RequirementText(requirementText: "Debe tener al menos  una mayuscula")
            }
            .padding()
            
            FormView(fieldName: "Repetir Contraseña", fieldValue: $passwordValidation, isSecure: true)
            RequirementText(requirementText: "No coincide la contraseña")
                .padding()
                .padding(.bottom, 48)
            
            Button(action: {
                //TODO: procedera a la siguiente pantalla si esta todo en orden
            }, label: {
                Text("Registrar cuenta")
                    .font(.system(.headline, design: .rounded))
                    .bold()
                    .foregroundStyle(.white)
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 135/255, green: 240/255, blue: 160/255), Color(red: 135/255, green: 160/255, blue: 240/255)]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(16)
                    .padding(.horizontal, 16)
            })
            
            HStack {
                Text("Ya tienes cuenta con nostros?")
                    .font(.system(.callout, design: .rounded))
                    .bold()
                Button(action: {
                    //TODO: Te lleva a la pantalla de login
                }, label: {
                    Text("Entrar")
                        .font(.system(.callout, design: .rounded))
                        .bold()
                        .foregroundStyle(Color(red: 145/255, green: 160/255, blue: 240/255))
                })
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

struct RequirementText: View {
    
    var iconName = "lock"
    var iconColor = Color(red:250/255, green: 135/255, blue: 135/255)
    var requirementText = ""
    var isVerified = false
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
            
            Text(requirementText)
                .font(.system(.body, design: .rounded))
                .foregroundStyle(.secondary)
                .strikethrough(isVerified)
            
            Spacer()
        }
    }
}


struct FormView: View {
    var fieldName = ""
    @Binding var fieldValue: String
    var isSecure = false
    
    var body: some View {
        VStack {
            if isSecure{
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 18, weight: .light, design: .rounded))
                    .padding(.horizontal)
            }else{
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .padding(.horizontal)
            }
            Divider()
                .frame(height: 1)
                .background(Color(red:235/255, green: 235/255, blue: 235/255))
                .padding(.horizontal)
        }
    }
}

#Preview {
    ContentView()
}
