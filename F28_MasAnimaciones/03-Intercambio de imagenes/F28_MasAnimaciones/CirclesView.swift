//
//  CirclesView.swift
//  F28_MasAnimaciones
//
//  Created by Danilo Andrusco on 18-12-24.
//


import SwiftUI

struct CirclesView: View {
    
    @State private var swap = false
    @Namespace private var circleTransition
    
    
    var body: some View {
        
        if self.swap{
            VStack{
                Circle()
                    .fill(.purple)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "purpleCircle", in: self.circleTransition)
                Spacer()
                Circle()
                    .fill(.orange)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "orangeCircle", in: self.circleTransition)

            }
            .frame(width: 300)
            .onTapGesture {
                withAnimation {
                    self.swap.toggle()
                }
            }
            
        }else {
            VStack{
                
                Circle()
                    .fill(.orange)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "orangeCircle", in: self.circleTransition)
                
                Spacer()
                
                Circle()
                    .fill(.purple)
                    .frame(width: 80, height: 80)
                    .matchedGeometryEffect(id: "purpleCircle", in: self.circleTransition)
                
                

            }
            .frame(width: 300)
            .onTapGesture {
                withAnimation {
                    self.swap.toggle()
                }
            }
        }
    
    }
}

#Preview {
    CirclesView()
}

//1. Tomaremos la imagen de F9 Listas, tanto la de ios10 y la de probabilidad y la arrastraremos al Assets
//2. Creamos una nueva structura para las imagenes
struct SwapPictures: View {
    
    //4. Necesitoamos la variable de estado y la de @Namespace
    @State private var swap = false
    @Namespace private var pictureTransition
    
    var body: some View {
        
        //5. Si swap es true...
        if self.swap{
            //6. Metemos una VStack
            VStack{
                //7. Cargamos la primera imagen
                Image("ios10")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 250)
                    .matchedGeometryEffect(id: "im1", in: self.pictureTransition)
                    .clipped()
                //8. Pondremos unas flechas para arriba y para abajo, quien sera la encargada de crear el intercambop
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 60))
                    .onTapGesture {
                        withAnimation(.bouncy){
                            self.swap.toggle()
                        }
                    }
                //9. Ponemos la otra imagen
                Image("matematicas-probabilidad-ml-r-python")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 250)
                    .matchedGeometryEffect(id: "im2", in: self.pictureTransition)
                    .clipped()
                
            }
            
        }
        //10. Si swap es false intercambiamos las imagenes...
        else{
            VStack{
                
            Image("matematicas-probabilidad-ml-r-python")
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 250)
                .matchedGeometryEffect(id: "im2", in: self.pictureTransition)
                .clipped()
                
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 60))
                    .onTapGesture {
                        withAnimation(.bouncy){
                            self.swap.toggle()
                        }
                    }
                
                Image("ios10")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 250)
                    .matchedGeometryEffect(id: "im1", in: self.pictureTransition)
                    .clipped()
                
            }
        }
        
        
    }
}

//3. Creamos la preview
#Preview("SwapPictures"){
    SwapPictures()
}
