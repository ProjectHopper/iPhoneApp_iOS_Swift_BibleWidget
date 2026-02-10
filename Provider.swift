import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    let dataService = BibleDataService.shared

    func placeholder(in context: Context) -> SimpleEntry {
        // Fallback/Placeholder data
        SimpleEntry(date: Date(), verse: Verse(date: "01-01", content_kr: "태초에 하나님이...", content_en: "In the beginning...", reference: "Genesis 1:1"))
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), verse: dataService.loadTodayVerse())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        let verse = dataService.loadTodayVerse()
        
        // Create an entry for now
        let entry = SimpleEntry(date: currentDate, verse: verse)
        entries.append(entry)
        
        // Create an entry for the next update (next day midnight usually, but for now just 1 hour for safety)
        let nextUpdate = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate)!
        
        let timeline = Timeline(entries: entries, policy: .after(nextUpdate))
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let verse: Verse
}
