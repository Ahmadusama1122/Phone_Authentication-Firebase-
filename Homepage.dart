import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  String user_id='';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Text(user_id),
    );
  }
  @override
  void initstate(){
    super.initState();
    user_id=FirebaseAuth.instance.currentUser!.uid;
  }
}
