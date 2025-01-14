//
//  ContentView.swift
//  F40-Mapas
//
//  Created by Danilo Andrusco on 14-01-25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    //1.A traves de MapCameraPosition tambien nos ponemos posicionar, para ello crearemos una variable de estado en principio como automatico
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        //2. Ahora al crear el mapa lo bindearemos a la variable de estado position
        Map(position: self.$position)
        //3. Cuando arranque el mapa (onAppear) le diremos que parta en la torre de londres
            .onAppear{
                self.position = .item(MKMapItem(placemark: .init(coordinate: .towerbridge)))
            }
        //4. Jugaremos con el area para agregar mas contenido
            .safeAreaInset(edge: .bottom) {
                //4. meteremos una HStack
                HStack{
                    //5. Pondremos un boton
                    Button(action:{
                        //6. Creamos una animacion
                        withAnimation {
                            self.position = .item(MKMapItem(placemark: .init(coordinate: .towerbridge)))
                        }
                    }) {
                        //7. Pondremos un texto
                        Text("Puente de la Torre")
                    }
                    //8. Lo pintamos agregandole un estilo
                    .tint(.teal)
                    .buttonStyle(.borderedProminent)
                    
                    //9. Realizaremos lo mismo pero para Big Ben
                    Button(action: {
                        withAnimation {
                            self.position = .item(MKMapItem(placemark: .init(coordinate: .bigben)))
                        }
                    }, label: {
                        Text("Big Ben")
                    })
                    .tint(.teal)
                    .buttonStyle(.borderedProminent)
                    //10. Ahora podemos intercambiar entre ambas direcciones
                }
            }
    }
    
}

#Preview {
    ContentView()
}

extension CLLocationCoordinate2D {
    static let valparaiso = CLLocationCoordinate2D(latitude: -33.044, longitude: -71.62)
    
    static let manhattan = CLLocationCoordinate2D(latitude: 40.75, longitude: -73.98)
    
    static let bigben = CLLocationCoordinate2D(latitude: 51.501, longitude: -0.1245)
    
    static let towerbridge = CLLocationCoordinate2D(latitude: 51.5055, longitude: -0.0754)
}
