//
//  YearPickerView.swift
//  CoreUI
//
//  Created by rafael douglas on 22/10/23.
//

import SwiftUI

public struct YearPickerView: View {
    @Binding public var birthYear: Int
    @Binding public var showYearSelector:Bool
    public let currentYear = Calendar.current.dateComponents([.year], from: Date()).year!
    
    public var body: some View {
        ZStack {
            Color(.black).opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    ScrollView(showsIndicators: false){
                        VStack(spacing: 10) {
                            ForEach(((currentYear-100)...currentYear).reversed(), id: \.self) { year in
                                Button(action: {
                                    self.birthYear = year
                                    self.showYearSelector.toggle()
                                }) {
                                    Text(String(year))
                                        .foregroundColor(.primary)
                                    
                                }
                            }
                        }
                    }
                    
                    .frame(height: 200)
                }.padding()
                    .frame(width: 100)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                Spacer()
            }.padding(.top)
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: 1)
        }
    }
    
    public init(birthYear: Binding<Int>, showYearSelector: Binding<Bool>) {
        self._birthYear = birthYear
        self._showYearSelector = showYearSelector
    }
}

#Preview {
    YearPickerView(birthYear: .constant(2023), showYearSelector: .constant(true))
}
