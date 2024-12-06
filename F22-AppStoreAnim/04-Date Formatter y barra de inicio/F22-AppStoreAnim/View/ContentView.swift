//
//  ContentView.swift
//  F22-AppStoreAnim
//
//  Created by Danilo Andrusco on 05-12-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //9. Eliminaremos esto para ir viendo los cambios
            /*Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")*/
            
            //10. LLamamos a la structura
            TopView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//1. Siempre en la AppStore, nos aparece el dia de hoy, una foto, etc
//2. Crearemos una estructura para mostrar esa informacion
struct TopView: View {
    var body: some View {
        //3. Crearemos una HStac para aplicar 2 textos
        HStack(alignment: .lastTextBaseline, content: {
            //4. Creamos otra VStack alineado a la izquierda
            VStack(alignment: .leading, content: {
                //11. Pondremos el texto para mostrar el dia de hoy en realcion a la funcion que creamos
                Text(getCurrentDate().uppercased())
                    .font(.caption)
                    .foregroundStyle(Color.secondary)
                //12. Pondremos el texto de hoy...
                Text("Hoy")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            })
            //13. Metemos un Spacer para tirar todo a la izquierda
            Spacer()
            //15. La metemos aqui, aun que por ahora solo nos dara unhola mundo
            UserView()
        })
    }
    
    
    //5. Crearemos una funcion para mostrar el dia de hoy, con dia escrito, numero, mes y año
    func getCurrentDate(with format: String = "EEEE, d MMM YYYY") -> String{
        //6. Formatearemos las fechas
        let dateFormatter = DateFormatter()
        //7. Al dateFormatter le pasamos el dateFormat, siendo igual al format que recibimos por paremetro
        dateFormatter.dateFormat = format
        //8. Devolvemos la fecha formateada en string de la fecha de hoy
        return dateFormatter.string(from: Date())
    }
}

//14. Creamos una estructura para mostrar la imagen de la persona
struct UserView: View {
    var body: some View{
        Text("Hellow, word")
    }
}
