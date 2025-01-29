//
//  ParentView.swift
//  CodeWithMe
//
//  Created by Akhilesh Mishra on 28/01/25.
//

import SwiftUI

class MyClass: ObservableObject {
    @Published var showLogo: Bool = true
}

struct Parent1View: View {
    
    @State var showLogo: Bool = true
    var body: some View {
        LogoView(bindingVariable: $showLogo)
    }
}

struct Parent2View: View {
    
    @ObservedObject var myClass = MyClass()
    
    var body: some View {
        if myClass.showLogo {
            AnotherLogoView(classVariable: myClass)
        }
        
    }
}

#Preview {
    Group {
        Parent1View()
        Parent2View()
    }
}
