import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nebula/widgets/common/tag.dart';

class JobDetailsScreen extends StatefulWidget {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Ionicons.ios_arrow_back, size: 18),
                onPressed: () => Navigator.of(context).pop(),
              ),
              SizedBox(height: 10),
              Center(
                child: Container(
                  height: 90,
                  width: 90,
                  child: Image.network("https://assets.stickpng.com/thumbs/5847f9cbcef1014c0b5e48c8.png"),
                ),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              Text("Text goes here"),
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
                  onPressed: () {},
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
