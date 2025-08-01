import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> WidgetEntry {
        WidgetEntry(date: Date())
    }
    func getSnapshot(in context: Context, completion: @escaping (WidgetEntry) -> ()) {
        let entry = WidgetEntry(date: Date())
        completion(entry)
    }
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [WidgetEntry] = []
        entries.append(.init(date: .now))
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}
struct WidgetEntry: TimelineEntry {
    let date: Date
}
struct widgetEntryView : View {
    var entry: Provider.Entry
    var body: some View {
        VStack {
            FilterTransactionsView(startDate: .now.startOfMonth, endDate: .now.endOfMonth) { transactions in
                CardView(
                    income: total(transactions, category: .income),
                    expense: total(transactions, category: .expense)
                )
            }
        }
    }
}
struct widget: Widget {
    let kind: String = "widget"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            widgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
                .modelContainer(for: Transaction.self)
        }
        .supportedFamilies([.systemMedium])
        .contentMarginsDisabled()
        .configurationDisplayName("Expenses Widget")
        .description("This is an expenses widget.")
    }
}

#Preview(as: .systemSmall) {
    widget()
} timeline: {
    WidgetEntry(date: .now)
}
