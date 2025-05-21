This application was developed to list movie information using a local SQLite database. Users can view movies in the database according to information such as category, director, movie title, and production year.

Features
📂 Category Listing: Movie categories in the application are retrieved with an asynchronous process (FutureBuilder) and presented to the user in a vertical list (ListView). In this way, different movie genres can be easily browsed. 📂
🎬 Movie Listing: Movies in the database are retrieved with an asynchronous process (FutureBuilder) and displayed to the user in a grid structure (GridView). This layout aims to visualize more movies at the same time and enrich the user experience. 🎬
ℹ️ Detailed Information: Basic information such as director name, movie title, and production year are listed for each movie. ℹ️
Technologies Used
💙 Flutter: The user interface and basic functions of the application are developed with the Flutter framework. 💙
💾 SQLite: Movie data is stored on SQLite, a lightweight and portable relational database management system. 💾
📦 sqflite Package: A popular Flutter package that allows Flutter applications to interact with SQLite databases. 📦
⏳ FutureBuilder: Used to manage asynchronous data retrieval operations and safely display the results in the UI. ⏳
📜 ListView: Used to display movie categories in a vertical list. 📜
🧱 GridView: Used in a grid layout to present the movie list in a more visual and compact way. 🧱
