import SwiftUI

struct ThemeSwitcher<Settings: View>: View {
    @ViewBuilder var settings: Settings
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault
    var body: some View {
        settings
            .preferredColorScheme(appTheme.colorScheme)
    }
}
enum AppTheme: String, CaseIterable {
    case systemDefault = "Default"
    case light = "Light"
    case dark = "Dark"
    var colorScheme: ColorScheme? {
        switch self {
        case .systemDefault: nil
        case .light: .light
        case .dark: .dark
        }
    }
}
