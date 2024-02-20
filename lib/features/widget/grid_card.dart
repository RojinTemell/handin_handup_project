import 'package:flutter/material.dart';
import 'package:handinhandup/features/mixin/navigate_mixin.dart';

import '../view/chat_page.dart';

class GridCard extends StatelessWidget with NavigatorManager {
  const GridCard(
      {super.key,
      required this.userName,
      required this.userId,
      required this.text,
      required this.city,
      required this.state});
  final String userName;
  final String userId;
  final String text;
  final String city;
  final String state;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Center(
        child: Card(
          color: const Color.fromARGB(255, 251, 249, 249),
          child: SizedBox(
            width: width * 0.45,
            height: height * 0.32,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(userName),
                      InkWell(
                        onTap: () {
                          navigateToWidget(
                              context,
                              ChatScreen(
                                receiverName: userName,
                                receiverId: userId,
                              ));
                        },
                        splashColor: Colors
                            .transparent, // Tıklama efektini kaldırmak için
                        highlightColor: Colors.transparent,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.red,
                            child: SizedBox(
                                width: 30,
                                height: 30,
                                child: Icon(
                                  Icons.message_outlined,
                                  size: 19,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    overflow: TextOverflow
                        .clip, // Metin sınırları içinde kalacak, kesilmeden aşağı doğru genişleyecek
                    maxLines:
                        null, // Metinin kaç satıra kadar genişleyebileceğini belirtir. null kullanarak sınırsız yapabilirsiniz.
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text('$state/$city')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
