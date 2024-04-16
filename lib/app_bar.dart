import 'package:flutter/material.dart';

// This class represents the history app bar in the application
class HistoryAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HistoryAppBar({super.key});

  @override
  State<HistoryAppBar> createState() => _HistoryAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(172);
}

class _HistoryAppBarState extends State<HistoryAppBar> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: HistoryAppBarToggle(),
        ),
        const SizedBox(height: 10),
        Divider(),
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      isDense: false,
                      filled: true,
                      contentPadding: EdgeInsets.zero,
                      fillColor: const Color(0xFFDEDEDE),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(Icons.menu)
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    ));
  }
}

// This widget represents the history and transaction summary buttons you toggle between
class HistoryAppBarToggle extends StatelessWidget {
  const HistoryAppBarToggle({super.key});

  @override
  Widget build(BuildContext context) {
    const selectedColor = Colors.white;
    const selectedTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
    );
    const normalTextStyle = TextStyle(color: Colors.grey);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFDEDEDE),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: selectedColor),
                child: Center(
                    child: Text(
                  'History',
                  style: selectedTextStyle,
                ))),
          ),
          const SizedBox(width: 10),
          Expanded(
              child: Text(
            'Transaction Summary',
            style: normalTextStyle,
          )),
        ],
      ),
    );
  }
}
