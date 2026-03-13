import 'package:flutter/material.dart';
import 'package:masterfabric_core/masterfabric_core.dart' hide LoadingType;
import 'package:osmea_components/osmea_components.dart';
import 'package:tiny_plates/app/views/view_user_profile/models/user_profile_view_model.dart';
import 'package:tiny_plates/app/views/view_user_profile/models/module/user_profile_state.dart';
import 'package:tiny_plates/app/views/view_user_profile/widgets/profile_stepper_content.dart';

class UserProfileView
    extends MasterViewHydratedCubit<UserProfileViewModel, UserProfileState> {
  UserProfileView({
    super.key,
    super.arguments,
    super.currentView,
    super.snackBarFunction,
    super.appBarPadding = const AppBarPaddingVisibility.disabled(),
    super.navbarSpacer = const SpacerVisibility.disabled(),
    super.footerSpacer = const SpacerVisibility.disabled(),
    super.verticalPadding = const PaddingVisibility.disabled(),
    super.horizontalPadding = const PaddingVisibility.disabled(),
    required super.goRoute,
  });

  @override
  void initialContent(
      UserProfileViewModel viewModel, BuildContext context) {
    viewModel.setGoRoute(goRoute);
    viewModel.initialize();
  }

  @override
  Widget viewContent(
    BuildContext context,
    UserProfileViewModel viewModel,
    UserProfileState state,
  ) {
    if (state is UserProfileInitialState) {
      return OsmeaComponents.center(
        child: OsmeaComponents.loading(
          type: LoadingType.rotatingDots,
          size: 36,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }

    return ProfileStepperContent(viewModel: viewModel, state: state);
  }
}
