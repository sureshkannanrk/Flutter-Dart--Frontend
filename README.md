---

## ✅ Deep Dive: Task Architect - CRUD Specialist (`Todo-list`)
The To-Do List branch is a demonstration of data lifecycle management. While the other apps focus on logic and real-time data, this project focuses on **Data Persistence**—ensuring that user information is stored securely and remains available even after the application process is terminated.

### 1. The CRUD Lifecycle
I implemented a full CRUD architecture to manage user tasks, which is the standard for modern enterprise applications:
* **Create:** Developed a modal bottom sheet for quick task entry, utilizing a `TextEditingController` to capture and validate user input.
* **Read:** Implemented dynamic list rendering using `ListView.builder`, which optimizes memory by only rendering items currently visible on the screen.
* **Update:** Created a toggle system to mark tasks as "Complete." This triggers a UI state change (strikethrough effect) and updates the underlying data object.
* **Delete:** Integrated "Dismissible" widgets, allowing users to remove tasks with a intuitive swipe gesture—a standard in modern mobile UX.

### 2. Data Persistence & State
A critical feature of this app is that it "remembers" your tasks. 
* **Local Storage:** [Mention if you used SharedPreferences or SQLite here]. I implemented logic to serialize task objects into JSON strings to store them locally on the device's disk.
* **Initialization Logic:** Developed an `initState` sequence that checks for existing data upon app launch, ensuring the user's list is populated immediately without manual refreshing.
<img width="1897" height="988" alt="Screenshot 2026-03-17 234614" src="https://github.com/user-attachments/assets/f5151831-a345-4ec0-ac2d-c6243d1d6396" />

### 3. UI/UX & Interaction Design
* **Conditional Rendering:** Built logic to display a "No Tasks Found" illustration when the list is empty, improving the empty-state user experience.
* **Visual Feedback:** Used snackbars and subtle animations to confirm when a task is added or deleted, providing the user with clear feedback on their actions.

### 4. Technical Skills Demonstrated
* **Data Modeling:** Created a custom `Task` class with unique IDs and boolean status flags.
* **Persistence:** Bridging the gap between volatile RAM and permanent device storage.
* **Gestures:** Implementing swipe-to-action and long-press interactions.
