import 'package:flutter/material.dart';

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 15),
      child: Card(
        child: ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.red,
          ),
          title: const Text('R** T**'),
          subtitle: const Text('İzmir/Foça'),
          trailing: IconButton(
              onPressed: () {}, icon: const Icon(Icons.chevron_right)),
        ),
      ),
    );
  }
}