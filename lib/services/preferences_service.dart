import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {

  Future<List<String>> loadSearches() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final List<String> stringList = preferences.containsKey("searches") ? preferences.getStringList("searches") : <String>[];
    return await Future((){
      return stringList;
    });
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

  Future<Map<String, dynamic>> loadFilters() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final List<String> stringList = preferences.containsKey("filters") ? preferences.getStringList("filters") : <String>[];
    return await Future((){
      return Map.fromIterable(stringList);
    });
  }

  Future<void> saveFilters(Map<String, dynamic>  newFilters) async {

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final listString = preferences.containsKey("filters") ? preferences.getStringList("filters") : [];


    if(listString.isEmpty) {
      List<String> filters = [jsonEncode(newFilters)];
      await preferences.setStringList("filters", filters);
    } else {
      listString.insert(0, jsonEncode(newFilters));
      await preferences.setStringList("filters", listString);
    }
  }

}

final PreferencesService preferencesService = PreferencesService();