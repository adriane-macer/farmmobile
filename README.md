# farmmobile


bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  # flutter_html: "2.0.0"
  # get: "4.1.4"
  cached_network_image: "3.0.0"
  date_picker_timeline: "1.2.3"
  flutter_local_notifications: "13.0.0"
  flutter_native_timezone: "2.0.0"
  # flutter_radar_chart: "0.2.1"
  flutter_riverpod: "2.3.5"
  flutter_staggered_animations: "1.1.1"
  font_awesome_flutter: "9.0.0"
  get: "4.6.5"
  get_storage: "2.0.2"
  google_fonts: "4.0.3"
  intl: "0.17.0"
  introduction_slider: "2.0.1"
  shared_preferences: "2.0.6"
  # sqflite: "2.2.7"
  url_launcher: "6.0.6"
