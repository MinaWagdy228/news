import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/ui/home/category/source_tab_widget.dart';
import 'package:news/ui/home/news/news_item.dart';
import 'package:news/ui/home/news/news_widget_view_model.dart';
import 'package:news/utils/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../model/SourceResponse.dart';

class NewsWidget extends StatefulWidget {
  Source? source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source?.id ?? '');
  }

  NewsWidgetViewModel viewModel = NewsWidgetViewModel();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<NewsWidgetViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.errorMessage != null) {
              //error
              return Center(
                child: Column(
                  children: [
                    Text(viewModel.errorMessage!,
                        style: Theme.of(context).textTheme.headlineLarge),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.getNewsBySourceId(widget.source?.id ?? '');
                        },
                        child: Text(
                          'Try again',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ))
                  ],
                ),
              );
            } else if (viewModel.newsList == null) {
              //loading
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.greyColor,
                ),
              );
            } else {
              //get content
              return ListView.builder(
                itemBuilder: (context, index) {
                  return NewsItem(news: viewModel.newsList![index]);
                },
                itemCount: viewModel.newsList!.length,
              );
            }
          },
        )
        // FutureBuilder<NewsResponse?>(
        //   future: ApiManager.getNewsBySourceId(widget.source?.id ?? ''),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //         child: CircularProgressIndicator(
        //           color: AppColors.greyColor,
        //         ),
        //       );
        //     } else if (snapshot.hasError) {
        //       // on client side
        //       return Center(
        //         child: Column(
        //           children: [
        //             Text('something went wrong',
        //                 style: Theme.of(context).textTheme.headlineLarge),
        //             ElevatedButton(
        //                 onPressed: () {
        //                   ApiManager.getNewsBySourceId(widget.source?.id ?? '');
        //                   setState(() {});
        //                 },
        //                 child: Text(
        //                   'Try again',
        //                   style: Theme.of(context).textTheme.headlineLarge,
        //                 ))
        //           ],
        //         ),
        //       );
        //     } // todo: server => response (success or error)
        //     // todo: server => error
        //     if (snapshot.data!.status != 'ok') {
        //       return Center(
        //         child: Column(
        //           children: [
        //             Text(snapshot.data!.message!),
        //             ElevatedButton(
        //                 onPressed: () {
        //                   ApiManager.getNewsBySourceId(widget.source?.id ?? '');
        //                   setState(() {});
        //                 },
        //                 child: const Text('Try again'))
        //           ],
        //         ),
        //       );
        //     }
        //     // todo: server => success
        //     var newsList = snapshot.data!.articles!;
        //     return ListView.builder(
        //       itemBuilder: (context, index) {
        //         return NewsItem(news: newsList[index]);
        //       },
        //       itemCount: newsList.length,
        //     );
        //   },
        // ),
        );
  }
}
