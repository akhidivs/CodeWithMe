//
//  LogoView.swift
//  CodeWithMe
//
//  Created by Akhilesh Mishra on 28/01/25.
//

import SwiftUI

struct LogoView: View {
    
    @Binding var bindingVariable: Bool
    
    var body: some View {
        VStack {
            if bindingVariable {
                Image("littlelemonlogo")
                    .frame(width: 120, height: 120)
                    .clipped()
            }
            Button {
                bindingVariable.toggle()
            } label: {
                Text("Toggle Logo Visibility")
                    .font(.title2)
            }

        }
    }
}

struct AnotherLogoView: View {
    
    var classVariable: MyClass
    
    var body: some View {
        VStack {
            Image("littlelemonlogo")
                .frame(width: 120, height: 120)
                .clipped()
            Button {
                classVariable.showLogo.toggle()
            } label: {
                Text("Toggle Logo Visibility")
                    .font(.title2)
            }

        }
    }
}

@available(iOS 18.0, *)
#Preview {
    @Previewable @State var showLogo: Bool = true
    VStack {
        LogoView(bindingVariable: $showLogo)
        AnotherLogoView(classVariable: MyClass())
    }
    
}
