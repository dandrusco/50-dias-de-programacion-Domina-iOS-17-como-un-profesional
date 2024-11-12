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
    
    var body: some View {
        VStack {
            //10. Ahora podemos reemplazar el TextField por el formulario
            /*TextField("Nombre de Usuario", text: $username)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding()*/
            FormView(fieldName: "Nombre de Usuario", fieldValue: $username)
            RequirementText(requirementText: "Minimo 6 Caracteres")
            
            //11. Ahora realizaremos el cambio en la SecureField
            /*SecureField("Contraseña", text: $password)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding()*/
            FormView(fieldName: "Contraseña", fieldValue: $password, isSecure: true)
            RequirementText(iconName: "lock.open", iconColor: .green, requirementText: "Minimo 8 Caracteres", isVerified: true)
            
            //12. Lo mismo para validar contraseña
            /*SecureField("Repetir Contraseña", text: $passwordValidation)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding()*/
            FormView(fieldName: "Repetir Contraseña", fieldValue: $passwordValidation, isSecure: true)
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

//1. Crearemos una nueva structura para la vista del formulario
struct FormView: View {
    //2. Lo que tendran en comun es que todos necesitaran un nombre
    var fieldName = ""
    //3. Para poder vincular este fieldName al @State private var username, deberemos Bindearlo
    @Binding var fieldValue: String
    //4. Crearemos otra variable para ver si es seguro
    var isSecure = false
    
    var body: some View {
        //5. Crearemos una VStack
        VStack {
            //6. Si es seguro...
            if isSecure{
                //7. Crearemos una SecureField, donde el texto sera el fieldName y lo vincularemos al bindign
                SecureField(fieldName, text: $fieldValue)
                    .font(.system(size: 18, weight: .light, design: .rounded))
                    .padding(.horizontal)
            }else{
                //8. Programaremos en caso de que no sea seguro sera una TextField
                TextField(fieldName, text: $fieldValue)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .padding(.horizontal)
            }
            //9. le agregaremos una linea divisoria bien delgada de color gris
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
