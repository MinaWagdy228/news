import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/category/source_name_item.dart';
import 'package:news/ui/home/news/news_widget.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source> sourcesList;

  SourceTabWidget({required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
                dividerColor: Colors.transparent,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                indicatorColor: Theme.of(context).indicatorColor,
                tabs: widget.sourcesList.map((source) {
                  return SourceNameItem(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourcesList.indexOf(source));
                }).toList()),
            Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex] ))
          ],
        ));
  }
}
