//
//  SplashScreen.swift
//  C19SwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 05/01/22.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                
                
                HStack{
                Text("C- 19")
                    .font(.system(size: 50))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Text("STATUS")
                        .font(.system(size: 30))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .offset(x: 0, y: 8)
                    
                }.padding(20)
                    .offset(x: -80, y: 0)
                    
                GraphView()
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
