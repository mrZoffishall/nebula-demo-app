import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nebula/core/models/job.dart';
import 'package:nebula/widgets/common/tag.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetailsScreen extends StatefulWidget {
  final Job job;

  JobDetailsScreen({@required this.job});

  @override
  _JobDetailsScreenState createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Ionicons.ios_arrow_back, size: 18),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                  height: 90,
                  width: 90,
                  child: Image.network(
                    widget.job.companyLogo ?? "https://via.placeholder.com/150",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.job.company,
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tag(
                    label: widget.job.type,
                    color: Colors.redAccent,
                  ),
                  SizedBox(width: 6),
                  Tag(
                    label: widget.job.location.length >= 30 ? "${widget.job.location.substring(0, 30)}..." : widget.job.location,
                    color: widget.job.location.toLowerCase() == "remote" ? Colors.orangeAccent : Colors.greenAccent,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Html(
                data: widget.job.description,
                style: {
                  "div": Style(
                    fontSize: FontSize.small,
                  ),
                },
                onLinkTap: (String link) async {
                  if (await canLaunch(link)) launch(link);
                },
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.3),
                  blurRadius: 4.0,
                ),
              ],
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 50,
                width: size.width,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: () async {
                    if (await canLaunch(widget.job.url)) launch(widget.job.url);
                  },
                  child: Text(
                    "Apply here",
                    style: Theme.of(context).textTheme.bodyText1.apply(color: Theme.of(context).accentColor),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
