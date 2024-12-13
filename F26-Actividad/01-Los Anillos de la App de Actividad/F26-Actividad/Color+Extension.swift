//
//  Color+Extension.swift
//  F26-Actividad
//
//  Created by Danilo Andrusco on 13-12-24.
//

import SwiftUI

//3. Programaremos la extencion llamada Color
extension Color {
    //4. Creamos un inicializador, tanto para el color rojo, verde, azul, y en alpha la ocuparemos para la opacidad
    public init(red: Int, green: Int, blue: Int, alpha: Double = 1.0){
        //5. Por que es importante inicializarlo, para poder dividir cada color por 255 solo una vez
        let redVal = Double(red) / 255.0
        let greenVal = Double(green) / 255.0
        let blueVal = Double(blue) / 255.0
        //6. Ahora la propio init de la clase le pasaremos cada color con la opacidad
        self.init(red: redVal, green: greenVal, blue: blueVal, opacity: alpha)
    }
    
    //7. Comenzaremos a declarar colores estaticos en la version clara como en la oscura, tanto para rojo, verde, azul, purpura y amarillo
    public static let lightRed = Color(red: 230, green: 75, blue: 60)
    public static let darkRed  = Color(red: 190, green: 60, blue: 40)
    
    public static let lightGreen = Color(red: 50, green: 210, blue: 110)
    public static let darkGreen  = Color(red: 35, green: 175, blue: 95)
    
    public static let lightBlue = Color(red: 50, green: 150, blue: 220)
    public static let darkBlue  = Color(red: 35, green: 130, blue: 185)

    public static let lightPurple = Color(red: 150, green: 90, blue: 180)
    public static let darkPurple  = Color(red: 140, green: 70, blue: 170)

    public static let lightOrange = Color(red: 230, green: 130, blue: 30)
    public static let darkOrange  = Color(red: 210, green:  90, blue: 10)
    
    public static let lightYellow = Color(red: 240, green: 150, blue: 20)
    public static let darkYellow  = Color(red: 230, green: 130, blue: 10)
    //8. Pondremos un colos adicional para el color de fondo
    public static let bgColor = Color(red: 70, green: 60, blue: 200)
    //9. Ahora nos vamos a la ProgressRing
}

