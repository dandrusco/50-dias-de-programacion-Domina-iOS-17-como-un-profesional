//
//  PaymentFormView.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 23-12-24.
//

import SwiftUI

struct PaymentFormView: View {
    
    //19. Creamos una variable de entorno que tendra el modelContext para el registro de pago
    @Environment(\.modelContext) var modelContext
    
    @ObservedObject private var paymentFormVM : PaymentFormViewModel
    
    @Environment(\.dismiss) var dismiss
    
    var payment: PaymentRecord?
    
    init(payment: PaymentRecord? = nil) {
        self.payment = payment
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
                
                //22. Creamos un grupo para las validaciones
                Group{
                    //23. Si no es valido el nombre
                    if !self.paymentFormVM.isNameValid{
                        ValidationErrorText(text: "Introduce un nombre válido para el registro")
                    }
                    //24. Si la cantidad no es positiva
                    if !self.paymentFormVM.isAmountValid {
                        ValidationErrorText(text: "Introduce una cantidad positiva")
                    }
                    //25. Si las notas superan los 150 caracteres
                    if !self.paymentFormVM.isNoteValid {
                        ValidationErrorText(text: "Las notas no pueden superar los 150 caracteres")
                    }
                }
                
                //26. Creamos el campo de Nombre asociado al ViewModel asociado
                FormTextField(name: "Nombre", placeholder: "Introduce tu registro", value: self.$paymentFormVM.name)
                    .padding(.top)
                
                VStack(alignment: .leading, content: {
                    Text("Tipo de Registro")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(.vertical, 12)
                    
                    HStack(spacing: 0){
                        Button(action:{
                            //27. registramos la accion tipo ingreso
                            self.paymentFormVM.type = .income
                        }){
                            Text("Ingreso")
                            .font(.headline)
                            //28 Comprobamos si es un ingreso o gasto para cambiar el color del texto
                            .foregroundStyle(self.paymentFormVM.type == .income ? Color.white : Color.primary)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .padding(.vertical, 16)
                        //29. Creamos un nuevo color llamado NoActive que sea plomo
                        //30 Comprobamos si es un ingreso o gasto para cambiar el color del boton
                        .background(self.paymentFormVM.type == .income ?  Color("Income") : Color("NoActive"))
                        
                        
                        Button(action:{
                            //31. registramos la accion tipo gasto
                            self.paymentFormVM.type = .expense
                        }){
                            Text("Gasto")
                            .font(.headline)
                            //32. Comprobamos si es un ingreso o gasto para cambiar el color del texto
                            .foregroundStyle(self.paymentFormVM.type == .expense ? Color.white : Color.primary)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .padding(.vertical, 16)
                        //33. Comprobamos si es un ingreso o gasto para cambiar el color del boton
                        .background(self.paymentFormVM.type == .expense ? Color("Expense") : Color("NoActive"))
                    }
                    .border(Color("Border"), width: 1.0)
                    
                    
                    //34. Creamos una HStack para agrupar Fecha y Cantidad
                    HStack{
                        FormDateField(name: "Fecha", value: self.$paymentFormVM.date)
                        FormTextField(name: "Cantidad (en €)", placeholder: "0.0", value: self.$paymentFormVM.amount)
                    }
                    
                    //35. Registramos donde hemos realizado el gasto
                    FormTextField(name: "Ubicación (opcional)", placeholder: "¿Dónde fue la compra?", value: self.$paymentFormVM.location)
                    
                    //36. algunas Notas opcionales
                    FormTextEditor(name: "Notas (opcional)", value: self.$paymentFormVM.notes)
                    
                    Button(action: {
                        save()
                        dismiss()
                    }) {
                        Text("Guardar")
                            //37. Bajamos la opacidad al 50% si no es posible guardar
                            .opacity(self.paymentFormVM.isFormValid ? 1.0 : 0.5)
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(24)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            //38. Bajamos la opacidad del background al 50% si no es posible guardar
                            .background(.teal.opacity(self.paymentFormVM.isFormValid ? 1.0 : 0.5))
                            .cornerRadius(12.0)
                    }
                    //39. metemos un pading
                    .padding()
                    //40. desactivaremos el boton cuando no sea valido
                    .disabled(!self.paymentFormVM.isFormValid)
                })
            })
            .padding()
        }
    }
    
    private func save(){
        //20. Creamos una constante payment que sea igual a PaymentRecord pasandole todos los datos
        let payment = PaymentRecord(date: self.paymentFormVM.date,
                                    name: self.paymentFormVM.name,
                                    location: self.paymentFormVM.location,
                                    amount: Double(self.paymentFormVM.amount)!,
                                    notes: self.paymentFormVM.notes,
                                    type: self.paymentFormVM.type)
    
        //21. Ahora es el modelContext quien se enarga de insertar en el modelo el nuevo pago generado
        self.modelContext.insert(payment)
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