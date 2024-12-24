//
//  PaymentFormView.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 23-12-24.
//

//1. Creamos un nuevo fichoro de Swift File llamado PaymentFormViewModel y lo guardaremos en la carpeta ViewModel

import SwiftUI

struct PaymentFormView: View {
    
    //10. LLamamos al @ObservedObject para crear esta variable privada llamada paymentFormVM que sea del tipo PaymentFormViewModel
    @ObservedObject private var paymentFormVM : PaymentFormViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var payment: PaymentRecord?
    
    init(payment: PaymentRecord? = nil) {
        self.payment = payment
        //11. Aqui nos da un error por que el init debe ser inicializado con todas las variables, nos vamos a la PaymentFormViewModel para solucionarlo
        //18. Lo inicializamos para refrescar ek view model con el registro recibido
        self.paymentFormVM = PaymentFormViewModel(payment: payment)
    }
    
    var body: some View {
        ScrollView{
            VStack(spacing: 0, content: {
                HStack(alignment: .lastTextBaseline, content: {
                    Text("Nuevo Registro")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "multiply")
                            .font(.title)
                            .foregroundStyle(.teal)
                    })
                })
                
                VStack(alignment: .leading, content: {
                    Text("Tipo de Registro")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(.vertical, 12)
                    
                    HStack(spacing: 0){
                        Button(action:{
                            //TODO: Falta esto
                        }){
                            Text("Ingreso")
                            .font(.headline)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .padding(.vertical, 16)
                        
                        Button(action:{
                            //TODO: Falta esto
                        }){
                            Text("Gasto")
                            .font(.headline)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .padding(.vertical, 16)
                    }
                    .border(Color("Border"), width: 1.0)
                    
                    Button(action: {
                        save()
                        dismiss()
                    }) {
                        Text("Guardar")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(24)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .cornerRadius(12.0)
                    }
                    .padding()
                })
            })
            .padding()
        }
    }
    
    private func save(){
        //TODO: Falta esto
    }
}

#Preview {
    PaymentFormView()
}


struct FormTextField: View {
    
    let name: String
    var placeholder: String
    
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(self.name.uppercased())
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .foregroundStyle(.primary)
            TextField(self.placeholder, text: self.$value)
                .font(.headline)
                .foregroundStyle(.primary)
                .padding()
                .border(Color("Border"), width: 1.0)
        })
    }
}

#Preview ("Campo de Texto"){
    FormTextField(name: "Test", placeholder: "Introduce tu valor", value: .constant(""))
}

struct FormDateField: View {
    
    let name: String
    
    @Binding var value: Date
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(self.name.uppercased())
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .foregroundStyle(.primary)
            DatePicker("", selection: self.$value, displayedComponents: .date)
                .accentColor(.primary)
                .padding()
                .border(Color("Border"), width: 1.0)
                .labelsHidden()
        })
    }
}

#Preview ("Campo de Fecha"){
    FormDateField(name: "Fecha", value: .constant(Date()))
}

struct FormTextEditor: View {
    
    let name: String
    var height: CGFloat = 100.0
    
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(self.name.uppercased())
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .foregroundStyle(.primary)
            TextEditor(text: self.$value)
                .frame(minHeight: self.height)
                .font(.headline)
                .foregroundStyle(.primary)
                .padding()
                .border(Color("Border"), width: 1.0)
        })
    }
}

#Preview ("Campo de Texto Largo"){
    FormTextEditor(name: "Texto", value: .constant(""))
}

struct ValidationErrorText: View {
    var iconName = "info.circle"
    var iconColor = Color(red: 250/255, green: 128/255, blue: 128/255)
    
    var text = ""
    
    var body: some View {
        HStack{
            Image(systemName: self.iconName)
                .foregroundStyle(self.iconColor)
            Text(self.text)
                .font(.system(.body, design: .rounded))
                .foregroundStyle(.secondary)
            Spacer()
        }
    }
}

#Preview("Error de validación"){
    ValidationErrorText(text: "El importe no puede ser negativo")
}
