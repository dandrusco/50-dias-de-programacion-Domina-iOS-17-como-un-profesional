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
            TextField("Nombre de Usuario", text: $username)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding()
            //8. AHora debajo del nombre de usuario pondremos la RequirementText con el texto que diga "Minimo 6 caracteres"
            RequirementText(requirementText: "Minimo 6 Caracteres")
            
            SecureField("Contraseña", text: $password)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding()
            //9. Para la contraseña realizaremos lo mismo pero mas personalizado, le cambiaremos el icono, el color y la tacharemos
            RequirementText(iconName: "lock.open", iconColor: .green, requirementText: "Minimo 8 Caracteres", isVerified: true)
            
            SecureField("Repetir Contraseña", text: $passwordValidation)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding()
        }
        .padding()
    }
}

//1. Crearemos una estructura para los requisitos del texto, que sera de tipo vista
struct RequirementText: View {
    
    //2. Crearemos unas variables para que el requisito sea dinamico, tanto para el icono, su color, requerimiento de texto y si esta validado
    var iconName = "lock"
    var iconColor = Color(red:250/255, green: 135/255, blue: 135/255)
    var requirementText = ""
    var isVerified = false
    
    var body: some View {
        //3. Definiremos una HStack
        HStack {
            //4. Pondremos una imagen creara anteriormente con su color
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
            
            //5. Ahora pondremos el texto
            Text(requirementText)
                .font(.system(.body, design: .rounded))
                .foregroundStyle(.secondary)
                //6. agregaremos el modificador strikethrough para tachar el texto siempre y cuando la variable isVerified sea True
                .strikethrough(isVerified)
            
            //7. Pondremos un Spacer para lanzar todo el texto a la izquierda
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
