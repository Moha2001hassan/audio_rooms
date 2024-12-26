import 'package:flutter/material.dart';

class GiftBottomSheet extends StatelessWidget {
  final void Function(String) onHourSelected;

  const GiftBottomSheet({super.key, required this.onHourSelected});

  @override
  Widget build(BuildContext context) {
    final List<String> hours = [
      "10:00 AM",
      "11:00 AM",
      "12:00 PM",
      "1:00 PM",
      "2:00 PM",
      "3:00 PM",
      "4:00 PM",
    ];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: hours.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(hours[index]),
          onTap: () {
            onHourSelected(hours[index]);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}