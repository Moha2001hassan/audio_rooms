import 'package:flutter/material.dart';
import '../controller/rooms_cubit.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.searchController,
    required this.roomsCubit,
  });

  final TextEditingController searchController;
  final RoomsCubit roomsCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TextField(
        controller: searchController,
        onChanged: roomsCubit.filterUsers,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Search by Host ID",
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}