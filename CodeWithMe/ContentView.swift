//
//  ContentView.swift
//  CodeWithMe
//
//  Created by Akhilesh Mishra on 15/10/24.
//

import SwiftUI

struct ContentView: View {
  
  @State private var title = "Hello World!"
  @State private var isValid: Bool = false
  @State private var titleInput = ""
  
    var body: some View {
      
      // Using state
      TextAndTextField()
      
      //Button
//      ButtonControl()
      
      //TextEditor
//      MyTextEditor()
      
      //Toggle
//      MyToggleView()
      
      //Slider
//      MySliderViewAndProgressView()
      
      //StepperView
//      MyStepperView()
      
      //GroupBox
//      MyGroupBox()
      
      //Model
//      MyModel()
      
    }

}

enum FocusName: Hashable {
  case firstName
  case lastName
}

struct TextAndTextField: View {
  @FocusState var focusName: FocusName?
  @State private var defaultName = "Default Name"
  @State private var firstNameInput = ""
  @State private var lastNameInput = ""
  @State private var password = ""
  
  var body: some View {
    VStack(spacing: 12) {
      Text(defaultName)
        .lineLimit(1)
        .padding()
        .background(Color.yellow)
      TextField("Insert first name", text: $firstNameInput)
        .textFieldStyle(.roundedBorder)
        .padding(4)
        .textInputAutocapitalization(.words)
        .background(focusName == .firstName ? Color(white: 0.9) : .white)
        .focused($focusName, equals: .firstName)
        .onSubmit {
          assignTitle()
        }
      TextField("Insert last name", text: $lastNameInput)
        .textFieldStyle(.roundedBorder)
        .padding(4)
        .textInputAutocapitalization(.words)
        .background(focusName == .lastName ? Color(white: 0.9) : .white)
        .focused($focusName, equals: .lastName)
        .onSubmit {
          assignTitle()
        }
      SecureField("Insert password", text: $password)
        .textFieldStyle(.roundedBorder)
      Button(action: {
        assignTitle()
      }, label: {
        HStack {
          Spacer()
          Text("Save")
        }
      })
      .disabled(firstNameInput.isEmpty || lastNameInput.isEmpty)
      Spacer()
    }.padding()
  }
  func assignTitle() {
    let validFirstName = firstNameInput.trimmingCharacters(in: .whitespaces)
    let validLastName = lastNameInput.trimmingCharacters(in: .whitespaces)
    if !validFirstName.isEmpty && !validLastName.isEmpty {
      defaultName = validFirstName + " " + validLastName
      focusName = nil
    }
  }
}


struct MyTextEditor: View {
  @State private var textInput = ""
  
  var body: some View {
    VStack {
      TextEditor(text: $textInput)
        .multilineTextAlignment(.leading)
        .lineSpacing(10)
        .autocorrectionDisabled(true)
        .padding(4)
    }
  }
}


struct MyToggleStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack(alignment: .center) {
      configuration.label
      Spacer()
      Image(systemName: "checkmark.rectangle.fill")
        .foregroundColor(configuration.isOn ? Color.green : Color.gray)
        .onTapGesture {
          configuration.$isOn.wrappedValue.toggle()
        }
    }
  }
}
struct MyToggleView: View {
  @State private var currentState: Bool = true
  
  var body: some View {
    VStack {
      Toggle(isOn: $currentState, label: {
        Text(currentState ? "On" : "Off")
      })
      Spacer()
      Toggle(isOn: $currentState, label: {
        Text(currentState ? "Enabled" : "Disabled")
      })
      .toggleStyle(MyToggleStyle())
      Spacer()
      HStack{
        Toggle(isOn: $currentState, label: {
          Label("Send", systemImage: "mail")
        })
        .toggleStyle(.button)
        .padding()
      }
      Spacer()
      HStack {
        Toggle("", isOn: $currentState)
          .labelsHidden()
        Text(currentState ? "On" : "Off")
          .padding()
          .background(currentState ? Color.yellow : Color.gray)
      }
    }.padding()
  }
}


struct MyStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    let isPressed = configuration.isPressed
    return configuration.label
      .padding()
      .border(Color.green, width: 5)
      .scaleEffect(isPressed ? 1.2 : 1.0)
  }
}
struct ButtonControl: View {
  
  @State private var color = Color.clear
  @State private var buttonDisabled: Bool = false
  @State private var expand: Bool = false
  
  var body: some View {
    VStack(spacing: 10) {
      HStack {
        Button("Cancel") {
          print("Cancel tasks")
        }
        .buttonStyle(.bordered)
        Spacer()
        Button("Delete", role: .destructive, action: {
          print("Delete task")
        })
        .buttonStyle(.bordered)
        Spacer()
        Button("Send") {
          print("Send Message")
        }
        .buttonStyle(.borderedProminent)
      }
      Spacer()
      Button(action: {
        print("Send Mail")
      }, label: {
        Image(systemName: "mail")
          .imageScale(.large)
        Text("Send")
      })
      .buttonStyle(.borderedProminent)
      .font(.largeTitle)
      .controlSize(.large)
      Spacer()
      Text("Default Title")
        .padding()
        .background(color)
      Button("Change Color") {
        color = .green
        buttonDisabled = true
      }
      .padding()
      .disabled(buttonDisabled)
      
      Spacer()
      
      Text("Default Title")
        .frame(minWidth: 0, maxWidth: expand ? .infinity : 150, maxHeight: 50)
        .background(Color.yellow)
      Button(action: {
        expand.toggle()
      }, label: {
        Text(expand ? "Contract" : "Expand")
      })
      .buttonStyle(MyStyle())
      
    }.padding()
  }
}

struct MySliderViewAndProgressView: View {
  @State private var currentValue: Float = 5
  @State private var textActive: Bool = false
  
  var body: some View {
    VStack {
      Text("Current Value: \(currentValue.formatted(.number.precision(.fractionLength(0))))")
        .padding()
        .background(textActive ? Color.green : .clear)
      ProgressView(value: currentValue, total: 10)
      Slider(value: $currentValue,
             in: 0...10,
             step: 1.0,
             onEditingChanged: {
        self.textActive = $0
      })
      Spacer()
      ProgressView()
        .progressViewStyle(.circular)
      Spacer()
    }.padding()
  }
}

struct MyStepperView: View {
  @State private var currentValue: Float = 0
  @State private var goingUp: Bool = true
  
  var body: some View {
    VStack {
      Text("Current Value: \(currentValue.formatted(.number.precision(.fractionLength(0))))")
      Stepper("Counter", value: $currentValue, in: 0...100, step: 5)
      Spacer()
      HStack(alignment: .center) {
        Text("Current Value: \(currentValue.formatted(.number.precision(.fractionLength(0))))")
        Image(systemName: goingUp ? "arrow.up" : "arrow.down")
          .foregroundColor(goingUp ? Color.green : Color.red)
        Stepper("", onIncrement: {
          currentValue += 5
          goingUp = true
        }, onDecrement: {
          currentValue -= 5
          goingUp = false
        })
        .labelsHidden()
      }
      Spacer()
    }.padding()
  }
}

struct MyGroupBox: View {
  @State private var setting1 = true
  @State private var setting2 = true
  @State private var setting3 = true
  
  var body: some View {
    GroupBox("Settings") {
      VStack {
        Toggle("Auto-Capitalization", isOn: $setting1)
        Toggle("Truncate", isOn: $setting2)
        Toggle("Highlight", isOn: $setting3)
      }
    }.padding()
  }
}

struct MyModel: View {
  @StateObject var appData = ApplicationData()
  @State private var titleInput: String = ""
  
  var body: some View {
    VStack {
      Text(appData.title)
      TextField(text: $titleInput, label: {
        Text("Enter new title")
      })
      .padding()
      .textFieldStyle(.roundedBorder)
      HStack {
        Spacer()
        Button("Save", action: {
          appData.title = titleInput
        })
      }
      Spacer()
    }.padding()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
