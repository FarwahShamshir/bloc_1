Onboarding Screen App
This is a simple Flutter app that demonstrates an onboarding flow using PageView to display multiple screens with questions and input fields. Users can swipe between pages to provide information such as their name, birth date, and skills. The app also includes a dot indicator for page navigation.

Features
Multi-step onboarding flow using PageView
Customizable input fields for user responses
Swipe gesture for navigation between onboarding pages
Dot indicator for visual feedback on the current page
Dependencies
This app uses only core Flutter libraries:

flutter/material.dart
How It Works
Each page of the onboarding screen contains:

An image
A question
A text input field based on the question (e.g., name, date of birth, skills)
Pages are navigated through swipe gestures or by tapping on the dot indicators at the bottom. The flow is controlled by PageView and PageController.
