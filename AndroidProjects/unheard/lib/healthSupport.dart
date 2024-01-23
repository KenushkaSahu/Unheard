import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'chatbot.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPost {
  final String image;
  final String content;
  final String icon1;
  final String icon2;
  final String icon3;

  BlogPost({required this.image, required this.content, required this.icon1, required this.icon2, required this.icon3});
}

class HealthSupport extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFfff1f1),
        child: ListView(
            children: [
              Column(
                children: [
                  BlogContainer(
                    post: BlogPost(
                      image: 'assets/images/doctor.png',
                      content: 'In practice since \nAddress : \nPhone number : \nArea of practice: \nDegree :',
                      icon1: 'assets/images/phone_call.png',
                      icon2: 'assets/images/video_call.png',
                      icon3: 'assets/images/chat.png',
                    ),
                  ),
                  BlogContainer(
                    post: BlogPost(
                      image: 'assets/images/doctor.png',
                      content: 'In practice since \nAddress : \nPhone number : \nArea of practice: \nDegree :',
                      icon1: 'assets/images/phone_call.png',
                      icon2: 'assets/images/video_call.png',
                      icon3: 'assets/images/chat.png',
                    ),
                  ),
                  BlogContainer(
                    post: BlogPost(
                      image: 'assets/images/doctor.png',
                      content: 'In practice since \nAddress : \nPhone number : \nArea of practice: \nDegree :',
                      icon1: 'assets/images/phone_call.png',
                      icon2: 'assets/images/video_call.png',
                      icon3: 'assets/images/chat.png',
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
  final number = '+1234567890';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: kIsWeb
                    ? Image.network(
                  post.icon1,
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  post.icon1,
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.cover,
                ),
                onTap: (){
                  launch('tel://$number');
                },
              ),
              InkWell(
                child: kIsWeb
                    ? Image.network(
                  post.icon2,
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  post.icon2,
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.cover,
                ),
                onTap: (){
                  print('Tapped on video call');
                },
              ),
              InkWell(
                child: kIsWeb
                    ? Image.network(
                  post.icon3,
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.cover,
                )
                    : Image.asset(
                  post.icon3,
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.cover,
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreen()
                      ));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

