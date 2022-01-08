//
// ContentView.swift
// C19SwiftUI
//
// Created by Shreyas Vilaschandra Bhike on 05/01/22.
// Instagram:TheAppWizard
// MARK: theappwizard2408

import SwiftUI

struct ContentView: View {
    @State var splashScreen  = true

    var body: some View {
         ZStack{
            Group{
              if splashScreen {
                  SplashScreen()
               }
              else{
                  MainView()
                    }
                }
               .onAppear {
                  DispatchQueue
                       .main
                       .asyncAfter(deadline:
                        .now() + 3) {
                   self.splashScreen = false
                  }
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


