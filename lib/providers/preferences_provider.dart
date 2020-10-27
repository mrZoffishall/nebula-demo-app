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
      print("Couldn't load filters");
    });
  }

  saveSearch(String search) {
    preferencesService.saveSearch(search).then((value) {
      this.getRecentSearches();
    }).catchError((e) {
      print("Couldn't add this item to recent search list");
    });
  }
}
