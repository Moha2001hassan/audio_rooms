import 'package:audio_rooms/core/helpers/show_snack_bar.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/image_strings.dart';
import '../models/gift.dart';
import 'rooms_controller.dart';

class GiftsData {
  RoomsController roomsController = RoomsController();
  final List<GiftModel> gifts = [
    GiftModel(img: Gift.redRibbon, name: 'Red Ribbon', price: 0.1),
    GiftModel(img: Gift.heart, name: 'Heart', price: 0.3),
    GiftModel(img: Gift.star, name: 'Star', price: 0.5),
    GiftModel(img: Gift.flowers, name: 'Flowers', price: 0.7),
    GiftModel(img: Gift.cupcake, name: 'Cupcake', price: 1.0),
    GiftModel(img: Gift.diamond, name: 'Ring', price: 1.3),
    GiftModel(img: Gift.crown, name: 'Crown', price: 1.7),
    GiftModel(img: Gift.treasure, name: 'Treasure', price: 2.0),
    GiftModel(img: Gift.car, name: 'Car', price: 2.5),
  ];


  Future<bool> sendGift(BuildContext context, double giftPrice, String hostUID) async {
    double userDollars = await roomsController.getDollarsNumber() ?? 0.0;
    if (userDollars >= giftPrice) {
      // Minus the gift price from the user's dollars
      var update = await roomsController.updateDollarsNumber(userDollars - giftPrice);
      if(update == false) {
        showSnackBar("There was an error", Colors.red, context);
        return false;
      } else {
        // Add the gift price to the host's dollars
        var hostDollars = await roomsController.getHostDollarsNumber(hostUID) ?? 0.0;
        await roomsController.updateHostDollarsNumber(giftPrice/2 + hostDollars, hostUID);
        showSnackBar("Gift sent successfully", Colors.green, context);
        return true;
      }
    } else {
      showSnackBar("Your balance is not enough", Colors.red, context);
      return false;
    }
  }

}

