//
//  ContentViewModel.swift
//  AppMain
//
//  Created by rafael douglas on 22/10/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPw = ""
    @Published var showAlert = false
    var birthYear: Int = Calendar.current.dateComponents([.year], from: Date()).year!
    
    // MARK: - Validation Functions
    
    func passwordsMatch() -> Bool {
        password == confirmPw
    }
    
    func isPasswordValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                       "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$")
        return passwordTest.evaluate(with: password)
    }
    
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
    
    func isValidAge() -> Bool {
        (Calendar.current.dateComponents([.year], from: Date()).year! - birthYear) >= 18
    }
    
    var isSignUpComplete: Bool {
        if !passwordsMatch() ||
        !isPasswordValid() ||
        !isEmailValid() ||
            !isValidAge() {
            return false
        }
        return true
    }
    
    // MARK: - Validation Prompt Strings
    var confirmPwPrompt: String {
        if passwordsMatch() {
            return ""
        } else {
            return "Password fields do not match"
        }
    }
    
    var emailPrompt: String {
        if isEmailValid() {
            return ""
        } else {
            return "Enter a valid email address"
        }
    }
    
    var passwordPrompt: String {
        if isPasswordValid() {
            return ""
        } else {
            return "Must be between 8 and 15 characters containing at least one number and one capital letter"
        }
    }
    
    var agePrompt: String {
        if isValidAge() {
            return "Year of birth"
        } else {
            return "Year of birth (must be 18 years old)"
        }
    }
    
    func signUp() {
        email = ""
        password = ""
        confirmPw = ""
        birthYear = Calendar.current.dateComponents([.year], from: Date()).year!
    }
}
