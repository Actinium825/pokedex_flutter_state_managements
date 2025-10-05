# Pokedex Flutter App with different State Managements

Just a simple Flutter Mobile App for showing Pokemon from the RESTful PokeAPI like a Pokedex.
Initially gets a group of Pokemon with infinite scroll feature for getting additional pokemon, with
also an ability for searching an individual Pokemon.
Each Pokemon's card can be clicked upon to view additional details, evolution chain, and moves.
Shared Preferences with either Async Redux, Riverpod, Bloc, or Get are utilized for state management and saving the selected theme mode.
Go Router or Auto Route is used for routing.

## Contents
- [Features](#features)
- [Credits](#credits)
- [Screenshots](#screenshots)

## Features
- Show Pokemon from RESTful PokeAPI
- Infinite scrolling for additional Pokemon
- Search individual Pokemon
- View individual Pokemon's details, evolution chain, and moves
- Shared Preferences with either Async Redux / Riverpod / Bloc / Get state managements
- Dark/Light theme mode
- Landscape/Portrait responsiveness
- iOS/Android widgets adaptiveness
- Freezed
- Go Router or Auto Route
- Cached Network Image

## Credits
- PokeAPI - https://pokeapi.co/

## Screenshots

### List Page
| Light                                 | Dark                                 |
|---------------------------------------|--------------------------------------|
| ![](/screenshots/list_page_light.png) | ![](/screenshots/list_page_dark.png) |

### About
| Light                             | Dark                             |
|-----------------------------------|----------------------------------|
| ![](/screenshots/about_light.png) | ![](/screenshots/about_dark.png) |

### Evolution
| Light                                 | Dark                                 |
|---------------------------------------|--------------------------------------|
| ![](/screenshots/evolution_light.png) | ![](/screenshots/evolution_dark.png) |

### Moves
| Light                             | Dark                             |
|-----------------------------------|----------------------------------|
| ![](/screenshots/moves_light.png) | ![](/screenshots/moves_dark.png) |

### Search
<img src="/screenshots/search.png" style="width:50%; height:auto" alt="Search">

### Choose Theme
<img src="/screenshots/choose_theme.png" style="width:50%; height:auto" alt="Choose Theme">

### List Page (Landscape)
<img src="/screenshots/list_page_landscape.png" style="height:50%; width:auto" alt="List Page Landscape">

### About (Landscape)
<img src="/screenshots/about_landscape.png" style="height:50%; width:auto" alt="About Landscape">

### Evolution (Landscape)
<img src="/screenshots/evolution_landscape.png" style="height:50%; width:auto" alt="Evolution Landscape">

### Moves (Landscape)
<img src="/screenshots/moves_landscape.png" style="height:50%; width:auto" alt="Moves Landscape">

### Special Evolution Cases

| No Evolution                  | Stage 2 Evolution             | Stage 3 Evolution                    |
|-------------------------------|-------------------------------|--------------------------------------|
| ![](/screenshots/groudon.png) | ![](/screenshots/rattata.png) | ![](/screenshots/evolution_dark.png) |

| Gardevoir                       | Snorunt                       | Eevee                       |
|---------------------------------|-------------------------------|-----------------------------|
| ![](/screenshots/gardevoir.png) | ![](/screenshots/snorunt.png) | ![](/screenshots/eevee.png) |
