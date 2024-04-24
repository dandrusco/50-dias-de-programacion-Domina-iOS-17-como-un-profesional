//
//  ContentView.swift
//  F13-Registro
//
//  Created by Danilo Andrusco on 24-04-24.
//

import SwiftUI

struct ContentView: View {
    //1. Vamos a crear un formulario de contacto, para ello crearemos una variable de estado para el nombre de usuario, clave y repetir clave
    @State private var username = ""
    @State private var password = ""
    @State private var passwordValidation = ""
    
    var body: some View {
        VStack {
            //2. Tanto la imagen como el texto lo borraremos
            /*Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")*/
            
            //3. Ahora crearemos una TextFlield donde lo que el usuario teclee, lo guardaremos en la variable de estado username
            TextField("Nombre de Usuario", text: $username)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding()
            
            //4. Como no queremos que se vea a la hora de escribir la contraseña utilizaremos ScureField en vez de una TextField
            SecureField("Contraseña", text: $password)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding()
            
            //5. Crearemos un segundo ScureField que validara la contraseña anterior
            SecureField("Repetir Contraseña", text: $passwordValidation)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
