import SwiftUI
import WidgetKit

@main
struct expensesApp: App {
    var body: some Scene {
        WindowGroup {
            ThemeSwitcher {
                ContentView()
                    .onAppear {
                        WidgetCenter.shared.reloadAllTimelines()
                    }
            }
        }
        .modelContainer(for: [Transaction.self])
    }
}
