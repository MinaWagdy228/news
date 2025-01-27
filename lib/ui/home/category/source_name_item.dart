import 'package:flutter/material.dart';
import 'package:news/utils/app_styles.dart';
import '../../../model/SourceResponse.dart';

class SourceNameItem extends StatelessWidget {
  Source source;
  bool isSelected;
  SourceNameItem({required this.source, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Text(source.name ?? '',
        style: isSelected
            ? Theme.of(context).textTheme.labelLarge
            : Theme.of(context).textTheme.labelMedium);
  }
}
