import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPost {
  final String image;
  final String content;
  final String url;

  BlogPost({required this.image, required this.content, required this.url});
}

class Blog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: RichText(
          text: const TextSpan(
            text: "B",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFd40a06),
                fontSize: 40
            ),
            children: <TextSpan>[
              TextSpan(
                text: "logs",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFfff1f1),
        child: ListView(
          children: [
            Column(
              children: [
                BlogContainer(
                  post: BlogPost(
                    image: 'assets/images/women_health_pic_blog1.jpg',
                    content: '3 Daily Habits That Will Positively Affect and Protect Your Mental Health Starting simple with daily habits can work wonders in improving your mental health.',
                    url: 'https://gc4women.org/category/gc4w-womens-health-and-wellness/?gclid=CjwKCAjwrJ-hBhB7EiwAuyBVXd_LCwI_8W4oVlqFww-pA3zGzIYdYdCRZtYwZm9FJ0vh1BAXX-7FaRoCEtUQAvD_BwE',
                  ),
                ),
                BlogContainer(
                  post: BlogPost(
                    image: 'assets/images/safety_women_pic_blog2.jpg',
                    content: 'In the last few years, the level of safety of women is constantly falling. The reason behind this is the continuing increase in crime.',
                    url: 'https://www.iilsindia.com/blogs/women-safety/',
                  ),
                ),
                BlogContainer(
                  post: BlogPost(
                    image: 'assets/images/coro_pic_blog3.png',
                    content: 'My life always consisted of struggles, which I face even today but I have risen from the ashes and continue to fight every day - Shahjahan Mirza',
                    url: 'http://coroindia.org/blog/my-life-always-consisted-of-struggles-which-i-face-even-today-but-i-have-risen-from-the-ashes-and-continue-to-fight-every-day-shahjahan-mirza',
                  ),
                ),
              ],
            ),]
        ),
      ),
    );
  }
}

class BlogContainer extends StatelessWidget {
  final BlogPost post;

  BlogContainer({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFFBBDC0),
        border: Border.all(color: Color(0xffe57474)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use Image.network for web and Image.asset for mobile
          kIsWeb
              ? Image.network(
            post.image,
            height: 150.0,
            width: 300.0,
            fit: BoxFit.cover,
          )
              : Image.asset(
            post.image,
            height: 150.0,
            width: 300.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          SizedBox(height: 8.0),
          Text(post.content),
          SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                launchUrl(
                  Uri.parse(post.url),
                  mode: LaunchMode.inAppWebView
                );
              },
              child: Text('Read More'),
            ),
          ),
        ],
      ),
    );
  }
}

