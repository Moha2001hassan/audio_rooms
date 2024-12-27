import 'package:flutter/material.dart';

class GiftBottomSheet extends StatelessWidget {
  final void Function(String) onHourSelected;

  const GiftBottomSheet({super.key, required this.onHourSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 25),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 5 items per row
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return const GiftButton();

          // return ListTile(
          //   title: Text(hours[index]),
          //   onTap: () {
          //     onHourSelected(hours[index]);
          //     Navigator.pop(context);
          //   },
          // );
        },
      ),
    );
  }
}

class GiftButton extends StatelessWidget {
  const GiftButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade400,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: (){},
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Image.asset('assets/icons/prize_icon.png'),
        ),
      ),
    );
  }
}
