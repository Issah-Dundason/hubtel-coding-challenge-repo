import 'package:flutter/material.dart';

// This widget represents the bottom navigation
class MyAppBottomNavBar extends StatefulWidget {
  const MyAppBottomNavBar({
    super.key,
    required this.onPageChange,
    required this.currentPage,
  });

  final Function(int page) onPageChange;
  final int currentPage;

  @override
  State<MyAppBottomNavBar> createState() => _MyAppBottomNavBarState();
}

class _MyAppBottomNavBarState extends State<MyAppBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                HomeButton(onTap: () {
                  widget.onPageChange(0);
                }),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 1,
                  height: 50,
                  color: Colors.grey,
                )
              ],
            ),
            BottomNavIcon(
              label: 'Send',
              iconData: Icons.send_time_extension,
              selected: widget.currentPage == 1,
              onTap: () {
                widget.onPageChange(1);
              },
            ),
            BottomNavIcon(
              label: 'History',
              iconData: Icons.history,
              selected: widget.currentPage == 2,
              onTap: () {
                widget.onPageChange(2);
              },
            ),
            BottomNavIcon(
              label: 'Scheduled',
              iconData: Icons.history,
              selected: widget.currentPage == 3,
              onTap: () {
                widget.onPageChange(3);
              },
            ),
          ],
        ));
  }
}

// This represents the bottom nav home button
class HomeButton extends StatelessWidget {
  const HomeButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap, child: const CircleAvatar(child: Icon(Icons.home)));
  }
}

// This widget represents the other widget in the nav bar
class BottomNavIcon extends StatelessWidget {
  const BottomNavIcon(
      {super.key,
      required this.label,
      required this.iconData,
      required this.onTap,
      this.selected = false});

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    const textStyle =
        TextStyle(fontWeight: FontWeight.bold, color: Colors.grey);
    const selectedTextStyle = TextStyle(fontWeight: FontWeight.bold);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: selected ? Colors.black : Colors.grey,
          ),
          const SizedBox(height: 5),
          Text(label, style: selected ? selectedTextStyle : textStyle),
        ],
      ),
    );
  }
}
