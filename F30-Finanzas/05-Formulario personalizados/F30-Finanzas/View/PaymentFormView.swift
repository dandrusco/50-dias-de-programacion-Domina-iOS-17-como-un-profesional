//
//  PaymentFormView.swift
//  F30-Finanzas
//
//  Created by Danilo Andrusco on 23-12-24.
//


import SwiftUI

struct PaymentFormView: View {
    
    var body: some View {
        Text("Hello, Word!")
    }
}

#Preview {
    PaymentFormView()
}


//2. comenzaremos a crear la estructura para el formulario
struct FormTextField: View {
    
    //3. Necesitamos un nombre y un placeholder
    let name: String
    var placeholder: String
    
    //4. Vamos bindear el valor interno
    @Binding var value: String
    
    var body: some View {
        //5. Creamos una VStack alineado a la izquierda
        VStack(alignment: .leading, content: {
            //6. El contenido sera texto, todo en mayuzcula
            Text(self.name.uppercased())
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .foregroundStyle(.primary)
            //7. Y creamos un TextField para el placeholder y el valor bindeado de value es donde se ira almacenando lo teclaado en la caja de texto
            TextField(self.placeholder, text: self.$value)
                .font(.headline)
                .foregroundStyle(.primary)
                .padding()
            //8. en la propia Assets abajo del todo aparece un signo mas y un signo menos, le daremos en el signo mas y seleccionaremos el Color set, lo llamaremos Border
            //9. Seleccionamos el Any Apparence y en el menu derecho jugamos con Red, Green , Blue y la opacidad
            //10. Ahora llamamos a .border, y en el color, ponemos el que creamos con anchura 1.0
                .border(Color("Border"), width: 1.0)
        })
    }
}

//9. Creamos la preview
#Preview ("Campo de Texto"){
    FormTextField(name: "Test", placeholder: "Introduce tu valor", value: .constant(""))
}


//11. Copiamos la estructura FormTextField y la pegamos aca, obviamente cambiandole el nombre a FormDateField
struct FormDateField: View {
    
    let name: String
    //12. No necesitamos el var placeholder: String
    /*var placeholder: String*/
    
    //13. El value sera tipo fecha
    @Binding var value: Date
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(self.name.uppercased())
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .foregroundStyle(.primary)
            
            //14. En lugar de una TextField sera una DatePicker, con un string vacio, el valor bindeado se llama selection y el displayedComponents sera de la fecha
            DatePicker("", selection: self.$value, displayedComponents: .date)
            //15. En vez de font sera accentColor
                .accentColor(.primary)
                .padding()
                .border(Color("Border"), width: 1.0)
            //16. Para eliminar las etiquetas utilizamos labelsHidden
                .labelsHidden()
        })
    }
}

//17. Creamos otra Preview
#Preview ("Campo de Fecha"){
    FormDateField(name: "Fecha", value: .constant(Date()))
}

//18. Volvemos a copiar la estructura FormTextField y la pegamos aca, cambiandole el nombre a FormTextEditor
struct FormTextEditor: View {
    
    let name: String
    //19. En lugar del placeholder pondremos una altura
    var height: CGFloat = 100.0
    
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(self.name.uppercased())
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .foregroundStyle(.primary)
            
            //20. En lugar de una TextField sera un TextEditor,bindeado a la variable value
            TextEditor(text: self.$value)
            //21. Necesitamos el fram para la altura
                .frame(minHeight: self.height)
                .font(.headline)
                .foregroundStyle(.primary)
                .padding()
                .border(Color("Border"), width: 1.0)
        })
    }
}
//22. Creamos la preview
#Preview ("Campo de Texto Largo"){
    FormTextEditor(name: "Texto", value: .constant(""))
}

//23. Creamos la validacion de los textos
struct ValidationErrorText: View {
    //23. Tendra un icono y un color asociado
    var iconName = "info.circle"
    var iconColor = Color(red: 250/255, green: 128/255, blue: 128/255)
    //24. Tendra un texto vacio
    var text = ""
    
    var body: some View {
        //25. Creamos una HStack
        HStack{
            //26. Pondremos el icono y su color
            Image(systemName: self.iconName)
                .foregroundStyle(self.iconColor)
            //27. Creamos el mensaje de error
            Text(self.text)
                .font(.system(.body, design: .rounded))
                .foregroundStyle(.secondary)
            //28. tiramos todo para arriba
            Spacer()
        }
    }
}

//29. Creamos la preview
#Preview("Error de validación"){
    ValidationErrorText(text: "El importe no puede ser negativo")
}
