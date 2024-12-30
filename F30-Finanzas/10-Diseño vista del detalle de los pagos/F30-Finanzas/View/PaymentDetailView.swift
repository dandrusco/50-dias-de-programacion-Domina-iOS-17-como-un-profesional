//
//  PaymentDetailView.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 30-12-24.
//

import SwiftUI

struct PaymentDetailView: View {
    //18. Creamos una constante privada viewModel de tipo PaymentDetailViewModel
    private let viewModel: PaymentDetailViewModel
    //19. Creamos una constante privada para los pagos
    private let payment: PaymentRecord
    
    //20. Crearemos un inicializador pasandole el pago PaymentRecord
    init(payment: PaymentRecord) {
        //21. el viewModel sera de tipo PaymentDetailViewModel pasandole el payment
        self.viewModel = PaymentDetailViewModel(payment: payment)
        //22. el payment sera igual al payment
        self.payment = payment
    }
    
    //23. Nos vamoa a ir al F30_FinanzasApp para solucionar un error del contenedor (fallo en ios17)
    var body: some View {
        //30. diseñaremos el body, le metemos una VStack
        VStack{
            //50. Cargamos el titulo pasandole el propio viewModel
            TitleView(viewModel: self.viewModel)
                .padding(.top, 16)
            //31. Cargamos la imagen y le meteremos una linea divisoria con pading en horizontal
            Image(self.viewModel.image)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity)
            Divider()
                .padding(.horizontal)
            
            //32. Diseñaremos los registros del pago dentro de una  HStack
            HStack(alignment: .top, content: {
                //33. El primer contenido lo dividimos en una VStack
                VStack(alignment: .leading, spacing: 4, content: {
                    //34. Le ponemos el nombre
                    Text(self.viewModel.name)
                        .font(.system(.headline))
                        .fontWeight(.bold)
                    //35. Le ponemos la fecha
                    Text(self.viewModel.date)
                        .font(.system(.subheadline))
                        .fontWeight(.semibold)
                        .foregroundStyle(.teal)
                    //36. Le ponemos la locacion
                    Text(self.viewModel.location)
                        .font(.system(.subheadline))
                        .fontWeight(.semibold)
                        .foregroundStyle(.teal)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                })
                //37. Le metemos un pading horizontal
                .padding(.horizontal)
                //38. Metemos un spacer para separarlo de la 2 VStack
                Spacer()
                //39. Creamos la VStack para el valor
                VStack(alignment: .trailing, content: {
                    Text(self.viewModel.amount)
                        .font(.title)
                        .fontWeight(.bold)
                })
                //40. Le metemos un pading a la derecha
                .padding(.trailing)
            })
            //41. Le metemos un pafing vertical
            .padding(.vertical)
            //42. Creamos una barra divisoria de color teal con pading horizontal
            Divider()
                .foregroundStyle(.teal)
                .padding(.horizontal)
            
            //43. SI hay notas....
            if self.viewModel.notes != "" {
                //44. Creamos un grupo con un texto que diga Notas
                Group{
                    Text("Notas")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                    //45. Metemos las notas actuales
                    Text(self.viewModel.notes)
                        .font(.caption)
                    //45. Creamos otra divicion
                    Divider()
                }
                //46 Condifuramos el fram alineado a la izquierda con pading horizontal
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
            //47. Tiramos las notas hacia arriba
            Spacer()
        }
    }
}

#Preview {
    //23.. Devemos crear la preview simulando un pago
    PaymentDetailView(payment:  PaymentRecord(date: Date.today, name: "Curso de iOS 17", location: "Web de Frogames", amount: 99.99, notes: "En un lugar de la maancha", type: .expense))
}

//48. Creamos una estructura para la barra de titulo
struct TitleView: View {
    //49. creamos una variable viewModel de tipo PaymentDetailViewModel
    var viewModel: PaymentDetailViewModel
    
    var body: some View {
        //51. creamos una Hstack
        HStack{
            //52. Creamos el titulo
            Text("Detalles del Registro")
                .font(.title)
                .fontWeight(.bold)
                //53. Si es .expense lo pintamos de Expense, de lo contrario  como Income
                .foregroundStyle(self.viewModel.payment.type == .expense ? Color("Expense") : Color("Income"))
            //54. Ponemos la imagen, su es .expense ponemos el color Expense, de lo contrario Income
            Image(systemName: self.viewModel.typeIcon)
                .foregroundStyle(self.viewModel.payment.type == .expense ? Color("Expense") : Color("Income"))
            
        }
        //55. le metemos un pading de 16
        .padding(16)
    }
}
