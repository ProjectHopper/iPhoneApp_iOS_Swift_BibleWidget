import Foundation

class BibleViewModel: ObservableObject {
    @Published var todayVerse: Verse?
    
    init() {
        loadTodayVerse()
    }
    
    func loadTodayVerse() {
        guard let url = Bundle.main.url(forResource: "verses", withExtension: "json") else {
            print("JSON file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let verses = try JSONDecoder().decode([Verse].self, from: data)
            
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd"
            let todayString = formatter.string(from: Date())
            
            self.todayVerse = verses.first { $0.date == todayString } ?? verses.first
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
