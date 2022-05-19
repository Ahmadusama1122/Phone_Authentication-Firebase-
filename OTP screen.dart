import 'package:flutter/material.dart';
//import 'package:pinput/pinput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:messenger_app/Homepage.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_core/firebase_core.dart';

class otp_screen extends StatefulWidget {
   final String phone;
   otp_screen(this.phone);
  @override
  State<otp_screen> createState() => _otp_screenState();
}
class _otp_screenState extends State<otp_screen> {
  final GlobalKey<ScaffoldState> _scaffoldkey=GlobalKey<ScaffoldState>();
  String _verificationcode='';
    final BoxDecoration PinPutdecoration=BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.black
      )
    );

  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 70,left: 30,right: 30),
                child: Text('Verifying this number +92- ${widget.phone}',style: TextStyle(color: Colors.black,fontSize: 20),),
              ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 50),
                child: PinPut(
                  fieldsCount:6,
                  textStyle: TextStyle(color: Colors.black,fontSize: 25),
                  eachFieldWidth: 40.0,
                  eachFieldHeight: 55.0,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: PinPutdecoration,
                  selectedFieldDecoration: PinPutdecoration,
                  followingFieldDecoration: PinPutdecoration,
                  pinAnimationType: PinAnimationType.fade,
                  onSubmit: (pin) async{
                    try{
                      await FirebaseAuth.instance.signInWithCredential
                        (PhoneAuthProvider.credential(verificationId: _verificationcode,
                          smsCode: pin)).then((value) async{
                        if(value.user!=null){
                          print('login suscess');
                          Get.to(Mainscreen());
                        }
                      });
                    }
                    catch(e){
                      FocusScope.of(context).unfocus();
                      _scaffoldkey.currentState?.showSnackBar(SnackBar(content: Text('Invalid otp'),));
                    }
                  },
                )
              )
            ],
          )
        ],
      ),
    );
  }
  _verifyphone() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+92${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential)async{
          await FirebaseAuth.instance.signInWithCredential(credential).then((value) async{
            if(value.user != null){
              print('User logged in');
              Get.to(Mainscreen());
            }
          });
        },
        verificationFailed: (FirebaseAuthException e){
          print(e.message);
        },
        codeSent:(String verificationid,int? resendtoken){
          setState((){
            _verificationcode=verificationid;
          });
          },
        codeAutoRetrievalTimeout: (String verificationid){
        setState((){
        _verificationcode=verificationid;
         });
    },
        timeout: Duration(seconds: 60));
  }
  @override
  void initstate(){
    super.initState();
      _verifyphone();
  }
}
