import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'function.dart';
import 'home.dart';

// 'WelcomeScreen' sınıfı, uygulamanın karşılama ekranını yöneten bir StatefulWidget'dır.
// Kullanıcıya bir giriş formu sunar ve kullanıcı bilgilerini doğrulamak için bir HTTP isteği gönderir.
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _idController = TextEditingController();
  String _errorMessage = '';
  String url_id = '';
  String output_id = ' ';
  var data;

  // '_checkUserAndNavigate' fonksiyonu, kullanıcı girişini kontrol eder ve doğruysa ana ekrana yönlendirir.
  // Hatalı giriş durumunda hata mesajı gösterir.
  void _checkUserAndNavigate() async {
    final userId = _idController.text;
    try {
      data = await fetchdata(url_id);
      var decoded = jsonDecode(data).toString();
      if (userId == decoded) {
        // Başarılı giriş kontrolü
        setState(() {
          output_id = decoded;
          _errorMessage = ''; // Hata mesajını temizle
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(userId: output_id),
          ),
        );
      } else {
        setState(() {
          _errorMessage = "Kullanıcı ID yanlış. Lütfen tekrar deneyiniz.";
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Kullanıcı ID bulunamadı. Lütfen bir daha deneyiniz.";
      });
    }
  }

  late Size mediaSize;
  late Color myColor;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        backgroundColor: Color(0xff0083FF),
        body: Stack(children: [
          Positioned(top: 80, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  // '_buildTop' fonksiyonu, ekranın üst kısmındaki içeriği oluşturur, örn. bir logo görseli.
  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/odeal_pos.png", height: 300.0),
        ],
      ),
    );
  }

  // '_buildBottom' fonksiyonu, ekranın alt kısmındaki içeriği oluşturur, örn. giriş formunu.
  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  // '_buildForm' fonksiyonu, kullanıcı giriş formunu oluşturur.
  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hoşgeldiniz!",
          style: TextStyle(
              color: myColor, fontSize: 32, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        _buildGreyText(
            "PromoBot ile görüşmek için lütfen kullanıcı ID giriniz."),
        const SizedBox(height: 40),
        _buildGreyText("Kullanıcı ID"),
        _buildInputField(_idController),
        const SizedBox(height: 20),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        if (_errorMessage.isNotEmpty) // Hata mesajını göster
          Text(
            _errorMessage,
            style: TextStyle(color: Colors.red),
          ),
      ],
    );
  }

  // '_buildGreyText' fonksiyonu, belirli metinleri gri renkte göstermek için kullanılır.
  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  // '_buildInputField' fonksiyonu, kullanıcıdan ID girişi almak için bir metin alanı oluşturur.
  Widget _buildInputField(TextEditingController controller) {
    return TextField(
        controller: _idController,
        style: const TextStyle(
          color: Colors.black,
        ),
        onChanged: (value) {
          url_id = 'http://10.0.2.2:5000/api/customerid?query=' + value;
        });
  }

  // '_buildLoginButton' fonksiyonu, kullanıcı girişi için bir buton oluşturur.
  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _checkUserAndNavigate,
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Color(0xff0083FF),
      ),
      child: const Text("KONUŞMAYI BAŞLAT"),
    );
  }
}
