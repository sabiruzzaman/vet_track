import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CustomDropdownWidget extends StatefulWidget {
  final List<Map<String, String>> items;
  final String? initialValue;
  final ValueChanged<String> onSelected;
  final String? Function(String?)? validator;

  const CustomDropdownWidget({
    Key? key,
    required this.items,
    this.initialValue,
    required this.onSelected,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomDropdownWidget> createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  static _CustomDropdownWidgetState? _activeDropdown;

  late Map<String, String> selectedItem;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool isExpanded = false;
  String? errorText;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.items.firstWhere(
      (item) => item['value'] == widget.initialValue,
      orElse: () => widget.items.first,
    );
  }

  void _validate(String? value) {
    if (widget.validator != null) {
      final result = widget.validator!(value);
      setState(() {
        errorText = result;
      });
    }
  }

  void _toggleDropdown() {
    if (isExpanded) {
      closeDropdown();
    } else {
      _activeDropdown?.closeDropdown(); // Close other dropdowns
      _showOverlay();
      _activeDropdown = this;
      setState(() {
        isExpanded = true;
      });
    }
  }

  void _showOverlay() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                closeDropdown();
              },
              child: Container(),
            ),
          ),

          Positioned(
            left: offset.dx,
            top: offset.dy + size.height, // ফিল্ডের ঠিক নিচে
            width: size.width,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height),
              // আর কোনো অতিরিক্ত অফসেট না দিবেন
              child: Material(
                elevation: 4,
                color: isDark ? AppColors.black : AppColors.white,
                borderRadius: BorderRadius.circular(8),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: widget.items.map((item) {
                    return ListTile(
                      title: Text(item['label']!),
                      onTap: () {
                        setState(() {
                          selectedItem = item;
                        });
                        widget.onSelected(item['value']!);
                        _validate(item['value']);
                        closeDropdown();
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void closeDropdown() {
    if (isExpanded) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      setState(() {
        isExpanded = false;
      });

      if (_activeDropdown == this) {
        _activeDropdown = null;
      }
    }
  }

  @override
  void dispose() {
    closeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _toggleDropdown,
            child: Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: errorText != null
                      ? Colors.red
                      : (isExpanded
                            ? AppColors.primaryGreen
                            : Colors.grey.shade300),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedItem['label'] ?? '',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: AppColors.green,
                  ),
                ],
              ),
            ),
          ),
          if (errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                errorText!,
                style: const TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
