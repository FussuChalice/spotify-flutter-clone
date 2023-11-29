# lib Directory Structure Documentation

## 1. `network` Directory

Handles network-related functionalities, including API calls and OAuth authentication.

- **`models` Subdirectory:**

  - `personilized_content`: Contains models for personalized content, such as saved albums and tracks.
  - Other models: Representing access tokens, albums, artists, top tracks, and shows.
- **`oauth` Subdirectory:**

  - Contains classes for handling OAuth authentication, including authentication options and access tokens.
- `network_loader.dart`: Provides a helper class for managing network loading states.

## 2. `widgets` Directory

Organizes reusable UI components into subdirectories for better modularity.

- **`layouts` Subdirectory:**

  - Contains widgets for various layouts, such as the main home screen, player, and search.
- **Other Widgets:**

  - Includes various widgets like album cards, sliders, buttons, and custom UI elements.

## 3. Other Files

Contains various files for managing application resources, styling, and main entry points.

- `assets.dart`: Manages assets.
- `colors.dart`: Defines color constants.
- `config.dart`: Configuration file for storing constants like API keys.
- `fonts.dart`: Handles font styles.
- `font_controller.dart`: Controls fonts.
- `main.dart`: The entry point of the application.
- `oauth.dart`: Manages OAuth-related functionalities.
- `providers.dart`: Manages provider instances.
- `spotify_app.dart`: Main application class.
- `static.dart`: Includes static methods and constants.
- `utilities.dart`: Provides utility functions.

These directories are structured to enhance code organization and maintainability. Customize the structure as needed based on your project's requirements.
