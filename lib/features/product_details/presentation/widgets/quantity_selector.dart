import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final Function(int) onChanged;

  const QuantitySelector({super.key, required this.onChanged});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int count = 1;
  void _updateCount(int newValue) {
    setState(() {
      count = newValue;
    });
    widget.onChanged(count); 
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "الكمية",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$count",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF1F8F1), 
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add, size: 18, color: Color(0xFF2E7D32)),
                    onPressed: () {
                      _updateCount(count + 1);
                    },
                  ),
                  Text("$count", style: const TextStyle(fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.remove, size: 18, color: Color(0xFF2E7D32)),
                    onPressed: () {
                      if (count > 1) {
                        _updateCount(count - 1);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("أقل كمية هي قطعة واحدة", textAlign: TextAlign.right),
                            backgroundColor: Colors.redAccent,
                            duration: Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}