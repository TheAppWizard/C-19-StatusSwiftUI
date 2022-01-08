//
//  MainView.swift
//  C19SwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 05/01/22.
//

import SwiftUI

class getData: ObservableObject {
    
    @Published var data: Country!
    
    init(country: String) {
        updateData(country: country)
    }
    
    func updateData(country: String) {
        let url = "https://corona.lmao.ninja/v3/covid-19/countries/\(country)"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "error")
                return
            }
            
            do  {
                let json = try JSONDecoder().decode(Country.self, from: data!)
                
                
                DispatchQueue.main.async {
                    self.data = json
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

func getValue(data: Double) -> String {
    let format = NumberFormatter()
    format.numberStyle = .decimal
    
    return format.string(from: NSNumber(value: data))!
}

func getImage(imageString: String) -> UIImage {
    let imageURL = URL(string: imageString)
    let imageData = try! Data(contentsOf: imageURL!)
    let image = UIImage(data: imageData)
    return image!
}




struct MainView: View {
    
    @ObservedObject var data = getData(country: "India")
    @State var country: String = "India"
    
    var body: some View {
        ZStack {
            Color.black.opacity(1).edgesIgnoringSafeArea(.all)
           
            
            if self.data.data != nil {
                
                ZStack{
                    
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
                            
                            
                        
                        ZStack{
                        HStack {
                            TextField("Enter Country Here", text: $country)
                                .foregroundColor(.white)
                                .padding(10)
                                .font(Font.system(size: 15, weight: .medium, design: .serif))
                                .frame(width: 380, height: 50)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white, lineWidth: 1))
                            Button(action:
                                { self.data.updateData(country: self.country)
                            
                        }) {
                            Image(systemName: "chevron.forward")
                                .foregroundColor(.white)
                        }
                    }.frame(width: 250).padding()
                 }
                
                VStack{
                    
                HStack{
                    
                    
               
                Image(uiImage: getImage(imageString: data.data.countryInfo.flag))
                     .resizable()
                    .frame(width: 120, height: 80, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay {
                        RoundedRectangle(cornerRadius: 12).stroke(.white, lineWidth: 2)
                                }
                
            
                    VStack{
                        Text("TOTAL CASES")
                             .font(.title3)
                             .fontWeight(.regular)
                             .foregroundColor(.white.opacity(0.5))
                            
                        Text("\(getValue(data: self.data.data.cases))")
                             .font(.title2)
                             .fontWeight(.regular)
                             .foregroundColor(.white)
                             
               
                    } .frame(width: 200, height: 160, alignment: .center)
                   
                        
                }.padding()
                .offset(x: 0, y: 20)
                    
                    
                    HStack{
                        
                        ZStack{
                          RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.green.opacity(0.1))
                                .frame(width: 200, height: 200)
                               
                    
                            
                            VStack{
                                
                                Text("RECOVERED")
                                    .font(.title3)
                                    .frame(width: 200, height: 50, alignment: .center)
                                    
                                    .foregroundColor(.green)
                                
                                Text("\(getValue(data: self.data.data.recovered))")
                                    .font(.title2)
                                    .frame(width: 200, height: 50, alignment: .center)
                                    .foregroundColor(.white)
                                            
                               
                        
                            }
                        }
                        ZStack{
                          RoundedRectangle(cornerRadius: 15)
                                .frame(width: 200, height: 200)
                                .foregroundColor(.red.opacity(0.1))
                               
                    
                            
                            VStack{
                                
                                Text("DEATHS")
                                    .font(.title3)
                                    .frame(width: 200, height: 50, alignment: .center)
                                    
                                    .foregroundColor(.red)
                                
                                Text("\(getValue(data: self.data.data.deaths))")
                                    .font(.title2)
                                    .frame(width: 200, height: 50, alignment: .center)
                                    .foregroundColor(.white)
                                            
                               
                        
                            }
                        }
                        
                        
                       
                    }.padding(2)
                    
                    
                    HStack{
                     
                        
                        
                        ZStack{
                          RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.yellow.opacity(0.1))
                                .frame(width: 200, height: 200)
                             
                            
                            VStack{
                                
                                Text("ACTIVE")
                                    .font(.title3)
                                    .frame(width: 200, height: 50, alignment: .center)
                                    
                                    .foregroundColor(.yellow)
                                
                                Text("\(getValue(data: self.data.data.active))")
                                    .font(.title2)
                                    .frame(width: 200, height: 50, alignment: .center)
                                    .foregroundColor(.white)
                                            
                               
                        
                            }
                        }
                        
                        ZStack{
                          RoundedRectangle(cornerRadius: 15)
                                .frame(width: 200, height: 200)
                                .foregroundColor(.blue.opacity(0.1))
                                
                    
                            
                            VStack{
                                
                                Text("POPULATION")
                                    .font(.title3)
                                    .frame(width: 200, height: 50, alignment: .center)
                                    
                                    .foregroundColor(.blue)
                                
                                Text("\(getValue(data: self.data.data.population))")
                                    .font(.title2)
                                    .frame(width: 200, height: 50, alignment: .center)
                                    .foregroundColor(.white)
                                            
                               
                        
                            }
                        }
                    }.padding(2)
                    
                    
                    
                    
                        
              
                }.offset(x: 0, y: -50)
            }
            
        }
       }
    }
  }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
