import 'package:flutter/material.dart';
import '../controller/gifts_data.dart';
import '../models/gift.dart';
import 'gift_dialog.dart';

class GiftBottomSheet extends StatelessWidget {
  final void Function(String) onSuccess;
  final String hostUID;

  const GiftBottomSheet({
    super.key,
    required this.onSuccess,
    required this.hostUID,
  });

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
        itemCount: GiftsData().gifts.length,
        itemBuilder: (context, index) {
          return GiftButton(
            gift: GiftsData().gifts[index],
            hostUID: hostUID,
            onSuccess: onSuccess,
          );
        },
      ),
    );
  }
}

class GiftButton extends StatelessWidget {
  const GiftButton({
    super.key,
    required this.gift,
    required this.hostUID,
    required this.onSuccess,
  });

  final GiftModel gift;
  final String hostUID;
  final void Function(String) onSuccess;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade400,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          showGiftDialog(
            context: context,
            body: 'Are you sure you want to give this gift to the host?',
            image: gift.img,
            approved: () async {
              var result =
                  await GiftsData().sendGift(context, gift.price, 'hostUID');
              if (result) {
                onSuccess;
              }
            },
          );
        },
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Image.asset(gift.img),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Center(child: Text('${gift.price} \$')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
