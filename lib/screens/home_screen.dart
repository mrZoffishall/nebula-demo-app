import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nebula/core/loading_state.dart';
import 'package:nebula/core/models/job.dart';
import 'package:nebula/core/utils/n_exception.dart';
import 'package:nebula/core/utils/status_bar.dart';
import 'package:nebula/providers/job_provider.dart';
import 'package:nebula/providers/preferences_provider.dart';
import 'package:nebula/providers/theme_provider.dart';
import 'package:nebula/widgets/common/c_chip.dart';
import 'package:nebula/widgets/dialogs/filter_dialog.dart';
import 'package:nebula/widgets/states/empty_state.dart';
import 'package:nebula/widgets/states/error_state.dart';
import 'package:nebula/widgets/states/loading_state.dart' as ls;
import 'package:nebula/widgets/forms/c_text_field.dart';
import 'package:nebula/widgets/job_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<JobProvider>().getJobList();
      context.read<PreferencesProvider>().getRecentSearches();
      context.read<PreferencesProvider>().getRecentFilters();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final searchList = context.watch<PreferencesProvider>().searches;
    final Size size = MediaQuery.of(context).size;
    final oldFilters = context.watch<PreferencesProvider>().filters;

    statusBar.setColor(context: context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: themeProvider.appTheme == themeProvider.lightTheme
                          ? Icon(
                              Feather.moon,
                              color: Colors.black54,
                            )
                          : Icon(
                              Feather.sun,
                              color: Colors.yellow,
                            ),
                      onPressed: () {
                        final theme = themeProvider.appTheme == themeProvider.lightTheme ? themeProvider.darkTheme : themeProvider.lightTheme;
                        context.read<ThemeProvider>().setAppTheme(theme);
                      },
                    ),
                  ),
                  AspectRatio(aspectRatio: 10 / 1),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Nebula\nFind your dream job",
                          overflow: TextOverflow.clip,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: CTextField(
                          controller: _searchController,
                          prefixIcon: Icon(
                            Feather.search,
                            color: Colors.grey[500],
                          ),
                          hintText: "Search a job",
                          onFieldSubmitted: (String newValue) {


                            oldFilters["description"] = newValue;
                            context.read<PreferencesProvider>().saveFilters(oldFilters);

                            if(oldFilters.containsKey("location")){
                              if(oldFilters["location"] == "All lands")
                                oldFilters.remove("location");
                            }

                            if(!searchList.contains(newValue)){
                              searchList.add(newValue);
                              context.read<PreferencesProvider>().saveSearch(newValue);
                            }

                            print(oldFilters);

                            context.read<JobProvider>().getJobList(filters: oldFilters);
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Feather.sliders),
                        onPressed: () {

                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) => Center(
                              child: Center(child: Container(child: FilterDialog(), width: 300, height: 400,)),),
                          );

                        },
                      ),
                    ],
                  ),
                  if (searchList.isNotEmpty)
                    Wrap(
                      children: [
                        ...searchList.map((e) {
                          return CChip(
                            label: e,
                            onTap: () {
                              setState(() {
                                _searchController.text = e;
                              });
                              context.read<JobProvider>().getJobList(filters: oldFilters);
                            },
                          );
                        })
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(height: 10),
            context.watch<JobProvider>().loadingState == LoadingState.loading
                ? ls.LoadingState()
                : context.select((JobProvider provider) => provider).jobList.fold(
                    (NException error) {
                      return Column(
                        children: [
                          AspectRatio(aspectRatio: 5 / 1),
                          ErrorState(
                            message: error.message,
                          )
                        ],
                      );
                    },
                    (jobList) {
                      return jobList.isEmpty
                          ? Column(
                              children: [
                                AspectRatio(aspectRatio: 5 / 1),
                                EmptyState(
                                  message: "No job available for the moment, please try again later.",
                                )
                              ],
                            )
                          : Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32.0),
                                  topRight: Radius.circular(32.0),
                                ),
                                color: Theme.of(context).backgroundColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Latest jobs", style: Theme.of(context).textTheme.headline2),
                                    SizedBox(height: 10),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: jobList.length,
                                      itemBuilder: (context, index) {
                                        final Job job = jobList[index];
                                        return JobCard(
                                          job: job,
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
