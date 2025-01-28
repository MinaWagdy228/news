import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/category_model.dart';
import 'package:news/ui/home/category/category_details_view_model.dart';
import 'package:news/ui/home/category/cubit/source_states.dart';
import 'package:news/ui/home/category/cubit/source_view_model.dart';
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
  SourceViewModel viewModel = SourceViewModel();
  // CategoryDetailsViewModel? viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    viewModel.getSources(widget.category
        .id); // this line can't be 1st line in the build since we are a stateful widget, as we keep rebuilding the screen, hence infinite loop in our case, but in stateless widget, we good as we don't rebuild the screen
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel, // creates a bloc
      child: BlocBuilder<SourceViewModel, SourceStates>(
        // bloc: viewModel, //used when the rebuild in only in one place, i.e this file for example, but bloc provider widget can share this file to other place in multiProvider widget
        builder: (context, state) {
          if (state is SourceLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          } else if (state is SourceErrorState) {
            return Center(
              child: Column(
                children: [
                  Text(
                    state.errorMessage,
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
          } else if (state is SourceSuccessState) {
            return SourceTabWidget(sourcesList: state.sourcesList);
          } else {
            return Container();
          }
        },
      ),
    );
    // ChangeNotifierProvider( // mvvm provider state management
    //   create: (context) => viewModel,
    //   child: Consumer<CategoryDetailsViewModel>(
    //     builder: (context, viewModel, child) {
    //       if (viewModel.errorMessage != null) {
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text(
    //                 viewModel.errorMessage!,
    //                 style: Theme.of(context).textTheme.headlineLarge,
    //               ),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     viewModel.getSources(widget.category.id);
    //                     // setState(() {});
    //                   },
    //                   child: const Text('Try again'))
    //             ],
    //           ),
    //         );
    //       }
    //       if (viewModel.sourcesList == null) {
    //         return const Center(
    //           child: CircularProgressIndicator(
    //             color: AppColors.greyColor,
    //           ),
    //         );
    //       } else {
    //         return SourceTabWidget(sourcesList: viewModel.sourcesList!);
    //       }
    //     },
    //   )
    //   FutureBuilder<SourceResponse?>(
    //     future: ApiManager.getSources(widget.category.id),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(
    //             color: AppColors.greyColor,
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         // on client side
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text('something went wrong',
    //                   style: Theme.of(context).textTheme.headlineLarge),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     ApiManager.getSources(widget.category.id);
    //                     setState(() {});
    //                   },
    //                   child: const Text('Try again'))
    //             ],
    //           ),
    //         );
    //       } // todo: server => response (success or error)
    //       // todo: server => error
    //       if (snapshot.data!.status != 'ok') {
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text(snapshot.data!.message!),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     ApiManager.getSources(widget.category.id);
    //                     setState(() {});
    //                   },
    //                   child: const Text('Try again'))
    //             ],
    //           ),
    //         );
    //       }
    //       // todo: server => success
    //       var sourcesList = snapshot.data!.sources!;
    //       return SourceTabWidget(sourcesList: sourcesList);
    //     },
    //   );
  }
}
