import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/category_model.dart';
import 'package:news/ui/home/category/category_details_view_model.dart';
import 'package:news/ui/home/category/source_tab_widget.dart';
import 'package:news/utils/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../model/SourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category details';
  CategoryModel category;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel? viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    viewModel?.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryDetailsViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.errorMessage != null) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      viewModel.errorMessage!,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.getSources(widget.category.id);
                          // setState(() {});
                        },
                        child: const Text('Try again'))
                  ],
                ),
              );
            }
            if (viewModel.sourcesList == null) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.greyColor,
                ),
              );
            } else {
              return SourceTabWidget(sourcesList: viewModel.sourcesList!);
            }
          },
        )
        // FutureBuilder<SourceResponse?>(
        //   future: ApiManager.getSources(widget.category.id),
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
        //                   ApiManager.getSources(widget.category.id);
        //                   setState(() {});
        //                 },
        //                 child: const Text('Try again'))
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
        //                   ApiManager.getSources(widget.category.id);
        //                   setState(() {});
        //                 },
        //                 child: const Text('Try again'))
        //           ],
        //         ),
        //       );
        //     }
        //     // todo: server => success
        //     var sourcesList = snapshot.data!.sources!;
        //     return SourceTabWidget(sourcesList: sourcesList);
        //   },
        // ),
        );
  }
}
