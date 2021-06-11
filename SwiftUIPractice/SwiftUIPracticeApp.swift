//
//  SwiftUIPracticeApp.swift
//  SwiftUIPractice
//
//  Created by Padmaja Unnam on 6/9/21.
//

import SwiftUI

@main
struct SwiftUIPracticeApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: UserListViewModel(context: persistenceController.container.viewContext))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)

        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
