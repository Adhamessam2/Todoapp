import 'package:flutter/material.dart';
import 'package:todoapp/core/style_manegares/colors.dart';

class SearchFilterBar extends StatelessWidget {
  final String sortBy;
  final ValueChanged<String> onSortChanged;

  const SearchFilterBar({
    super.key,
    required this.sortBy,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          // 🔍 Search
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Search task...",
                  hintStyle: TextStyle(color: Colors.white60),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.white70),
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),

          // ⏬ Dropdown
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Appcolors.navyblue,
                style: const TextStyle(color: Colors.white),
                icon: const Icon(
                  Icons.arrow_drop_down_circle_rounded,
                  color: Appcolors.navyblue,
                ),
                value: sortBy,
                items: const [
                  DropdownMenuItem(value: "Date", child: Text("Sort By: Date")),
                  DropdownMenuItem(
                    value: "Title",
                    child: Text("Sort By: Title"),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) onSortChanged(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
