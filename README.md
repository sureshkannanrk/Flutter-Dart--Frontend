---

## 🛒 Deep Dive: E-Commerce Shopping Experience (`Shopping-app`)
The Shopping App project is a high-level demonstration of **Complex UI Composition** and **Stateful Data Flow**. It mimics a real-world digital storefront, focusing on the seamless transition between product discovery and the checkout process.

### 1. Product Catalog & Dynamic Filtering
The core challenge was managing a diverse catalog of items while maintaining a smooth scrolling experience.
* **Model-View Architecture:** Developed a robust `Product` model to handle attributes like prices, categories, ratings, and image URLs.
* **Modular UI Components:** Created reusable "Product Card" widgets that utilize `CachedNetworkImage` to optimize performance and reduce data usage while loading high-resolution product photos.
* **Category Logic:** Implemented a filtering system that allows users to sort products by department, ensuring a tailored shopping experience.

### 2. Shopping Cart & State Management
Managing the cart is the most logic-heavy part of an e-commerce app.
* **Global State:** Implemented a centralized state management solution to track items added to the cart across different screens.
* **Quantity Logic:** Developed functions to increment/decrement item counts within the cart while dynamically updating the "Total Price" in real-time.
* **Persistence:** Leveraged local storage to ensure that items added to the cart remain there even if the user closes the application.
<img width="1896" height="1008" alt="Screenshot 2026-03-17 234100" src="https://github.com/user-attachments/assets/e2c55d61-6776-4c1e-9039-ccae64c45c89" />

### 3. Checkout Workflow & UX
* **Input Validation:** Built a multi-step checkout form with validation for shipping addresses and payment details.
* **Tactile Feedback:** Used custom animations for the "Add to Cart" action to give users a satisfying sense of interaction.
* **Responsive Design:** Optimized the product grid layout using `SliverGrid` to ensure the interface adapts beautifully to both portrait and landscape orientations.

### 4. Technical Skills Demonstrated
* **State Management:** Syncing data between the product list and the shopping cart.
* **Complex UI:** Handling nested scrolls and sticky headers for a premium feel.
* **Business Logic:** Managing taxes, discounts, and total amount calculations.
