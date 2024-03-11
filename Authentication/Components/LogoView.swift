//
//  LogoView.swift
//  Authentication
//
//  Created by Şuayip Emre on 11.03.2024.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("swiftui-logo")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 120)
            .padding(.vertical, 32)
    }
}

#Preview {
    LogoView()
}
