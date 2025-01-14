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
        Map(position: self.$position) {
            //1. EN lugar del Market podemos incluir anotaciones
            /*Marker("Recoge tu pedido aquí: ",
                   systemImage: "gift",
                   coordinate: .towerbridge)
            .tint(.teal)*/
            
            //2. En la anotacion lleva el texto, la coordenada y el anchor es de donde queremos que muestre la informacion
            Annotation("Tu conductor te espera aquí",
                       coordinate: .towerbridge,
                       anchor: .bottom){
                //3. Entre los {} podemos agregar una Zstack para aplilar mas cosas
                ZStack{
                    //4. Pintaremos un circulo con opacidad y tamaño
                    Circle()
                        .foregroundStyle(.indigo.opacity(0.5))
                        .frame(width: 75, height: 75)
                    
                    //5. Pondremos una imagen de un auto
                    Image(systemName: "car.rear.waves.up")
                        //6. Con symbolEffect podemos haer que el color varie, esto creara un efecto que el icono se este moviendo
                        .symbolEffect(.variableColor)
                        //7. Le metemos un pading y un foregroundStyle de color blanco
                        .padding()
                        .foregroundStyle(.white)
                        //8. El background sera de color indigo y lo pintaremos en forma de circulo
                        .background(.indigo)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
            }
        }
        //9. Podemos modificar el estilo de los mapas, por dejecto esta el estandar, imagery que es con fotos, el hibrido y el realista el cual debe ir dentro del parametro imagery
        .mapStyle(.imagery(elevation: .realistic))
        
            .onAppear{
                self.position = .item(MKMapItem(placemark: .init(coordinate: .towerbridge)))
            }
            .safeAreaInset(edge: .bottom) {
                HStack{
                    Button(action:{
                        withAnimation {
                            self.position = .camera(MapCamera(centerCoordinate: .towerbridge, distance: 800, heading: 90, pitch: 40))
                        }
                    }) {
                        Text("Puente de la Torre")
                    }
                    .tint(.teal)
                    .buttonStyle(.borderedProminent)
                    
                    Button(action: {
                        withAnimation {
                            self.position = .camera(MapCamera(centerCoordinate: .bigben, distance: 500, heading: 150, pitch: 70))
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
