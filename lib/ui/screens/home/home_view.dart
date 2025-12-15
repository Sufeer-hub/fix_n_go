import 'package:fix_n_go/models/RespProducts.dart';
import 'package:fix_n_go/models/User.dart';
import 'package:fix_n_go/ui/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:stacked/stacked.dart';

import '../../tools/model_future_builder.dart';

class Homeview extends StatelessWidget {
  final User user;
  const Homeview({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (model) {
        model.getdata();
      },
      viewModelBuilder: () => HomeViewModel(user),

      builder: (BuildContext context, HomeViewModel viewModel, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("${viewModel.user.name ?? "_not available_"}"),
          ),
          body: ModelFutureListBuilder<Data>(
            busy: viewModel.isBusy,
            data: viewModel.productlist ?? [],
            onRefresh: () => viewModel.getdata(),
            isFullScreen: true,
            hasRefreshButton: true,
            empty: Center(child: Text("No data")),
            // error: Center(child: Text("Something went wrong..!")),
            loading: _loadshimmer(),
            builder: (BuildContext context, List<Data> value, Widget? child) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          "${value[index].imageUrl ?? ""}",
                        ),
                      ),
                      title: Text("${value[index].name ?? "not available"}"),
                      subtitle: Text(
                        "${value[index].description ?? "no description"}",
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget? _loadshimmer() {
    return Shimmer(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage("")),
              title: Container(width: 200, height: 20, color: Colors.grey),
              subtitle: Container(width: 220, height: 14, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
