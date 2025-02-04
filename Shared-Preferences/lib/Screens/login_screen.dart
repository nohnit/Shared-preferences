import 'package:flutter/material.dart';
import 'package:yeni_proje/Screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _epostaController = TextEditingController();
  final _sifreController = TextEditingController();

  void _saveUserToDevice() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("eposta", _epostaController.text);
    prefs.setString("sifre", _sifreController.text);
  }

  void _checkUserFromDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final String? eposta = prefs.getString("eposta");
    final String? sifre = prefs.getString("sifre");
    if (eposta != null && sifre != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    }
  }

  @override
  void initState() {
    _checkUserFromDevice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: Column(
            children: [
              TextField(
                controller: _epostaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _sifreController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    _saveUserToDevice();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text('Giris Yap'))
            ],
          ),
        ),
      ),
    );
  }
}
