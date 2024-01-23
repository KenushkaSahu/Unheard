import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xFFffbebc),
        title: ColorChangingText2(),
        ),
       body: Container(
         color: Color(0xFFfff1f1),
         child: ListView(
           children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Text("Welcome to our platform, where we believe that every woman deserves access to quality healthcare"
                  " and NGO support. Our initiative began with a simple idea - to create a space where women in need "
                  "could receive the help and care they deserve.",style: TextStyle(fontSize: 16,color: Colors.black,fontStyle: FontStyle.italic),),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: Text("Through research and interaction with women who were struggling to access healthcare and NGO support,"
                  " we became overwhelmed by the stories we heard. We knew that something needed to be done to address this critical"
                  " issue. We were inspired to create a web application that would connect women with NGOs and doctors who specialize"
                  " in their specific needs.",style: TextStyle(fontSize: 16,color: Colors.black,fontStyle: FontStyle.italic),),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: Text("Our platform provides a safe and confidential space for women to describe their problems and connect with"
                  " relevant NGOs and doctors, free of charge. We believe that this holistic approach to healthcare and NGO support can"
                  " make a real difference in the lives of women in need.",style: TextStyle(fontSize: 16,color: Colors.black,fontStyle: FontStyle.italic),),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: Text("At the core of our initiative is the belief that every woman has the right to live a healthy, happy life."
                  " We understand that seeking help can be daunting, but we want you to know that you're not alone. Our platform is"
                  " designed to provide a safe and welcoming space for you to receive the support and care you"
                  " need.",style: TextStyle(fontSize: 16,color: Colors.black,fontStyle: FontStyle.italic),),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: Text("We are dedicated to empowering women and creating positive change in our communities. We are honored to be"
                  " a part of this incredible journey, and we are excited to see the impact we can make together.",
                  style: TextStyle(fontSize: 16,color: Colors.black,fontStyle: FontStyle.italic),),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
              child: Text("Join us today and become a part of this movement to provide healthcare and NGO support to women in need."
                  " Together, we can make a real difference and create a better future for women everywhere.",style: TextStyle(fontSize: 16,color: Colors.black,fontStyle: FontStyle.italic),),
            ),
      ]
    ),
       ),
       );
  }
}

class ColorChangingText2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: "About",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30
        ),
        children: <TextSpan>[
          TextSpan(
            text: " Unheard",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFd40a06),
                fontSize: 30
            ),
          ),
        ],
      ),
    );
  }
}