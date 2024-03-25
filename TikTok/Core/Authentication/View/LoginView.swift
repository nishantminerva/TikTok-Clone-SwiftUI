//
//  LoginView.swift
//  TikTok
//
//  Created by Nishant Minerva on 26/03/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                //      logo image
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                //      text field
                VStack{
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.never)
                        .modifier(StandardTextFieldModifier())
                    
                    TextField("Enter your password", text: $password)
                        .modifier(StandardTextFieldModifier())
                }
                
                NavigationLink{
                    Text("Forget password")
                } label: {
                    Text("Forget Password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing,28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    
                }
                
                //      login button
                Button {
                    
                } label: {
                    Text("Login")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 350, height: 44)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.vertical)
                
                Spacer()
                
                
                //      go to sign up
                Divider()
                
                NavigationLink{
                    RegistrationView()
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .padding(.vertical)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
