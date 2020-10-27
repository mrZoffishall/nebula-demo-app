import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nebula/core/loading_state.dart';
import 'package:nebula/providers/job_provider.dart';
import 'package:nebula/providers/theme_provider.dart';
import 'package:nebula/utils/n_exception.dart';
import 'package:nebula/utils/status_bar.dart';
import 'package:nebula/widgets/common/c_chip.dart';
import 'package:nebula/widgets/common/error_state.dart';
import 'package:nebula/widgets/common/loading_state.dart' as ls;
import 'package:nebula/widgets/forms/c_text_field.dart';
import 'package:nebula/widgets/job_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<JobProvider>().getJobList();
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
    statusBar.setColor(context: context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
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
                          prefixIcon: Icon(
                            Feather.search,
                            color: Colors.grey[500],
                          ),
                          hintText: "Search a job",
                        ),
                      ),
                      IconButton(
                        icon: Icon(Feather.sliders),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Wrap(
                    // Here we gonna show the 5 latest searched items
                    children: [
                      CChip(
                        label: "Developer",
                        onTap: () {},
                      ),
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
                      return ErrorState(
                        message: error.message,
                      );
                    },
                    (jobList) {
                      return Container(
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
                              ...jobList.map((job) {
                                return JobCard(
                                  job: job,
                                );
                              })
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
