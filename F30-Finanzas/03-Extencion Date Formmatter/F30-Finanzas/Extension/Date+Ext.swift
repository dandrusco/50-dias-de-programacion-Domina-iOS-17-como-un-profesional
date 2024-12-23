//
//  Date+Ext.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 23-12-24.
//
import Foundation

//2. Creamos la extencion Date
extension Date {
    //3. Creamos una variable estatica del dia de hoy
    static var today: Date {
        return Date()
    }
    
    //3. Creamos una variable estatica del dia de ayer
    static var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    }
    
    //4. Creamos una variable estatica del dia de mañana
    static var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value:  1, to: Date())!
    }
    
    //5. creamos una variable para obtener el dia
    var day : Int {
        return Calendar.current.component(.day, from: self)
    }
    
    //6. creamos una variable para obtener el mes
    var month : Int {
        return Calendar.current.component(.month, from: self)
    }
    
    //7. creamos una variable para obtener el año
    var year : Int {
        return Calendar.current.component(.year, from: self)
    }
    
    //8. Creamoa una funcion estatica para crear la fecha de tipo string Año - mes - dia
    static func fromString(string: String, with format: String = "yyyy-MM-dd") -> Date?{
        //9. Creamos la fecha formateada
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: string)
    }
    
    //10. Y al revez si tenemos el String de dia - mes . año
    func string(with format: String = "dd MMM yyyy") -> String {
        //11. Formateamo la fecha
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
