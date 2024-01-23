import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BlogPost {
  final String image;
  final String content;

  BlogPost({required this.image, required this.content});
}

class HelpSupport extends StatelessWidget{
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
                      image: 'assets/images/ngo.png',
                      content: 'Works in : \nRegistration ID : \nLocation :',
                    ),
                  ),
                  BlogContainer(
                    post: BlogPost(
                      image: 'assets/images/ngo.png',
                      content: 'Works in : \nRegistration ID : \nLocation :',
                    ),
                  ),
                  BlogContainer(
                    post: BlogPost(
                      image: 'assets/images/ngo.png',
                      content: 'Works in : \nRegistration ID : \nLocation :',
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
            height: 400.0,
            width: 200.0,
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
        ],
      ),
    );
  }
}

