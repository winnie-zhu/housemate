//
//  ContentView.swift
//  HouseMate
//
//  Created by Winnie Zhu on 12/1/22.
//

import SwiftUI

struct ContentView: View {
    @State private var waitlistPlace: Double = 0
    @State private var classSize: Double = 0
    @State private var calculate = false
    @State var probability = 0
    @State var text = ""
    
    
    
    var body: some View {
        //YOUR CODE HERE (NavView)//
        NavigationView() {
            //YOUR CODE HERE (TabView)//
            TabView() {
                
                ZStack {
                    Color(red: 0.984, green: 0.945, blue: 0.914)
                        .ignoresSafeArea()
                        
                    VStack {
                        // VStack holds max of 10 elem, if too much, group them
                        Group {
                            Image("house")
                                .resizable()
                                .frame(width: 100, height: 100)
                            //YOUR CODE HERE (title)//
                            Text("**HouseMate**")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding(.top, 10)
                            
                            HStack {
                                //YOUR CODE HERE (description)//
                                
                                Spacer()
                            }
                        }
                        //YOUR CODE HERE (slider)//
                        Text("Username").padding()
                        
                        Text("")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 300, height: 30)
                            .background(Rectangle().fill(Color.pink.opacity(0.25)).shadow(radius: 3))
                        
                        Text("Password").padding()
                        
                        Text("")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 300, height: 30)
                            .background(Rectangle().fill(Color.pink.opacity(0.25)).shadow(radius: 3))
                        
                        
                        HStack {
                            //YOUR CODE HERE (description)//
                            
                            Spacer()
                        }
                        //YOUR CODE HERE (slider)//
                        
                        NavigationLink(destination: ResultView(prob: $probability, feedback: $text), isActive: $calculate) { EmptyView() } .padding()
                        
                        Button("Log In") {
                            calculate = true
                        }
                        Button("Create Account") {
                            
                        }
                        
                        Spacer()
                        
                    } .padding()
        
                  
    
                    
                }
                .navigationBarTitle("HOME")
                .navigationBarHidden(true)
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                
                //DIY VIEW GOES HERE//
                
                ZStack {
                    Image("calculate_background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    VStack {
                        HStack {
                            Text("MY \nCLASSES")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(Color.black)
                                .padding()
                            Spacer()
                        } .padding()
                        
                        Spacer()
                    }
                    
                }
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
            }
        }
        
}
    
    
}

struct ResultView: View {
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    @Binding var prob: Int
    @Binding var feedback: String
    
    var residents = [
        Items(imageName: "person1", personName: "Person 1"),
        Items(imageName: "person2", personName: "Person 2"),
        Items(imageName: "person3", personName: "Person 3")
        
    ]
    
    var body: some View {
        
        ZStack {
            Color(red: 0.984, green: 0.945, blue: 0.914)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    //YOUR CODE HERE (button back)//
                    Button(
                        action: {
                            self.presentation.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.left")
                                .foregroundColor(.black)
                        }
                        .navigationBarHidden(true)
                    
                    Spacer()
                } .padding()
                Spacer()
                Text("Residents")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)

                    List {
                        ForEach(residents) { listItem in
                            CustomCell(imageName: listItem.imageName, personName: listItem.personName)
                        }
                    }
                    
                    
                    Spacer()
                    Spacer()

            }
            
        }
    }
    
    class Items : Identifiable {
        let imageName: String
        let personName: String
        
        init(imageName: String, personName: String) {
            self.imageName = imageName
            self.personName = personName
        }
    }
    
    // https://www.fivestars.blog/articles/custom-view-styles/
    struct CustomButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
            //YOUR CODE HERE (button style)//
                .font(.title3)
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).strokeBorder().foregroundColor(Color.blue))
            
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
