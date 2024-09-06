import 'package:flutter/material.dart';
import 'package:my_applecitne/app_data.dart';

import 'package:url_launcher/url_launcher.dart';

class tripDetalScreen extends StatelessWidget {
  static const screenRoute = ' /trip_detail';
  Widget buildSectionTitle(String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: TextStyle(
            color: Color.fromARGB(225, 172, 18, 199),
            fontFamily: "font1",
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildListViewContenar(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        border: Border.all(color: Color.fromARGB(255, 132, 135, 132)),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      height: 400,
      margin: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripid = ModalRoute.of(context)?.settings.arguments as String;
    final selectedtrip = Trips_data.firstWhere(
      (trip) => trip.id == tripid,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("${selectedtrip.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedtrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildSectionTitle("الأنشطة "),
            buildListViewContenar(
              ListView.builder(
                itemCount: selectedtrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedtrip.activities[index]),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildSectionTitle("معلومات مهمة تفيدك "),
            buildListViewContenar(
              ListView.builder(
                itemCount: selectedtrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text(selectedtrip.program[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                _launchURL('http://www.giza.gov.eg/Tourism1/RatesSights.aspx');
              },
              child: Text('احجز تذكرتك'),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
