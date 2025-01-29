//
//  CodeWithMeApp.swift
//  CodeWithMe
//
//  Created by Akhilesh Mishra on 15/10/24.
//

import SwiftUI

@main
struct CodeWithMeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}



// How an app is structured in SwiftUI and its main components: main, struct, body, WindowGroup, Scene and ContentView.


// MARK: Scene
/*
 A Scene is part of an app's user interface that is managed by the system, meaning that everything defined inside it will be displayed in a way that may vary from platform to platform. The
 reason is that different Apple platforms have other input methods, screen sizes and hardware characteristics.
 
 For example, a list shown as one column on an iPhone may be shown as two columns on an iPad. The system will always decide the best way to show the user interface.
 */


// MARK: WindowGroup
/*
 A WindowGroup is a scene that presents a group of identically structured windows.
 */

// MARK: COntentView
/*
 In a new SwiftUI project, ContentView will always be the first view shown when the app launches.
 */

// MARK: PreviewProvider
/*
 PreviewProvider has no role in the application itself and will not be compiled or included in the final code. It is there to help you see how the interface will look when the app runs.
 You can even remove these lines if you don't want Xcode to display a live preview.
 */
