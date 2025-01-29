//
//  Reservation.swift
//  CodeWithMe
//
//  Created by Akhilesh Mishra on 28/01/25.
//

import SwiftUI

struct ReservationForm: View {
    
    @State var customerName: String = ""
    
    var body: some View {
        Form {
            TextField("Type Your Name",
                      text: $customerName, onEditingChanged: { status in
                print(status)
            })
            .onChange(of: customerName) { newValue in
                print(newValue)
            }
            .onSubmit {
                print("Submitted")
            }
        }
        .padding()
    }
}

struct Reservation: View {
    
    @State var personCount: Int = 1
    
    var body: some View {
        VStack {
            Text("Little Lemon")
            Stepper{
                Text("Reservation for: \(personCount)")
            } onIncrement: {
                personCount += 1
            } onDecrement: {
                personCount = personCount == 1 ? 1 : personCount - 1
            }
        }
        .padding()
    }
}

#Preview {
    ReservationForm()
    Reservation(personCount: 2)
}


/*
 
 Benefits of SwiftUI:
 
 - Automatic support for dynamic texts
 - Accessibility and localization
 - Easily create UI themes (light and dark mode)
 
 
 SwiftUI makes use of declarative syntax to create an UI element and system then decides how to show it for different platforms
 
 Benefits of declarative syntax:
 - Easy to learn
 - Simple to read and understand
 - A clean and modern syntax
 - Easy to create complex interfaces
 - Xcode provides a live preview
 - No working with view constraints
 - Localization and UI variations
 - Multiplatform applications
 - The future for Apple platforms
 
 Limitations:
 - Full functionality only available in UIKit
 - Xcode preview bugs
 - Market still adapting to SwiftUI
 
 
 Scene
 ------
 A container for other elements such as windows or views
 
 Views
 ------
 complex elements displayed on screen (Texts, TextFields, Images, Shapes etc)
 Views are reusable
 
 
 @State - Property Wrapper
 -------------------------
 - The beauty of @State variable is that it behaves like a regular variable allowing reading and writing values and contains an internal mechanism that notifies view controls of any changes to it
 - Used inside a view or structure (struct)
 - Used with simple data types (int, double, string and arrays)
 - Normally s struct doesn't let its value to be modified. So marking the variable with the @State property wrapper tells SwiftUI to move its storage out from the Struct and into shared storage managed by SwiftUI
 
 
 However using the @State property wrapper is generally only good if you're working inside a view.
 Suppose you need to pass the value to another view. How will this other view update the passed value or react to changes to that variable ?
 
 Well, you need another property wrapper called @Binding to the second view.
 
 @Binding - Property Wrapper
 ----------------------------
 - The @Binding property wrapper will tell the second view that it needs to create a bind between it's internal variable and the original one passed.
 
 
 What happens if you want the interface to update and react the changes of values in classes ?
 That's where @ObservableObject and it's companion the property wrapper @ObservedObject come in. Both these elements works exclusively for classes
 
 Declare the class as an ObservableObject
 class Model: ObservableObject {}
 
 When using the class:
 @ObservedObject var model: Model()
 
 
 
 
 
 */
