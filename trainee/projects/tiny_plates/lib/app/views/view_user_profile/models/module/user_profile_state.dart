import 'package:tiny_plates/app/views/view_user_profile/models/module/child_profile.dart';

abstract class UserProfileState {}

class UserProfileInitialState extends UserProfileState {}

class UserProfileStepState extends UserProfileState {
  UserProfileStepState({
    required this.currentStep,
    required this.profile,
  });

  final int currentStep;
  final ChildProfile profile;
}

class UserProfileSavingState extends UserProfileState {
  UserProfileSavingState({required this.profile});

  final ChildProfile profile;
}

class UserProfileSavedState extends UserProfileState {
  UserProfileSavedState({
    required this.profile,
    this.guidanceTip,
  });

  final ChildProfile profile;
  final String? guidanceTip;
}

class UserProfileErrorState extends UserProfileState {
  UserProfileErrorState(this.message);

  final String message;
}
