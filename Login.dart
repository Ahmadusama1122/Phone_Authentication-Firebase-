import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messenger_app/OTP%20screen.dart';

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Text(
                    'Phone Authentication',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  )),
              Container(
                margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Phone number',
                      prefix: Padding(
                        padding: EdgeInsets.all(4),
                        child: Text('+92'),
                      )),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  controller: _controller,
                ),
              ),
              Container(
                width: 200,
                height: 50,
                margin: EdgeInsets.only(top: 60),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.grey),
                  onPressed: () {
                    Get.to(otp_screen(_controller.text));
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
