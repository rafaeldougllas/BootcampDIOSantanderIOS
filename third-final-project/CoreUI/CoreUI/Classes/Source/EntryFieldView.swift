//
//  EntryFieldView.swift
//  CoreUI
//
//  Created by rafael douglas on 22/10/23.
//

import SwiftUI

public struct EntryFieldView: View {
    @Binding public var field: String
    public var sfSymbolName: String
    public var placeHolder: String
    public var prompt: String
    public var isSecure: Bool
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: sfSymbolName)
                    .foregroundColor(.gray)
                    .font(.headline)
                if isSecure {
                    SecureField(placeHolder, text: $field).autocapitalization(.none)
                } else {
                    
                    TextField(placeHolder, text: $field).autocapitalization(.none)
                }
            }
            .padding(8)
            .background(Color(UIColor.secondarySystemBackground))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            Text(prompt)
            .fixedSize(horizontal: false, vertical: true)
            .font(.caption)
        }
    }
    
    public init(field: Binding<String>, sfSymbolName: String, placeHolder: String, prompt: String, isSecure: Bool = false) {
        self._field = field
        self.sfSymbolName = sfSymbolName
        self.placeHolder = placeHolder
        self.prompt = prompt
        self.isSecure = isSecure
    }
}

#Preview {
    EntryFieldView(field: .constant(""), sfSymbolName: "envelope", placeHolder: "Email Address", prompt: "")
}
