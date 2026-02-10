# iPhone iOS Swift based Bible Widget

A SwiftUI iOS App with a Home Screen Widget that displays daily bilingual (Korean/English) Bible verses. This project demonstrates a clean MVVM architecture with a dedicated Data Service and a modular Widget implementation.

## 📂 Project Structure

### **App Entry**
- **`BibleWidgetApp.swift`**: The main SwiftUI App entry point (`@main`).
- **`ContentView.swift`**: The main view for the app.

### **Widget**
- **`DailyVerseWidget.swift`**: The Widget configuration and entry point.
- **`Provider.swift`**: The `TimelineProvider` that determines when the widget updates.
- **`WidgetEntryView.swift`**: The SwiftUI view used to render the widget interface.

### **Data Layer**
- **`BibleDataService.swift`**: Singleton service responsible for loading and parsing `verses.json`.
- **`BibleModel.swift`**: Contains the `Verse` data model struct.
- **`BibleViewModel.swift`**: View model for the main app, handles data prep for the UI.
- **`verses.json`**: The local JSON data source containing verses (dates matched by `MM-dd`).

## 🚀 Setup Instructions (Mac + Xcode)

Since this project contains code generated/edited on Windows, follow these steps to run it on a Mac:

1.  **Create Xcode Project**: Create a new iOS App in Xcode named `VibeCodingBible` (or similar).
2.  **Add Widget Target**: Go to File > New > Target > Widget Extension. Name it `BibleWidget`. Uncheck "Include Configuration App Intent".
3.  **Copy Files**: Replace the default files with the ones from this repository.
4.  **⚠️ CRITICAL: Target Membership**:
    - To ensure the app and widget can both see the data, you must set the "Target Membership" correctly.
    - **Select these files** in Xcode:
        - `BibleModel.swift`
        - `BibleDataService.swift`
        - `verses.json`
    - **Open the Right Panel** (File Inspector).
    - **Check the boxes** for **BOTH** your Main App Target AND the Widget Extension Target.

## � Customization

- **Add Verses**: Update `verses.json`. Ensure the date format matches `MM-dd`.
- **Styling**: Edit `WidgetEntryView.swift` to change the widget's appearance/colors.
- **Logic**: Modify `Provider.swift` to change how often the timeline updates.





## 📱 Demo Test Instructions
Install Scriptable: Download the Scriptable app from the App Store.

Copy the Code: Copy the contents of the scriptable_code.js (or .json) file.

Create New Script: Open the Scriptable app and press the "+" icon to create a new script.

Paste & Save: Paste the copied code into the editor and give it a name (e.g., "Daily Bible").

Add Widget: Go to your iPhone Home Screen, add a Scriptable widget, and select your script from the widget settings.
  
