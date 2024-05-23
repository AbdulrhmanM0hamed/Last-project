import 'package:flutter/material.dart';

class DoctorChatScreen extends StatelessWidget {
  final Map<String, dynamic> doctorData;

  const DoctorChatScreen({Key? key, required this.doctorData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 129, 144),
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(doctorData['image'])),
            SizedBox(
              width: 10,
            ),
            Text(
              doctorData['name'],
            ),
          ],
        ),
      ),
      body: ChatScreen(doctorData: doctorData),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final Map<String, dynamic> doctorData;

  const ChatScreen({Key? key, required this.doctorData}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();

  void _addMessage(String text, String sender) {
    setState(() {
      _messages.insert(0, ChatMessage(text: text, sender: sender));
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Align(
                  alignment: _messages[index].sender == 'Me'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: _messages[index].sender == 'Me'
                          ? Color.fromARGB(255, 2, 129, 144)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      _messages[index].text,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: ' Type your message...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Color.fromARGB(255, 2, 129, 144),
                ),
                onPressed: () {
                  if (_textController.text.isNotEmpty) {
                    _addMessage(_textController.text, 'Me');
                  }
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}

class ChatMessage {
  final String text;
  final String sender;

  ChatMessage({required this.text, required this.sender});
}
