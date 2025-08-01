import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    @State private var activeTab: Tab = .recents
    var body: some View {
        LockView(lockType: .both, lockPin: "0000", isEnabled: isAppLockEnabled, lockWhenAppGoesBackground: lockWhenAppGoesBackground) {
            TabView(selection: $activeTab) {
                RecentsView()
                    .tag(Tab.recents)
                    .tabItem { Tab.recents.tabContent }
                SearchView()
                    .tag(Tab.search)
                    .tabItem { Tab.search.tabContent }
                ChartsView()
                    .tag(Tab.charts)
                    .tabItem { Tab.charts.tabContent }
                SettingsView()
                    .tag(Tab.settings)
                    .tabItem { Tab.settings.tabContent }
            }
            .tint(appTint)
            .sheet(isPresented: $isFirstTime, content: {
                IntroView()
                    .interactiveDismissDisabled()
            })
        }
    }
}

#Preview {
    ContentView()
}
