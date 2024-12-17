import 'package:flutter/material.dart';
import 'chatbot.dart';
import 'contactus.dart';
import 'aboutus.dart';
import 'blog.dart';
import 'healthSupport.dart';
import 'helpSupport.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFffbebc)),
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Unheard',style: TextStyle(color: Color(0xFFd40a06), fontSize: 30),),
        actions: [
          Theme(
              data: Theme.of(context).copyWith(),
              child: PopupMenuButton<int>(
                color: Color(0xFFfff1f1), itemBuilder: (context)=>[
                PopupMenuItem<int>(
                  value: 2,
                  child: Text("Blogs",style: TextStyle(color: Color(0xFFd40a06)),),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text("Contact Us",style: TextStyle(color: Color(0xFFd40a06)),),
                ),
              ],onSelected:  (value) {
                if (value == 3) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ContactUsPage(),
                  ));
                }
                else if (value == 2) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Blog(),
                  ));
                }
              },
              ),)
          ],
      ),
      body: ListView(
        children: [Container(
          color: Color(0xFFfff1f1),
          child: Column(
              children: [
                ColorChangingText(),
                ButtonForChat(),
                ColorChangingText2(),
                About(),
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 30),
                  width: 250,
                  height: 35,
                  color: Color(0xFFd60806),
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AboutPage(),
                        ));
                      }, child: Text("Learn More")),
                ),
                ColorChangingText3(),
                Help(),
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 30),
                  width: 250,
                  height: 35,
                  color: Color(0xFFd60806),
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HelpSupport(),
                        ));
                      }, child: Text("Checkout NGO's")),
                ),
                ColorChangingText4(),
                Health(),
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 20),
                  width: 250,
                  height: 35,
                  color: Color(0xFFd60806),
                  child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HealthSupport(),
                        ));
                      }, child: Text("Search your Doctor")),
                )
              ],
            ),
        ),]
      ),
    );
  }
}

class ColorChangingText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 11,top: 20),
      child: RichText(
        text: const TextSpan(
          text: "Millions of\nWomen's Voices\nAre",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 40
          ),
          children: <TextSpan>[
            TextSpan(
              text: " Never Heard",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFd40a06),
                  fontSize: 40
              ),
            ),
            TextSpan(
              text: "\nHelping women find their voice!!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class ButtonForChat extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 30,
          margin: EdgeInsets.only(right: 2,bottom: 30),
          child: OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all<BorderSide>(
                  BorderSide(color: Color(0xFFc29898), width: 2.0), // Change the color to the desired color
                ),
              ),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatScreen()
                    ));
              }, child: Text("Health",style: TextStyle(color: Colors.black),)),
        ),
        Container(
          width: 150,
          height: 30,
          margin: EdgeInsets.only(bottom: 30),
          color: Color(0xFFd60806),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(),
                  ),
                );
              }, child: Text("NGO's",style: TextStyle(color: Colors.white),)),
        )
      ],
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
            fontSize: 40
        ),
        children: <TextSpan>[
          TextSpan(
            text: " Un",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFd40a06),
                fontSize: 40
            ),
          ),
          TextSpan(
            text: "heard",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40
            ),
          ),
        ],
      ),
    );
  }
}

class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
      child: Text("Unheard is a platform dedicated to providing health and support "
          "to women in need. The platform aims to connect women with relevant NGOs"
          " and doctors based on their specific problem descriptions. We aim to make"
          " healthcare and NGO support easily accessible and free for those who need it"
          " the most.",style: TextStyle(fontSize: 20,color: Colors.black),),
    );
  }

}

class ColorChangingText3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: "Help",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFd40a06),
            fontSize: 40
        ),
        children: <TextSpan>[
          TextSpan(
            text: " Support",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40
            ),
          ),
        ],
      ),
    );
  }
}

class Help extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
      child: Text("We understand that reaching out for our problems can be uncomfortable. Our platform is dedicated to providing"
          " a safe and confidential space for you to share your problems and receive the support you need.",style: TextStyle(fontSize: 20,color: Colors.black),),
    );
  }

}

class ColorChangingText4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: "Health",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFd40a06),
            fontSize: 40
        ),
        children: <TextSpan>[
          TextSpan(
            text: " Support",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 40
            ),
          ),
        ],
      ),
    );
  }
}

class Health extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
          child: Text("Get the healthcare support & consultation you need, without the hassle. Our platform provides a safe and confidential"
              " space for you to describe your health concerns and connect with doctors free of charge.",style: TextStyle(fontSize: 20,color: Colors.black),),
        ),
        Container(
          margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
          child: Text("Don't let fear or uncertainty hold you back from prioritising your well-being. Join us today and take the first step"
              " towards a healthier, happier you.",style: TextStyle(fontSize: 20,color: Colors.black),),
        ),
      ],
    );
  }

}

