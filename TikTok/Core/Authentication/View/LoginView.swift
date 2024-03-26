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
//    @StateObject var viewModel = LoginViewModel(authService: AuthService())
    @StateObject var viewModel: LoginViewModel
    
    private let authService: AuthService
    init(authService: AuthService){
        self.authService = authService
        
        self._viewModel = StateObject(wrappedValue: LoginViewModel(authService: authService))
    }
    
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
                    Task{await viewModel.login(withEmail: email, password: password)}
//                    print("DEBUG: Login")
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
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 : 0.7)
                
                Spacer()
                
                
                //      go to sign up
                Divider()
                
                NavigationLink{
                    RegistrationView(authService: authService)
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

// MARK: - AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
    }
}

#Preview {
    LoginView(authService: AuthService())
}
