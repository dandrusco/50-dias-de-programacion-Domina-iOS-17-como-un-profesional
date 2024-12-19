//
//  NumberFormatter+Ext.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 19-12-24.
//


import Foundation

//2. Creamos la extension
extension NumberFormatter{
    //3. Y por que lo queremos extender? por que crearemos un metodo estatico para las divisas, donde le pasaremos un valor Double y nos devolvera un String
    static func currency(from value: Double) -> String {
        //4. Creamos la variable que sera igual a NumberFormatter()
        let formatter = NumberFormatter()
        //5. el formatter ocupara el punto decimal
        formatter.numberStyle = .decimal
        //6. le pasaremos un 2 digitos
        formatter.minimumFractionDigits = 2
        //7. EL valor formateado sera igual al string de NSNumber, dado por el valor recivido por parametro de la funcion, y si no exite lo igualamos a 0.00
        let formattedValue = formatter.string(from: NSNumber(value: value)) ?? "0.00"
        
        //8. Devolvemos el valor anteponiendo la moneda
        return "USD " + formattedValue
    }
}
