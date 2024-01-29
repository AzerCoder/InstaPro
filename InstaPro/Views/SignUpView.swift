//
//  SignUpView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 29/01/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentation
    @State var fullname = ""
    @State var pasword2 = ""
    @State var email = ""
    @State var pasword = ""
    @State var ispresented = false
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Utills.color1, Utills.color2]), startPoint: .top, endPoint: .bottom)
                VStack(spacing:10){
                    Spacer()
                    Text("app_name").foregroundColor(.white)
                        .font(Font.custom("Billabong", size: 35))
                    
                    TextField("fullname", text: $fullname)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(.white.opacity(0.5))
                        .cornerRadius(10)
                    TextField("email", text: $email)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(.white.opacity(0.5))
                        .cornerRadius(10)
                    SecureField("password", text: $pasword)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(.white.opacity(0.5))
                        .cornerRadius(10)
                    SecureField("password2", text: $pasword2)
                        .frame(height: 50)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .background(.white.opacity(0.5))
                        .cornerRadius(10)
                    Button(action: {
                        
                    }, label: {
                        Text("sign_up")
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
                            Text("already_have_account")
                                .foregroundColor(.white)
                            Button(action: {
                                self.presentation.wrappedValue.dismiss()
                            }, label: {
                                Text("sign_in")
                                    .foregroundColor(.white)
                                    .bold()
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
    SignUpView()
}
