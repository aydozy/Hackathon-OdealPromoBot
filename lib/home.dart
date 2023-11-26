import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'function.dart';

// 'Message' sınıfı, sohbet mesajlarını temsil eder.
class Message {
  String text;
  bool isUserMessage; // Kullanıcı mesajı mı, bot mesajı mı?

  Message({required this.text, this.isUserMessage = false});
}

// 'Home' sınıfı, uygulamanın ana sohbet ekranını yöneten bir StatefulWidget'dır.
// Kullanıcıya bir mesaj girişi ve mesajların gösterildiği bir liste sunar.
class Home extends StatefulWidget {
  final String userId;

  // userId, kullanıcı tanımlama bilgisini saklamak için kullanılır.
  const Home({Key? key, required this.userId}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Message> messages = []; // Mesajları tutacak liste

  String userQuery = '';
  String url_pro = '';
  var data;
  String output_pro =
      " ";
  TextEditingController queryController = TextEditingController();
  String userData = '';

  @override
  void initState() {
    super.initState();
    // Here you can use widget.userId to do something with the userId
    fetchUserData();
  }

  // 'fetchUserData' fonksiyonu, kullanıcı verilerini sunucudan çeker.
  void fetchUserData() async {
    String url =
        'http://10.0.2.2:5000/api/customerdata?userId=${widget.userId}';
    try {
      String response = await fetchdata(url);
      setState(() {
        userData = response; // Store the fetched data in the state
      });
    } catch (e) {
      print("Error fetching user data: $e");
      // Handle errors if necessary
    }
  }

  // 'build' metodunda Scaffold widget'ı içinde sohbet ekranı oluşturulur.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      backgroundColor: Colors.white,
      body: Stack(
        // Stack içerisinde widget'ları istediğimiz gibi konumlandırabiliriz.
        children: [
          ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 35), // Altta yer açmak için padding
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              const SizedBox(height: 25);
              return ListTile(
                leading: message.isUserMessage ? null : Icon(Icons.chat_bubble,color: Color(0xff1881FF)),
                trailing: message.isUserMessage ? Icon(Icons.person,color: Color(0xff1881FF)) : null,
                title: Text(message.text, textAlign: message.isUserMessage ? TextAlign.right : TextAlign.left),
              );
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 35.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 12.0,
                  ),
                  if (userQuery.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            userQuery,
                            style: const TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        // SizedBox(width: 15.0),
                        //Icon(Icons.person, color: Color(0xff1881FF)),
                      ],
                    ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  // Divider(),
                  // Botun cevabını ve ikonu göster
                  if (output_pro.isNotEmpty)
                    Row(
                      children: [
                        // Icon(Icons.chat_bubble, color: Color(0xff1881FF)),
                        // Bot ikonu
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(output_pro,
                              style: TextStyle(
                                  fontSize: 18, fontStyle: FontStyle.italic)),
                        ),
                      ],
                    ),
                ],
              ), // output_pro değerini ekranda göster
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              // Ekranın altında bir padding veriyoruz.
              padding: const EdgeInsets.only(
                // bottom: MediaQuery.of(context).viewInsets.bottom, // Klavye açıldığında boşluk oluşturur
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        controller: queryController,
                        decoration: InputDecoration(
                          hintText: "PromoBot'a bir soru sorun",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          elevation: 20,
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: sendMessage,
                        icon: Icon(Icons.send, color: Color(0xff1881FF)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 'sendMessage' fonksiyonu, kullanıcı tarafından gönderilen mesajları işler ve botun yanıtını alır.
  void sendMessage() async {
    final userQuery = queryController.text;
    if (userQuery.isNotEmpty) {
      // Kullanıcı mesajını listeye ekle
      setState(() {
        messages.add(Message(text: userQuery, isUserMessage: true));
      });

      final url = 'http://10.0.2.2:5000/api/answer?query=$userQuery';
      try {
        final data = await fetchdata(url);
        final decoded = jsonDecode(data).toString();

        // Bot cevabını listeye ekle
        setState(() {
          messages.add(Message(text: decoded));
          queryController.clear();
        });
      } catch (e) {
        print("Error fetching data: $e");
      }
    }
  }
}
