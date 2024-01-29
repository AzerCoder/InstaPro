//
//  SignInView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 29/01/24.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var pasword = ""
    @State var ispresented = false
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Utills.color1, Utills.color2]), startPoint: .top, endPoint: .bottom)
                VStack(spacing:10){
                    Spacer()
                    Text("Instagram").foregroundColor(.white)
                        .font(.system(size: 32))
                    TextField("Email:", text: $email)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(.white.opacity(0.5))
                        .cornerRadius(10)
                    SecureField("Pasword:", text: $pasword)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(.white.opacity(0.5))
                        .cornerRadius(10)
                    Button(action: {
                        
                    }, label: {
                        Text("Sign In")
                            .frame(width:360,height: 50)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1.5)
                                    .foregroundColor(.white.opacity(0.5))
                            )
                    })
                    Spacer()
                    VStack{
                        HStack{
                            Text("Don't have an account?")
                                .foregroundColor(.white)
                            Button(action: {
                                ispresented = true
                            }, label: {
                                Text("Sign Up")
                                    .foregroundColor(.white)
                                    .bold()
                            })
                            .sheet(isPresented:$ispresented, content: {
                                SignUpView()
                            })
                        }
                        
                    }.frame(maxWidth:.infinity, maxHeight: 70)
                }.padding()
               
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    SignInView()
}
