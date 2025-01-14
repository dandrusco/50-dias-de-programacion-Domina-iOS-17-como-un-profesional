//
//  ContentView.swift
//  F41-Previews
//
//  Created by Danilo Andrusco on 14-01-25.
//

import SwiftUI

struct ContentView: View {
    
    var imageName = "globe"
    
    var body: some View {
        VStack {
            Image(systemName: self.imageName)
                .font(.title)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview("Vertical"){
    ContentView(imageName: "iphone")
}

#Preview("Horizontal", traits: .landscapeLeft) {
    ContentView(imageName: "ipad")
}

#Preview("Elimina el dispositivo", traits: .sizeThatFitsLayout){
    ContentView(imageName: "applewatch")
}

#Preview("Fixed Layout", traits: .fixedLayout(width: 500, height: 250)){
    ContentView(imageName: "magicmouse")
}

//1. Para los controladores de UIKit tambien podemos implementar las preview
#Preview("VC"){
    //2. Debemos instancial a UIViewController
    var vc = UIViewController()
    //3. Y lo devolvemos
    return vc
    //4. Por logica no nos mostrara nada ya que no hemos programado en UIKit
}

//5. Tambien lo podemos implementar en el antiguo Storyboard
#Preview("From Storyboard"){
    //6. instanciamos la clase UIStoryboard pasandole el Main y si no tenemos empaquetados utilizamos nil
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //7. Extraemos el controlador
    var vc = storyboard.instantiateViewController(withIdentifier: "XXXViewController")
    //8. devolvemos el ViewController"
    return vc
    //9. Si lo seleccionamos nos dara error ya que tampoco lo hemos implementado 
}

struct ContentViewOld: PreviewProvider{
    static var previews: some View {
        Group{
            Group{
                ContentView(imageName: "macbook")
                    .previewDisplayName("Old 1")
                
                ContentView(imageName: "desktopcomputer")
                    .previewDisplayName("Old 2")
            }
        }
    }
}
