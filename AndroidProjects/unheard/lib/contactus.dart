import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  TextEditingController queryController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFfff1f1),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
              width: 310,
              height: 350,
              decoration: BoxDecoration(
                color: Color(0xFFFBBDC0),
                border: Border.all(color: Color(0xffe57474)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Query Input
              Container(
                margin: EdgeInsets.only(bottom: 15),
                child: RichText(
                textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Contact",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 40
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: " Us",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFd40a06),
                            fontSize: 40
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: queryController,
                      decoration: InputDecoration(labelText: 'Enter your query',
                        contentPadding: EdgeInsets.all(10),),
                    ),
                  ),
                  SizedBox(height: 16.0),

                  // Email Input
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Enter your email',
                        contentPadding: EdgeInsets.all(10),),
                    ),
                  ),
                  SizedBox(height: 32.0),

                  // Send Button
                     ElevatedButton(
                      onPressed: () {
                        // Handle the submission of queries and email
                        String query = queryController.text;
                        String email = emailController.text;

                        // You can add your code here to send the data
                        print('Query: $query, Email: $email');
                      },
                      child: Text('Send'),
                    ),
                ],
              ),
          ),
        ),
    ),
      )
    );
  }

  @override
  void dispose() {
    queryController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
