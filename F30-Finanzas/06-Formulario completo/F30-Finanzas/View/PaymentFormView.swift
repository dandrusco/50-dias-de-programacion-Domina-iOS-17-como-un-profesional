//
//  PaymentFormView.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 23-12-24.
//



import SwiftUI

struct PaymentFormView: View {
    
    //8. Para cerrar la ventana necesitamos una @Environment(\.dismiss)
    @Environment(\.dismiss) var dismiss
    
    //1. Vamos a necesitar un pago pero de tipo opcional
    var payment: PaymentRecord?
    
    //2. Crearemos un init, para inicializar el PaymentRecord si es que disponemos de el
    init(payment: PaymentRecord? = nil) {
        self.payment = payment
    }
    
    var body: some View {
        //3 Creamos una ScrollView
        ScrollView{
            //4. creamos una VStack con espaciado 0
            VStack(spacing: 0, content: {
                //5. Creamos el Título
                HStack(alignment: .lastTextBaseline, content: {
                    Text("Nuevo Registro")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .padding(.bottom)
                    //6. Lo mandamos para arriba
                    Spacer()
                    //7. Cremamos un boton para cerrar
                    Button(action: {
                        //9. La llamamos en la accion
                        dismiss()
                    }, label: {
                        //10. Ponemos la imagen
                        Image(systemName: "multiply")
                            .font(.title)
                            .foregroundStyle(.teal)
                    })
                })
                
                //11. Creamos el Tipo de Registro en una VStack
                VStack(alignment: .leading, content: {
                    //12. metemos el texto
                    Text("Tipo de Registro")
                        .font(.system(.subheadline, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .padding(.vertical, 12)
                    //13. Creamos una HStack para meter un boton
                    HStack(spacing: 0){
                        Button(action:{
                            //TODO: Pendiente
                        }){
                            //14. Metemos el texto
                            Text("Ingreso")
                            .font(.headline)
                        }
                        //15. Creamos un frame para el boton
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .padding(.vertical, 16)
                        //16.Para el color del boton lo vamos a crear en el Assets, y creamos un color set, llamado Income y su tonalidad sera verde
                        //17. Prepararemos otro llamado Expense, con tonalidad roja
                        
                        //18. Ahora realizaremos lo mismo para el gasto
                        Button(action:{
                            //TODO: Pendiente
                        }){
                            Text("Gasto")
                            .font(.headline)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .padding(.vertical, 16)
                    }
                    //19. Agruparemos los botones en un border
                    .border(Color("Border"), width: 1.0)
                    
                    //20 Creamos el boton de Guardar
                    Button(action: {
                        //22. Ponemos para guardar y para cerrar
                        save()
                        dismiss()
                    }) {
                        //23. Configuramos el texto a guardar
                        Text("Guardar")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(24)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .cornerRadius(12.0)
                    }
                    //24. Le ponemos un pading al boton
                    .padding()
                })
            })
            //25. Le ponemos un pading global
            .padding()
        }
    }
    
    //21 Creamos la funcion para el guardado de datos
    private func save(){
        //TODO: Pendiente
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
