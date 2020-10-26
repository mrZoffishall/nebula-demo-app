import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:nebula/models/job.dart';
import 'package:nebula/screens/jobs/job_details_screen.dart';
import 'package:nebula/widgets/common/tag.dart';

class JobCard extends StatelessWidget {
  final Job job;

  JobCard({this.job});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: size.width,
        child: Card(
          elevation: 5.0,
          shadowColor: Theme.of(context).shadowColor.withOpacity(0.3),
          child: InkWell(
            borderRadius: BorderRadius.circular(4.0),
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: JobDetailsScreen(),
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: Image.network(job.companyLogo ?? "https://via.placeholder.com/150"),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    job.title,
                                    overflow: TextOverflow.clip,
                                    style: Theme.of(context).textTheme.headline1.apply(fontSizeDelta: -10),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    job.createdAt,
                                    textAlign: TextAlign.end,
                                    style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: -4),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              job.company,
                              style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: -2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Html(
                    data: job.description.length > 90 ? "${job.description.substring(0, 90)}... " : job.description,
                    style: {
                      "div": Style(
                        fontSize: FontSize.small, 
                      ),
                    },
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Tag(
                        label: job.type,
                        color: job.type.toLowerCase() == "remote" ? Colors.orangeAccent : Colors.redAccent,
                      ),
                      SizedBox(width: 6),
                      Tag(
                        label: job.location.length >= 30 ? "${job.location.substring(0, 30)}..." : job.location,
                        color: Colors.greenAccent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
