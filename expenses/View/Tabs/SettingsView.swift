import SwiftUI

struct SettingsView: View {
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("isAppLockEnabled") private var isAppLockEnabled: Bool = false
    @AppStorage("lockWhenAppGoesBackground") private var lockWhenAppGoesBackground: Bool = false
    @AppStorage("AppTheme") private var appTheme: AppTheme = .systemDefault
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Profile").textCase(.none)) {
                    HStack(spacing: 15) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                            .foregroundColor(.blue)
                        TextField("Enter username", text: $userName)
                    }
                }
                Section(header: Text("Appearance").textCase(.none)) {
                    HStack(spacing: 15) {
                        Image(systemName: "moon.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.purple)
                        Picker("Dark Mode", selection: $appTheme) {
                            ForEach(AppTheme.allCases, id: \.rawValue) { theme in
                                Text(theme.rawValue)
                                    .tag(theme)
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                    HStack(spacing: 15) {
                        Image(systemName: "lock.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.red)
                        Toggle("Enable app lock", isOn: $isAppLockEnabled)
                    }
                    if isAppLockEnabled {
                        HStack(spacing: 15) {
                            Image(systemName: "timer")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.orange)
                            Toggle("Lock when app goes background", isOn: $lockWhenAppGoesBackground)
                        }
                    }
                }
            }
            .listSectionSpacing(0)
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
