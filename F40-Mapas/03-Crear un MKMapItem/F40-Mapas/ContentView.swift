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
    
    @State private var searchResults: [MKMapItem] = []
    
    var body: some View {
        //3. Esta la podemos eliminar
        /*Map(initialPosition: .region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -33.06, longitude: -71.62),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))))
       */
        //4. Ahora el initialPosition en vez de ser una region, lo pasaremos como items, que vendra recibido por MKMapItem, el cual le pasamos un unicializador con la ciudad creada
        Map(initialPosition: .item(MKMapItem(placemark: .init(coordinate: .valparaiso))))
    }
}

#Preview {
    ContentView()
}


//1. Podemos trabajar con las cordenas aparte a travez de una extencion de la clase CLLocationCoordinate2D
extension CLLocationCoordinate2D {
    //2. Crearemos 4 localidades
    static let valparaiso = CLLocationCoordinate2D(latitude: -33.044, longitude: -71.62)
    
    static let manhattan = CLLocationCoordinate2D(latitude: 40.75, longitude: -73.98)
    
    static let bigben = CLLocationCoordinate2D(latitude: 51.501, longitude: -0.1245)
    
    static let towerbridge = CLLocationCoordinate2D(latitude: 51.5055, longitude: -0.0754)
}
