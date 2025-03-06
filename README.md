# Homzes - Real Estate Mobile App

## Overview

Homzes is a Flutter mobile application for browsing real estate properties. It features modern UI design with smooth animations, Firebase integration for data storage, and offline capabilities for seamless user experience.

## Demo Video

[![Homzes App Demo](https://player.cloudinary.com/embed/?public_id=inter%2FScreen_Recording_20250306_211337_ifqgpn&cloud_name=dx7npz85q&profile=cld-default)]

## Features

- **Property Browsing**: Browse featured properties, new offers, and popular rentals
- **Detailed Property View**: View detailed information about properties including images, prices, and amenities
- **Offline Support**: Continue using the app even without internet connection
- **Favorites**: Save properties to favorites for later viewing
- **Responsive Design**: Works on all screen sizes and orientations

## Architecture

The app follows a clean architecture approach with:

- **MobX** for state management
- **GetIt** for dependency injection
- **Firebase Firestore** for backend data
- **Cached Network Image** for efficient image loading

### Project Structure

```
lib/
├── components/                  # Small, reusable UI components
├── constants/                   # App constants (colors, themes, strings)
├── enum/                        # Enumerations
├── models/                      # Data models
├── screens/                     # App screens/pages
├── services/                    # Services (Firebase, Network)
├── stores/                      # MobX stores
├── utils/                       # Utility functions and helpers
├── widgets/                     # Larger composed widgets
├── main.dart                    # App entry point
└── firebase_options.dart        # Firebase configuration
```

## Firebase Setup

### Firestore Structure

The app expects the following Firestore structure:

```
/property/getFeaturedProperties/list/{propertyId}
/property/getNewOffers/list/{propertyId}
/property/getPopularRentOffers/list/{propertyId}
```
