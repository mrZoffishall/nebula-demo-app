import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nebula/utils/status_bar.dart';
import 'package:nebula/widgets/c_text_field.dart';
import 'package:nebula/widgets/job_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    statusBar.setColor(context: context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(aspectRatio: 10 / 3),
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
                    GestureDetector(
                      onTap: () {},
                      child: Chip(
                        label: Text("Developer"),
                        elevation: 2.5,
                        backgroundColor: Theme.of(context).accentColor,
                        shadowColor: Theme.of(context).shadowColor,
                        labelStyle: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: -4),
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {},
                      child: Chip(
                        label: Text("Designer"),
                        elevation: 2.5,
                        backgroundColor: Theme.of(context).accentColor,
                        shadowColor: Theme.of(context).shadowColor,
                        labelStyle: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: -4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                color: Theme.of(context).backgroundColor,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Latest jobs", style: Theme.of(context).textTheme.headline2),
                      SizedBox(height: 20),
                      JobCard(),
                      JobCard(),
                      JobCard(),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

