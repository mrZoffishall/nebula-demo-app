import 'package:flutter/material.dart';
import 'package:nebula/models/lands.dart';

import '../../providers/preferences_provider.dart';
import 'package:provider/provider.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PreferencesProvider>().getRecentFilters();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _dropdownValue = lands[0];

  @override
  Widget build(BuildContext context) {
    final oldFilters = context.watch<PreferencesProvider>().filters;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Filter", style: Theme.of(context).textTheme.headline1),
            Text("Filter your data", style: Theme.of(context).textTheme.bodyText2),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Remote Jobs :"),
                Switch(
                  value: oldFilters['remote'] ?? true,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (newValue) {
                    if (!oldFilters.containsKey("remote")) {
                      oldFilters["remote"] = newValue;
                    } else {
                      oldFilters.update("remote", (value) => newValue);
                    }
                    context.read<PreferencesProvider>().updateFilters(oldFilters);
                    setState(() {});
                  },
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Full Time :"),
                Switch(
                  value: oldFilters["full_time"] ?? true,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (newValue) {
                    if (!oldFilters.containsKey("full_time")) {
                      oldFilters["full_time"] = newValue;
                    } else {
                      oldFilters.update("full_time", (value) => newValue);
                    }
                    context.read<PreferencesProvider>().updateFilters(oldFilters);
                    setState(() {});
                  },
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Location :"),
                SizedBox(
                  width: 10,
                ),
                DropdownButton<String>(
                  value: _dropdownValue,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme.of(context).primaryColor,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String newValue) {
                    setState(() {
                      _dropdownValue = newValue;

                      if (newValue == "All lands") {
                        oldFilters.remove("location");
                      } else {
                        if (oldFilters.containsKey("location")) {
                          oldFilters.update("location", (value) => _dropdownValue);
                        } else {
                          oldFilters["location"] = _dropdownValue;
                        }
                      }
                      context.read<PreferencesProvider>().updateFilters(oldFilters);
                    });
                  },
                  items: lands.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            Spacer(),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                color: Theme.of(context).primaryColor,
                child: Text(
                  "APPLY FILTERS",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
