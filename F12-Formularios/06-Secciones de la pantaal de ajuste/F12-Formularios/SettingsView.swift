//
//  SettingsView.swift
//  F12-Formularios
//
//  Created by Danilo Andrusco on 03-04-24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        //2. Pondremos una navigationStack
        NavigationStack {
            //3. Ahora pondremos un formulario
            Form{
                //4. Pondremos una seccion
                Section(header:Text("Orden de los cursos")){
                    Text("Mostrar orden")
                }
                //5. Crearemos una segunda seccion
                Section(header:Text("Filtrar los cursos")){
                    Text("Filtros")
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
