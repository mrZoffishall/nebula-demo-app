import 'package:flutter/material.dart';
import 'package:nebula/screens/jobs/job_details_screen.dart';
import 'package:nebula/widgets/common/tag.dart';

class JobCard extends StatelessWidget {
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
                        child: Image.network("https://assets.stickpng.com/thumbs/5847f9cbcef1014c0b5e48c8.png"),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Product designer",
                                  style: Theme.of(context).textTheme.headline1.apply(fontSizeDelta: -10),
                                ),
                                Text(
                                  "Yesterday",
                                  style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: -4),
                                )
                              ],
                            ),
                            Text(
                              "Google LLC",
                              style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: -2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Lorem ipsum dolor sit atmet consectur ba bla bla bla bla",
                    style: Theme.of(context).textTheme.bodyText2.apply(fontSizeDelta: -2),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Tag(
                        label: "Remote",
                        color: Colors.redAccent,
                      ),
                      SizedBox(width: 6),
                      Tag(
                        label: "Fulltime",
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
