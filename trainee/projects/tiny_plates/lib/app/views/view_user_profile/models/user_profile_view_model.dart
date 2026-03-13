import 'package:injectable/injectable.dart';
import 'package:masterfabric_core/masterfabric_core.dart';
import 'package:tiny_plates/app/core/services/texture_guidance_service.dart';
import 'package:tiny_plates/app/views/view_user_profile/models/module/child_profile.dart';
import 'package:tiny_plates/app/views/view_user_profile/models/module/user_profile_state.dart';

@injectable
class UserProfileViewModel
    extends BaseViewModelHydratedCubit<UserProfileState> {
  UserProfileViewModel() : super(UserProfileInitialState());

  static const int totalSteps = 4;

  ChildProfile _profile = ChildProfile.empty();
  int _currentStep = 0;

  int get currentStep => _currentStep;

  void Function(String route)? _goRoute;
  void setGoRoute(void Function(String route)? fn) => _goRoute = fn;

  // ─── Lifecycle ────────────────────────────────────────────────────────────

  void initialize() {
    _currentStep = 0;
    emit(UserProfileStepState(currentStep: _currentStep, profile: _profile));
  }

  // ─── Navigation ────────────────────────────────────────────────────────────

  void nextStep() {
    if (_currentStep < totalSteps - 1) {
      _currentStep++;
      emit(UserProfileStepState(currentStep: _currentStep, profile: _profile));
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      emit(UserProfileStepState(currentStep: _currentStep, profile: _profile));
    }
  }

  // ─── Step 1: Age ──────────────────────────────────────────────────────────

  void updateAgeMonths(int months) {
    _profile = _profile.copyWith(ageMonths: months.clamp(0, 36));
    emit(UserProfileStepState(currentStep: _currentStep, profile: _profile));
  }

  // ─── Step 2: Allergies ────────────────────────────────────────────────────

  void toggleAllergy(String allergy) {
    final updated = List<String>.from(_profile.allergies);
    if (updated.contains(allergy)) {
      updated.remove(allergy);
    } else {
      updated.add(allergy);
    }
    _profile = _profile.copyWith(allergies: updated);
    emit(UserProfileStepState(currentStep: _currentStep, profile: _profile));
  }

  // ─── Step 3: Chewing & Texture ────────────────────────────────────────────

  void setChewingLevel(ChewingLevel level) {
    _profile = _profile.copyWith(chewingLevel: level);
    emit(UserProfileStepState(currentStep: _currentStep, profile: _profile));
  }

  void setTextureTolerance(TextureToleranceLevel level) {
    _profile = _profile.copyWith(textureToleranceLevel: level);
    emit(UserProfileStepState(currentStep: _currentStep, profile: _profile));
  }

  // ─── Step 4: Special Conditions & Sensory ────────────────────────────────

  void setIsPremature(bool value) {
    _profile = _profile.copyWith(isPremature: value);
    emit(UserProfileStepState(currentStep: _currentStep, profile: _profile));
  }

  void setSpecialDietaryNeeds(String value) {
    _profile = _profile.copyWith(specialDietaryNeeds: value);
    emit(UserProfileStepState(currentStep: _currentStep, profile: _profile));
  }

  void setFoodIntolerances(String value) {
    _profile = _profile.copyWith(foodIntolerances: value);
    emit(UserProfileStepState(currentStep: _currentStep, profile: _profile));
  }

  void toggleSensoryPreference(String pref) {
    final updated = List<String>.from(_profile.sensoryPreferences);
    if (updated.contains(pref)) {
      updated.remove(pref);
    } else {
      updated.add(pref);
    }
    _profile = _profile.copyWith(sensoryPreferences: updated);
    emit(UserProfileStepState(currentStep: _currentStep, profile: _profile));
  }

  // ─── Save & Guidance ─────────────────────────────────────────────────────

  Future<void> saveProfile() async {
    emit(UserProfileSavingState(profile: _profile));
    try {
      final tip = await TextureGuidanceService().fetchGuidance(
        ageMonths: _profile.ageMonths,
        textureLevel: _profile.textureToleranceLevel.name,
      );
      emit(UserProfileSavedState(profile: _profile, guidanceTip: tip));
    } catch (_) {
      emit(UserProfileSavedState(profile: _profile));
    }
  }

  void continueToHome() => _goRoute?.call('/home');

  // ─── Hydration ────────────────────────────────────────────────────────────

  @override
  UserProfileState? fromJson(Map<String, dynamic> json) {
    try {
      final profile =
          ChildProfile.fromJson(json['profile'] as Map<String, dynamic>);
      _profile = profile;
      _currentStep = 0;
      return UserProfileStepState(currentStep: 0, profile: profile);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(UserProfileState state) {
    if (state is UserProfileSavedState) {
      return {'profile': state.profile.toJson()};
    }
    if (state is UserProfileStepState) {
      return {'profile': state.profile.toJson()};
    }
    return null;
  }
}
