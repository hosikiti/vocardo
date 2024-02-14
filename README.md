# Vocardo

Vocardo is a voice-recordable and speakable flashcard app. It helps you learn a foreign language effectively by recording your own voice and playing it back to you in reviewing sessions. You can also check the pronunciation of the word by the app's Text-to-Speech feature.

<img width="250" src="https://github.com/hosikiti/vocardo/assets/1973308/5b4a3589-5035-4f91-a238-a53716616a30"/>

## Architecture 

- Uses a feature-driven folder architecture, based on: https://github.com/Roaa94/movies_app
- Uses Riverpod(v2) for state management. All global states are managed by providers defined in the `lib/core/services` folder and are exposed to the UI using `ProviderScope` and `Consumer` widgets.
- Uses `isar` for local database.

## Testing Strategy

- Unit & Widget tests are provided using Flutter test package.
- Currently, only tests complex logic / widgets.
- `flutter test` runs all tests.

## To be implemented ...

- [x] Edit card.
- [x] Edit a set's name.
- [x] Show the reverse side of card.
- [x] Add the idea of `study set`.
- [x] Enable language/voice selection on adding a set.
- [x] Add Text-to-Speech feature.
- [x] Imprement space repetition algorithm.
- [x] Edit/Delete card while practicing.
- [x] Effective practice algorithm.
- [ ] Add search cards feature.
- [ ] Export cards as CSV.
- [ ] Add an app icon.
- [ ] Add an about page.
- [x] Make the feature to show the reverse side of card configurable.
