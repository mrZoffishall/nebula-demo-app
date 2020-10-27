import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future<List<String>> loadSearches() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final stringList = preferences.containsKey("searches") ? preferences.getStringList("searches") : [];
    return stringList;
  }

  Future<void> saveSearch(String search) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final listString = preferences.containsKey("searches") ? preferences.getStringList("searches") : [];
    
    if(listString.isEmpty) {
      List<String> searches = [search];
      await preferences.setStringList("searches", searches);
    } else {
      listString.insert(0, search);
      await preferences.setStringList("searches", listString.take(5).toList());
    }
  }
}

final PreferencesService preferencesService = PreferencesService();