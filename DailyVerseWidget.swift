import WidgetKit
import SwiftUI

// MARK: - Widget Configuration
@main
struct DailyVerseWidget: Widget {
    let kind: String = "BibleWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                WidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                WidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Daily Verse")
        .description("Displays a bilingual Bible verse every day.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}
