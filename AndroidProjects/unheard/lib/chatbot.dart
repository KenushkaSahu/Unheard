import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isBot: false,
    );
    setState(() {
      _messages.insert(0, message);
    });

    // Simulate a bot response after a delay (you can replace this with your logic)
    Future.delayed(Duration(seconds: 1), () {
      _botResponse(text);
    });
  }

  void _botResponse(String userMessage) {
    // You can implement various logic based on the user's message
    String response;

    // Example: If the user mentions 'hello', respond with a greeting
    if (userMessage.toLowerCase().contains('hello')) {
      response = 'Hello! How can I assist you today?';
    }
    // Add more conditions and responses based on user input
    else if (userMessage.toLowerCase().contains('help')) {
      response = 'Sure, I can help you with that.';
    }
    // Handle a default response if no specific condition is met
    else {
      response = "I'm sorry, I didn't understand that.";
    }
    ChatMessage message = ChatMessage(
      text: response,
      isBot: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFfff1f1),
        title: ColorChangingText(),
        iconTheme: IconThemeData(color: Color(0xFFd40a06)),
      ),
      body: Container(
        color: Color(0xFFfff1f1),
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _messages[index];
                },
              ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Color(0xFFd40a06)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.isBot});

  final String text;
  final bool isBot;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
        isBot ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: <Widget>[
          isBot
              ? CircleAvatar(
            child: Icon(Icons.android),
          )
              : Container(),
          Container(
            margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isBot
                  ? Colors.grey[300]
                  : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isBot ? Colors.black : Colors.white,
              ),
            ),
          ),
          isBot
              ? Container()
              : CircleAvatar(
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

class ColorChangingText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: "Un",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFFd40a06),
            fontSize: 20
        ),
        children: <TextSpan>[
          TextSpan(
            text: "said - The Chat",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20
            ),
          ),
          TextSpan(
            text: "Bot",
            style: TextStyle(
                color: Color(0xFFd40a06),
                fontSize: 20
            ),
          ),
          TextSpan(
            text: "\nLet me help you with your problems!!",
            style: TextStyle(
                color: Colors.black,
                fontSize: 10
            ),
          ),
        ],
      ),
    );
  }

}

