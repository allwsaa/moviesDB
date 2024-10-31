# MovieDB2


## Project Structure

- `ViewController.swift`: Main view for displaying movie themes, genres, and basic information about movies.
- `MovieDetailsViewController.swift`: A detailed view of a selected movie, displaying an overview, release date, rating, genres, and cast.
- `ActorViewController.swift`: Displays detailed information about a selected actor, including their bio and related movies.

## Features

- **Themed Movie Collections**: Horizontal scroll of movie themes such as "Popular," "Now Playing," "Upcoming," and "Top Rated."
- **Genre Filter**: Another horizontal scrollable list for movie genres like "Action," "Adventure," "Comedy," and "Drama."
- **Detailed Movie Information**: Click on a movie to view its title, release date, rating, genres, overview, and cast.
- **Actor Information**: Select an actor from the movie cast to view their biography and filmography.
- **Tab Bar Navigation**: Navigate between tabs such as Home, Favorites, Watch List, Find, and Profile.

## Views

1. **Home Screen**:
   - Displays movie themes and genres as horizontally scrollable lists.
   - Displays a sample poster and title for "The Green Mile" and "Fight Club."

2. **Movie Details Screen**:
   - Shows a poster, title, release date, rating, genres, and an overview.
   - Shows the main cast and allows navigation to actor details.

3. **Actor Details Screen**:
   - Shows a portrait of the actor, name, birth info, biography, and images related to the actor.
   - Shows movies related to the actor.

## Dependencies

- `SnapKit`
- `UIKit`
