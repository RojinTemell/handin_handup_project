import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../blocs/bottom_sheet.dart';
import '../model/info_model.dart';
import '../services/auth_service.dart';
import '../widget/csc_picker.dart';
import '../widget/grid_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final BottomSheetBloc bottomSheetBloc = BottomSheetBloc();
    return BlocProvider(
      create: (context) => bottomSheetBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HandIn HandUp'),
          leading: IconButton(
              onPressed: () {
                context.read<BottomSheetBloc>().showBottomSheet(
                      context: context,
                      widget: const CscPicker(),
                    );
              },
              icon: const Icon(
                Icons.location_on,
                color: Color.fromARGB(255, 228, 82, 9),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: StreamBuilder<QuerySnapshot>(
              stream: _firebaseFirestore.collection('infos').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text(
                    'Error',
                    style: TextStyle(color: Colors.white),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading');
                }

                List<QueryDocumentSnapshot<Object?>> data = snapshot.data!.docs;

                return GridView.builder(
                    itemCount: data.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      Map<String, dynamic> datas =
                          data[index].data() as Map<String, dynamic>;
                     

                      return GridCard(
                        userName: datas['userName'],
                        text: datas['info'],
                        city: datas['city'],
                        state: datas['state'],
                         userId: datas['userId'],
                      );
                    });
              }),
        ),
      ),
    );
  }
}
