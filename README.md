
# SwiftUI iOS App for Bible Widget - Usage Instructions

This project contains the source code for a SwiftUI iOS App with a Home Screen Widget, featuring bilingual (Korean/English) Bible verses.

## 🚀 Setup Instructions (Mac + Xcode)

Since you are running this on Windows, you will need to transfer these files to a Mac with Xcode installed.

### Step 1: Create a New Project
1.  Open **Xcode**.
2.  Create a new **App** project.
3.  Name it `VibeCodingBible` (or similar).
4.  Ensure Interface is **SwiftUI** and Language is **Swift**.

### Step 2: Add Widget Extension
1.  In Xcode, go to **File > New > Target...**
2.  Search for **Widget Extension**.
3.  Name it `BibleWidget`.
4.  **Important**: Uncheck "Include Configuration App Intent" if you want a simple static widget (our code is static).

### Step 3: Copy Files
Copy the contents of the generated files into your Xcode project:

| File | Destination in Xcode | Target Membership |
| :--- | :--- | :--- |
| `verses.json` | Main App Folder | **Check both** `VibeCodingBible` AND `BibleWidget` targets |
| `Verse.swift` | Main App Folder | **Check both** `VibeCodingBible` AND `BibleWidget` targets |
| `BibleViewModel.swift` | Main App Folder | Check `VibeCodingBible` |
| `ContentView.swift` | Main App Folder | Check `VibeCodingBible` |
| `BibleWidget.swift` | `BibleWidget` Folder | Check `BibleWidget` |

### ⚠️ Crucial Step: Target Membership
For `verses.json` and `Verse.swift` to work in **both** the main app and the widget:
1.  Select the file in the Project Navigator (left sidebar).
2.  Open the **File Inspector** (right sidebar, generic document icon).
3.  Under **Target Membership**, make sure **BOTH** your App target and your Widget Extension target are checked.

### Step 4: Run
1.  Select the **App** scheme and run on a Simulator. You should see the App with today's verse.
2.  Go to the Home Screen in the Simulator.
3.  Long press -> `+` button -> Search for your App -> Add the Widget.
4.  The widget should display the verse!

## 📝 Customization
-   **Add more verses**: Edit `verses.json`. Ensure the date format matches `MM-dd`.
-   **Design**: Modify `ContentView.swift` or `BibleWidget.swift` to change colors/fonts.
