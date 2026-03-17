---

## 🎮 Deep Dive: Two-Player Strategy Engine (`Two-player-Game`)
The Two-Player Game branch demonstrates my ability to manage complex **Game Loops** and **Reactive State**. Unlike static apps, a game requires the software to constantly listen for inputs and validate the state of the "World" (the game board) after every single action.

### 1. The Win-Check Algorithm
The most critical technical component of this project is the custom algorithm developed to determine the game outcome.
* **Matrix Traversal:** The game board is represented as a 1D list mapped to a 3x3 grid. I implemented a function that runs after every move to check for matching patterns across 8 possible lines (3 horizontal, 3 vertical, and 2 diagonal).
* **Efficiency:** Instead of a heavy loop, the algorithm uses a targeted check-list, ensuring that the winner is announced within milliseconds of the final move.
* **Draw Logic:** Developed a counter-based validation system to detect a "Draw" (Tie) state when all slots are filled without a win condition being met.

### 2. State Management & Turn-Toggling
Managing the "Active Player" is key to a smooth multiplayer experience on a single device.
* **Boolean Toggling:** Implemented a binary state switch that alternates between `Player X` and `Player O`. This logic controls everything from the icon displayed to the color of the UI elements.
* **Locking Mechanism:** To prevent "Cheating" or accidental clicks, I built a state-lock that freezes a cell once it has been played, ensuring the integrity of the game data.

<img width="1919" height="1026" alt="Screenshot 2026-03-17 231007" src="https://github.com/user-attachments/assets/e625dd84-e7a0-4362-b1f6-8f73bf075d0d" />

### 3. Interactive UI & Feedback
* **Reactive Widgets:** Used Flutter’s `GestureDetector` to capture precise tap coordinates on the grid.
* **Visual Cues:** Implemented dynamic text and color changes to clearly signal whose turn it is, reducing user confusion.
* **Reset Lifecycle:** Developed a `resetGame()` function that clears the state arrays and triggers a UI rebuild, allowing for instant "Rematch" functionality without needing to restart the application.

### 4. Technical Skills Demonstrated
* **Logic Flow:** Controlling a non-linear application path based on user input.
* **Array/List Manipulation:** Storing and retrieving player moves from specific indices.
* **UX Design:** Creating a clean, distraction-free environment for local multiplayer engagement.
