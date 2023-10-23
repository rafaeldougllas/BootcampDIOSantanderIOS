//
//  ContentView.swift
//  AppMain
//
//  Created by rafael douglas on 22/10/23.
//

import CoreUI
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
        
    @State private var showYearSelector = false
    
    var body: some View {
            ZStack {
                VStack {
                    Text("Register")
                        .font(.title)
                    
                    VStack {
                        EntryFieldView(field: $viewModel.email,
                                       sfSymbolName: "envelope",
                                       placeHolder: "Email Address",
                                       prompt: viewModel.emailPrompt)
                        EntryFieldView(field: $viewModel.password,
                                       sfSymbolName: "lock",
                                       placeHolder: "Password",
                                       prompt: viewModel.passwordPrompt,
                                       isSecure: true)
                        EntryFieldView(field: $viewModel.confirmPw,
                                       sfSymbolName: "lock",
                                       placeHolder: "Confirm",
                                       prompt: viewModel.confirmPwPrompt,
                                       isSecure: true)
                        VStack(spacing: 5) {
                            Button(action: {
                                self.showYearSelector.toggle()
                            }) {
                                Text(String(viewModel.birthYear))
                                    .padding(8)
                                    .foregroundColor(.primary)
                                    .background(Color(UIColor.secondarySystemBackground))
                                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                            }
                            Text(viewModel.agePrompt).font(.caption)
                        }
                        .padding(.vertical,8)
                        Button(action: {
                            viewModel.showAlert.toggle()
                        }) {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .padding(.vertical, 5)
                                .padding(.horizontal)
                                .background(Capsule().fill(Color.blue))
                        }
                        .opacity(viewModel.isSignUpComplete ? 1 : 0.6)
                        .disabled(!viewModel.isSignUpComplete)
                    }
                    .padding()
                    .background(Color(UIColor.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                }.disabled(showYearSelector)
                .padding()
                .alert("Congratulations",
                       isPresented: $viewModel.showAlert,
                       actions: {
                    Button("Ok", role: .cancel, action: {
                        self.viewModel.signUp()
                    })
                }, message: {
                    Text("congratulations successful registration")
                })
                
                // Picker overlay only displayed when year field tapped
                YearPickerView(birthYear: $viewModel.birthYear, showYearSelector: $showYearSelector)
                    .opacity(showYearSelector ? 1 : 0)
                    .animation(.easeIn, value: 1)
        } // End of ZStack
    }
}

#Preview {
    ContentView()
}
