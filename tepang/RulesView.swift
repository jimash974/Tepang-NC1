//
//  RulesView.swift
//  projekdeveloper
//
//  Created by Jeremy Christopher on 20/03/23.
//

import SwiftUI

struct RulesView: View {
    @Binding var rules: Bool
    
    @Environment(\.presentationMode) var presentationMode


    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(red: 0.887, green: 0.62, blue: 0.622))
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    
                    Spacer()
                    Text("Rules & FAQ")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color.black)
                        .padding(.trailing, 20)
                    Spacer()

                }
                .padding(.top, 60)
                .padding([.leading, .trailing, .bottom], 10)
                .background(Color(hue: 0.119, saturation: 0.2, brightness: 1.0))
                
                
                VStack {
                    VStack(alignment: .leading,spacing: 15){
                        Text("What is Tepang ⁉️")
                            .font(.system(size: 20, weight: .bold))
                            
                        Text("Tepang is a game application that can help get acquainted and interact with new friends.")
                        Text("Tepang itself comes from the Javanese language \n -Krama alus which means \"get to know\" or \"introduction\"")
                    }
                    .foregroundColor(.black)
                    .padding(.top, 10)
                    
                    VStack(alignment: .leading,spacing: 15){
                        Text("How to Play 👾")
                            .font(.system(size: 20, weight: .bold))
                            
                        Text("1. Click the \"Spin Me\" button in the middle of the wheel to spin the spinning wheel ")
                        
                        Text("2. After the wheel stops, you will get a prompt")
                        
                        Text("3. Do the activity from the prompt that you got.")
                        
                        Text("4. Share your excitement of using the Tepang App, upload it to IG Story using #NewFriendsWithTepang#TepanganYuk and tagging @tepangyuk")
                        
                        Text("5. If you are lucky, come to the Tepang booth, show your experience, and get a prize")
                        
                        
                    }
                    .foregroundColor(.black)
                    .padding(.top, 20)
                }
                .padding(20)
                
                Spacer()
            }
        }
        .ignoresSafeArea(edges: .top)
        .transition(.move(edge: .leading))

    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView(rules: .constant(true))
    }
}
