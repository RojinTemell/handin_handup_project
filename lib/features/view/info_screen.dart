import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:handinhandup/features/services/info_service.dart';
import 'package:handinhandup/features/view/home_sceen.dart';
import 'package:handinhandup/features/view/signup_screen.dart';
import 'package:handinhandup/features/widget/widget.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _infoController = TextEditingController();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";

  Future<void> info() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.infoo(
          countryValue, stateValue, cityValue, _infoController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundImageWidget(
          url:
              'https://www.shutterstock.com/shutterstock/photos/1588320151/display_1500/stock-photo-help-concept-hands-reaching-out-to-help-each-other-in-dark-tone-1588320151.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: size.width * 0.03),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                            },
                            child: const Text(
                              'next',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 234, 140, 0),
                                  fontSize: 18),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    const Text(
                      'If you need help please thhis page',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    CSCPicker(
                      onCountryChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
                      },
                      onStateChanged: (value) {
                        if (value != null) {
                          setState(() {
                            stateValue = value;
                          });
                        }
                      },
                      onCityChanged: (value) {
                        if (value != null) {
                          setState(() {
                            cityValue = value;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextFormField(
                        maxLines: 5,
                        controller: _infoController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          border: InputBorder.none,
                          hintText: 'Introduce yourself ',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen alanı doldurun';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 40),
                      child: SizedBox(
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  info();
                                  final currentUserId =
                                      _firebaseAuth.currentUser!.uid;
                                  Future<DocumentSnapshot<Map<String, dynamic>>>
                                      user = _firebaseFirestore
                                          .collection('users')
                                          .doc(currentUserId)
                                          .get();
                                  DocumentSnapshot<Map<String, dynamic>>
                                      userdoc = user as DocumentSnapshot<
                                          Map<String, dynamic>>;
                                  Map<String, dynamic> userData =
                                      userdoc.data()!;

                                  //  DocumentSnapshot  name= _firebaseFirestore.collection('users').doc(currentUserId).get() ;
                                  // Firestore'a veriyi ekleyin
                                  _firebaseFirestore.collection('infos').add({
                                    'userId': currentUserId,
                                    'userName': userData['name'],
                                    'country': countryValue,
                                    'state': stateValue,
                                    'city': cityValue,
                                    'info': _infoController.text,
                                  }).then((value) {
                                    // Veri başarıyla eklendiyse burada işlem yapabilirsiniz
                                    print('Veri başarıyla eklendi');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen()),
                                    );
                                  }).catchError((error) {
                                    // Hata durumunda burada işlem yapabilirsiniz
                                    print('Hata: $error');
                                  });
                                  // Kullanıcının seçtiği ülke, şehir ve text field verisi
                                  // final currentUserId =
                                  //     _firebaseAuth.currentUser!.uid;
                                  //   //  DocumentSnapshot  name= _firebaseFirestore.collection('users').doc(currentUserId).get() ;
                                  // // Firestore'a veriyi ekleyin
                                  // _firebaseFirestore.collection('infos').add({
                                  //   'userId': currentUserId,
                                  //   'country': countryValue,
                                  //   'state': stateValue,
                                  //   'city': cityValue,
                                  //   'info': _infoController.text,
                                  // }).then((value) {
                                  //   // Veri başarıyla eklendiyse burada işlem yapabilirsiniz
                                  //   print('Veri başarıyla eklendi');
                                  // }).catchError((error) {
                                  //   // Hata durumunda burada işlem yapabilirsiniz
                                  //   print('Hata: $error');
                                  // });

                                  // // Başka bir sayfaya yönlendirme örneği
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const SignUpScreen()),
                                  // );
                                }

                                // if (formKey.currentState!.validate()) {}
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor:
                                    const Color.fromARGB(255, 228, 82, 9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: const Text(
                                'Send',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ))),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
