import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../constants/enums.dart';
import '../../helpers/base_view_model.dart' as vm;

class ViewModelSkeleton<T extends vm.BaseViewModel> extends StatelessWidget {
  final Function(T viewModel)? builder;
  final T? viewModel;

  const ViewModelSkeleton(
      {Key? key, required this.builder, required this.viewModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => viewModel!,
        onModelReady: (T model) => model.initProvider(),
        builder: (_, T model, __) => model.providerState == ProviderState.busy
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.green,
                ),
              )
            : builder!(model));
  }
}
