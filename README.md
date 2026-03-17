---

## 🧮 Deep Dive: The Logic-Driven Calculator (`main`)
The Calculator project, hosted on the `main` branch, serves as a testament to my foundational understanding of **State Management** and **Algorithmic Arithmetic**. While appearing simple, the backend of this application manages complex user input sequences and ensures mathematical accuracy across all operations.

### 1. Mathematical Logic & Expression Parsing
The core challenge of this project was converting a sequence of button taps into a valid mathematical result. 
* **Input Sequencing:** Developed a logic handler that distinguishes between numbers and operators, ensuring that multiple operators cannot be entered consecutively (e.g., preventing `5++5`).
* **Real-time Evaluation:** Implemented a system where the application tracks the "Current Expression" and the "Result" separately, allowing for a clean user interface that mimics modern smartphone calculators.
* **Precision Handling:** Utilized Dart's `double` and `int` types to manage large calculations and decimal points, ensuring that results like `0.1 + 0.2` are handled with high precision.

### 2. UI Architecture: Responsive Grids
Building a calculator requires a pixel-perfect layout that remains consistent across various screen sizes.
* **Custom Button Widgets:** To keep the code **DRY (Don't Repeat Yourself)**, I developed a reusable `CalculatorButton` widget. This widget accepts parameters for color, text, and callback functions, making the UI modular and easy to maintain.
* **Flex Layouts:** Used a combination of `Expanded` and `Flexible` widgets within a `Column` and `Row` architecture. This ensures that the buttons resize proportionally whether the app is running on a small 5-inch phone or a large tablet.

<img width="1894" height="1021" alt="Screenshot 2026-03-17 231914" src="https://github.com/user-attachments/assets/0f22dbaa-72c0-4bb9-b2a1-728f1b019e6e" />

### 3. Edge-Case Management
A professional application must be "crash-proof." I implemented several safeguards:
* **Divide by Zero:** Built a validation check that displays an "Error" or "Infinity" message if a user attempts to divide by zero, preventing an application freeze.
* **Clear & Delete Logic:** Developed a "Long Press to Clear All" and "Single Tap to Backspace" system, giving the user granular control over their input mistakes.
* **Decimal Control:** Implemented logic to prevent multiple decimal points in a single number (e.g., preventing `12.5.5`).

### 4. Technical Skills Demonstrated
* **StatefulWidget Lifecycle:** Managing the real-time update of the display string.
* **String Manipulation:** Using RegEx and substrings to handle backspaces and operator swaps.
* **UI/UX Design:** Implementing a "Dark Mode" aesthetic with high-contrast buttons for better accessibility.
