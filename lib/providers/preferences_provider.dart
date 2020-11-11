import 'package:nebula/providers/base_provider.dart';
import 'package:nebula/services/preferences_service.dart';

class PreferencesProvider extends BaseProvider {
  List<String> searches = [];
  Map<String, dynamic> filters = {};

  getRecentSearches() {
    if (this.searches.isNotEmpty) return;
    preferencesService.loadSearches().then((value) {
      this.searches = value;
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  saveSearch(String search) {
    preferencesService.saveSearch(search).then((value) {
      this.getRecentSearches();
    }).catchError((e) {});
  }

  getRecentFilters() {
    if (this.filters.isNotEmpty) return;
    preferencesService.loadFilters().then((value) {
      this.filters = value;
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  updateFilters(Map<String, dynamic> newFilters) {
    preferencesService.saveFilters(newFilters).then((value) {
      this.getRecentFilters();
    }).catchError((e) {});
  }
}
