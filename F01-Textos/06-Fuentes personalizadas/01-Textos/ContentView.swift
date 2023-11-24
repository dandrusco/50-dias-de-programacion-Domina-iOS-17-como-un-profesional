//
//  ContentView.swift
//  01-Textos
//
//  Created by Danilo Andrusco on 23-11-23.
//


//1 Para agregar fuentes personalizadas, lo primero es descargarla de internet (link en carpeta de recuersos) 
//2. Crearemos un nuevo grupo que llamaremos Fonts
//3. Las fuentes las arrastramos dentro de la carpeta recientemente creada
//4. Nos preguntara y deberemos marcar tanto la opcion de COPY ITEMS IF NEEDED y la de Add to targegts
//5. Seleccionaremos el primer archivo, el de color azul llamado 01-Textos
//6. Ahora seleccioaremos el 01-Textos pero en el TARGETS
//7. Ahora seleccionaremos la pestaña info
//8. Nos fijamos en el apartado llamado Custom iOS Target Properties
//9. En cualquiera de las que ya estan cradas le daremos en el +
//10. buscaremos y seleccionaremos Fonts provided by application
//11. Ahora seleccionaremos la flecha y cambiaremos el Item 0 añadiremos la primera fuentes, para ello deberemos cambiar el Value por el nombre de la fuente tanto
//12. Ahora en el item 0 le daremos en mas para agregar items 1 y le cambiaremos el value por la segunda fuente
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("**Esto es un texto en negrita.** *Esto es un texto en cursiva* Podemos añadir un [link a un sitio web](http://www.tectroya.cl)")
            //13. Ahora añadiremos la fuente personalizada (.custom), en nuestro caso Poppins con tamaño 20
            .font(.custom("Poppins", size: 20))
            .foregroundStyle(.purple)
            .multilineTextAlignment(.center)
            .lineLimit(3)
            .truncationMode(.head)
            .lineSpacing(12)
            .padding(40)
            .rotation3DEffect(
                .degrees(30),
                axis: (x: 1, y: 0, z: 0.0)
            )
            .shadow(color: .gray, radius: 3, x:0, y:30)
    }
}

#Preview {
    ContentView()
}
