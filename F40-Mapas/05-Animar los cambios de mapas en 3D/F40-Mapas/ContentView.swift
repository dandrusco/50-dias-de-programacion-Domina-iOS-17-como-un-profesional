//
//  ContentView.swift
//  F40-Mapas
//
//  Created by Danilo Andrusco on 14-01-25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        //4. Ahora la hora de crear un mapa podemos incluir marcadores, para ello deberemos abrir y cerrar {} y dentro de ellos añadimos el Market
        Map(position: self.$position) {
            //5. En market podemos poner un mensaje y un icono
            Marker("Recoge tu pedido aquí: ",
                   systemImage: "gift",
                   coordinate: .towerbridge)
            //6. Otro parametro es el color
            .tint(.teal)
        }
            .onAppear{
                self.position = .item(MKMapItem(placemark: .init(coordinate: .towerbridge)))
            }
            .safeAreaInset(edge: .bottom) {
                HStack{
                    Button(action:{
                        withAnimation {
                            //1. Para cambiar a una perspectiva en 3D deberemos cambiar el item a .camera y configurar el objeto MapCamera pasandole el centro de cordinacion a la ciudad de towerbridge, configuramos la distancia, la inclinacion tanto para el heading pitch
                            self.position = .camera(MapCamera(centerCoordinate: .towerbridge, distance: 800, heading: 90, pitch: 40))
                        }
                    }) {
                        Text("Puente de la Torre")
                    }
                    .tint(.teal)
                    .buttonStyle(.borderedProminent)
                    
                    Button(action: {
                        withAnimation {
                            //2. Lo configuramos aca tambien
                            self.position = .camera(MapCamera(centerCoordinate: .bigben, distance: 500, heading: 150, pitch: 70))
                            //3. Ahora podemos alterar en ambos botones para ver la vista del cambio en 3D
                        }
                    }, label: {
                        Text("Big Ben")
                    })
                    .tint(.teal)
                    .buttonStyle(.borderedProminent)
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
