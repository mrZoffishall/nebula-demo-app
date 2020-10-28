import 'package:nebula/providers/base_provider.dart';
import 'package:nebula/services/preferences_service.dart';

class PreferencesProvider extends BaseProvider {
  List<String> searches = [];

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
}
