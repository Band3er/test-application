import 'package:flutter/material.dart';
import 'package:test_application/features/color_changer/presentation/utils/color_utils.dart';

/// A bottom sheet widget that displays the history of colors.
///
/// Allows the user to tap a color to reapply it to the main screen.
class ColorHistoryBottomSheet extends StatelessWidget {
  /// Creates a [ColorHistoryBottomSheet].
  ///
  /// Requires a list of [colors] and a callback [onColorSelected].
  const ColorHistoryBottomSheet({
    required this.colors,
    required this.onColorSelected,
    super.key,
  });

  ///  List of previously used colors.
  final List<Color> colors;

  /// Callback invoked when a color is selected from the list.
  final ValueChanged<Color> onColorSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        final hex = ColorUtils.hexFromColor(color);

        return ListTile(
          leading: CircleAvatar(backgroundColor: color),
          title: Text('#$hex'),
          onTap: () {
            onColorSelected(color);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
