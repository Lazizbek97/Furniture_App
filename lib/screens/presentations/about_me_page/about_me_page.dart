import 'package:flutter/material.dart';
import 'package:furniture_app/core/data/local_data/about_me_skills.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutMe extends StatelessWidget {
  AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        centerTitle: true,
        title: Text(
          "About Me",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: getHeight(100),
                    width: getWidth(100),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/profile.jpg")),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Text(
                    "Lazizbek Fayziev",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Flutter Developer",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getHeight(100),
              child: Text(
                "I'm a full-stack Flutter developer, Who is always looking for a new Challanges. if you have any idea/concept for Start-ups then fell free to connect with me.",
                style: TextStyle(
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis,
                ),
                textAlign: TextAlign.center,
                maxLines: 5,
              ),
            ),
            Text(
              "Skills",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Container(
              height: getHeight(180),
              child: GridView.builder(
                  itemCount: AboutMeDatas.skills.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: getWidth(80),
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: getWidth(15),
                      mainAxisSpacing: getHeight(10)),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AboutMeDatas.skills[index]),
                        ),
                      ),
                    );
                  }),
            ),
            Text(
              "Portfolio projects' links",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("GitHub:"),
                IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.github),),
                InkWell(
                  onTap: () async {
                    await launchURL("https://github.com/Lazizbek97");
                  },
                  child: Text("https://github.com/Lazizbek97"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Telegram Channel:"),
                Text("https://t.me/lazizbek_blog"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("LinkedIn profile:"),
                Text("https://www.linkedin.com/in/lazizbek-fayziev-977600177"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
