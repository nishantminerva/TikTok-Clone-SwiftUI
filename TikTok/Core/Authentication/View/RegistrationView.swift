//
//  RegistrationView.swift
//  TikTok
//
//  Created by Nishant Minerva on 26/03/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    @Environment(\.dismiss) var dismiss
//    @StateObject var viewModel = RegistrationViewModel(authService: AuthService())
    @StateObject var viewModel : RegistrationViewModel
    
    private let authService: AuthService
    
    init(authService: AuthService){
        self.authService = authService
        
        self._viewModel = StateObject(wrappedValue: RegistrationViewModel(authService: authService))
    }
    
    
    var body: some View {
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
                
                TextField("Enter your full name", text: $fullname)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
                
                TextField("Enter your username", text: $username)
                    .textInputAutocapitalization(.never)
                    .modifier(StandardTextFieldModifier())
            }
            
            Button {
                Task{await viewModel.createUser(withEmail:email,password:password,username:username,fullname:fullname)
                }
            } label: {
                Text("Sign up")
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
            Divider()
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3){
                    Text("Already have an account")
                    
                    Text("Login")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .padding(.vertical)
            }
            
        }
        .navigationBarBackButtonHidden()
    }
}

// MARK: - AuthenticationFormProtocol
extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && !username.isEmpty
    }
}

#Preview {
    RegistrationView(authService: AuthService())
}
