# 📱 GitHub Clone – iOS App

This is a SwiftUI-based **GitHub profile viewer** app that lets you search for users, view their profiles, repositories, followers, and following. It mimics core functionalities of GitHub’s mobile UI using SwiftUI, Combine, MVVM architecture, and modern iOS development practices.

[![Swift](https://img.shields.io/badge/Swift-5.9-orange)](https://swift.org)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey)](https://developer.apple.com/ios)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

---

## 🚀 Features

- 🔍 **User Search** by GitHub username
- 👤 **Profile View** with bio, avatar, and join date
- 📦 **Repositories** listing
- 🤝 **Followers / Following** lists
- 📅 Account creation date with calendar icon
- ✨ Beautiful SwiftUI components with reusable views
- 🔗 GitHub API Integration (using Combine)
- 🌙 Light & Dark Mode support
- 📱 Responsive layout for all screen sizes

---

## 📸 Screenshots

| Search User | Profile View | Repositories |
|-------------|--------------|--------------|
| ![Search](screenshots/search.png) | ![Profile](screenshots/profile.png) | ![Repos](screenshots/repos.png) | ![Follower](screenshots/repos.png)

> 📁 Screenshots are located in the `/screenshots` directory.

---

## 🧱 Architecture

The app uses **MVVM (Model-View-ViewModel)** architecture:

GitHubClone/
├── Models/
├── Views/
├── ViewModels/
├── Services/
├── Components/
└── Utilities/



- **Combine** used for reactive data binding
- **SwiftUI** for all UI and navigation
- **Decodable** structs for parsing GitHub API responses

---

## 🛠️ Tech Stack

- Swift 5.9
- SwiftUI
- Combine
- GitHub REST API v3
- URLSession
- SF Symbols



