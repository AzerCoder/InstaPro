//
//  SignUpView.swift
//  InstaPro
//
//  Created by A'zamjon Abdumuxtorov on 29/01/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var session : SessionStore
    @ObservedObject var viewModel = SignUpViewModel()
    @State var isLoading = false
    @State var fullname = "A'zamjon"
    @State var pasword2 =  "1234qwer"
    @State var email = "abdumuxtorov@gmail.com"
    @State var pasword = "1234qwer"
    @State var ispresented = false
    @State var shovingAlert = false

    func doSignUp(){
        let userToValidate = ValidateUser(email: email, password: pasword)
        if userToValidate.validateUser(userToValidate) && pasword == pasword2{
            viewModel.apiSignUp(email: email, pasword: pasword, complition: {ressult in
                if !ressult{
                    
                }else{
                    var user = User(email: email,pasword:pasword, displayName: fullname,imgUser: "")
                    user.uid = session.session?.uid
                    viewModel.apiStoreUser(user: user)
                    presentation.wrappedValue.dismiss()
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
                        doSignUp()
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
                            .alert(isPresented: $shovingAlert){
                                let title = "Error"
                                let message = "Check email or pasword"
                                return Alert(title: Text(title),
                                             message: Text(message),
                                             dismissButton: .destructive(Text("OK")))
                            }
                           
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
    SignUpView()
}
