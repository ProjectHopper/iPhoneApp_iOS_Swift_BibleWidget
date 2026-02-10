import Foundation

class BibleDataService {
    static let shared = BibleDataService()
    
    func loadVerses() -> [Verse] {
        guard let url = Bundle.main.url(forResource: "verses", withExtension: "json") else {
            print("JSON file not found")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let verses = try JSONDecoder().decode([Verse].self, from: data)
            return verses
        } catch {
            print("Error decoding JSON: \(error)")
            return []
        }
    }
    
    func loadTodayVerse() -> Verse {
        let verses = loadVerses()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd"
        let todayString = formatter.string(from: Date())
        
        if let verse = verses.first(where: { $0.date == todayString }) {
            return verse
        } else {
            // Fallback to a default or random verse if today's is not found
            // For now, returning the first one or a placeholder if empty
            return verses.first ?? Verse(date: todayString, content_kr: "말씀을 불러올 수 없습니다.", content_en: "Could not load verse.", reference: "")
        }
    }
}
