import 'package:flutter/material.dart';

class UserRoomContainer extends StatelessWidget {
  const UserRoomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 85,
            width: double.infinity * 0.6,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Text(
                        'Mohamed Hassan Room',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Live description Live description Live description',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.person, color: Colors.white, size: 20),
                  Text('56', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          Positioned(
            top: -26,
            left: 0,
            right: 0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://pixlr.com/images/generator/how-to-generate.webp',
                  fit: BoxFit.cover,
                  width: 54,
                  height: 54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
