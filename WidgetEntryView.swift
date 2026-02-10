import SwiftUI
import WidgetKit

struct WidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family

    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing))

            VStack(alignment: .leading, spacing: 4) {
                // Reference Header
                Text(entry.verse.reference)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                
                Spacer()
                
                // Content based on size
                if family == .systemSmall {
                    Text(entry.verse.content_kr)
                        .font(.system(size: 14))
                        .lineLimit(4)
                } else {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(entry.verse.content_kr)
                            .font(.system(size: 15, weight: .medium))
                            .lineLimit(3)
                        
                        Text(entry.verse.content_en)
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(.secondary)
                            .lineLimit(3)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
