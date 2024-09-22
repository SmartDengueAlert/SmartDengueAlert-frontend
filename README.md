# SmartDengue Alert

## Description
SmartDengue Alert is a mobile application designed to predict and prevent Dengue outbreaks in the Colombo district early using maching learning & data science. Utilizing machine learning techniques and real-time data, the app provides early warnings and preventive measures to users, helping reduce the impact of Dengue on communities.

## -- in pubspec.yaml -- 
## environment:
  sdk: '>=3.3.4 <4.0.0'

## Dependencies
  flutter:
    sdk: flutter
  http: ^0.13.3 
  cupertino_icons: ^1.0.6
  icons_plus: ^4.0.0 
  shared_preferences: ^2.2.3

## dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.2

## flutter:

  The following line ensures that the Material Icons font is included with your application, so that you can use the icons in the material Icons class.
  
  uses-material-design: true

  To add assets to your application, add an assets section, like this:

  assets:
    - assets/images/




## Installation

1. **Install Dart and Flutter:**
   - Follow the official guide to install Dart and Flutter: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

2. **Clone the Repository:**
   - Clone this repository to your local machine using:
     ```bash
     git clone https://github.com/yourusername/SmartDengueAlert.git
     ```

3. **Navigate to Project Directory:**
   - Change to the project directory:
     ```bash
     cd SmartDengueAlert
     ```

4. **Install Project Dependencies:**
   - Install all required dependencies using Flutter:
     ```bash
     flutter pub get
     ```

5. **Run the Project:**
   - Start the project on your preferred device/emulator:
     ```bash
     flutter run
     ```
** NEED TO REPLACE ALL 'localhost' IN URLS WITH THE IP ADDRESS OF THE BACKEND SERVER


## Usage

1. **Sign Up / Log In:**
   - Create a new account or log in with your existing credentials.

2. **Enable Location Services:**
   - Allow the user to choose the location from provided loactions to receive localized Dengue alerts and information.

3. **Check Dashboard:**
   - View the dashboard for real-time Dengue outbreak predictions and current statistics.

4. **Receive Alerts:**
   - Get notifications and alerts about potential Dengue outbreaks in your area.

5. **Educational Resources:**
   - Access information on how to prevent Dengue and what to do if you suspect you have it.
