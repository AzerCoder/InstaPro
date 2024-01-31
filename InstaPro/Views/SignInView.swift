//
//  SignInView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 29/01/24.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel = SignInViewModel()
    @State var isLoading  = false
    @State var email = "abdumuxtorov@gmail.com"
    @State var pasword = "1234qwer"
    @State var ispresented = false
    @State var shovingAlert = false
    
    func doSignIn(){
        let userToValidate = ValidateUser(email: email, password: pasword)
        if userToValidate.validateUser(userToValidate){
            viewModel.apiSignIn(email: email, pasword: pasword, complition: {ressult in
                if !ressult{
                    
                }
            })
        }else{
            shovingAlert = true
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Utills.color1, Utills.color2]), startPoint: .top, endPoint: .bottom)
                VStack(spacing:10){
                    Spacer()
                    Text("app_name").foregroundColor(.white)
                        .font(Font.custom("Billabong", size: 35))
                    
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
                    Button(action: {
                        doSignIn()
                    }, label: {
                        Text("sign_in")
                            .frame(width:360,height: 50)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1.5)
                                    .foregroundColor(.white.opacity(0.5))
                            )
                    })
                    
                    .alert(isPresented: $shovingAlert){
                        let title = "Error"
                        let message = "Check email or pasword"
                        return Alert(title: Text(title),
                                     message: Text(message),
                                     dismissButton: .destructive(Text("OK")))
                    }
                    Spacer()
                    VStack{
                        HStack{
                            Text("dont_have_account")
                                .foregroundColor(.white)
                            Button(action: {
                                ispresented = true
                            }, label: {
                                Text("sign_up")
                                    .foregroundColor(.white)
                                    .bold()
                            })
                            .sheet(isPresented:$ispresented, content: {
                                SignUpView()
                            })
                        }
                        
                    }.frame(maxWidth:.infinity, maxHeight: 70)
                }.padding()
                
                if viewModel.isLoading{
                    ProfileView()
                }
               
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    SignInView()
}
