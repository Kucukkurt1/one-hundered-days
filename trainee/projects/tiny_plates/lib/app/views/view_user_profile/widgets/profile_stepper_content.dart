import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osmea_components/osmea_components.dart';
import 'package:tiny_plates/app/views/view_user_profile/models/module/child_profile.dart';
import 'package:tiny_plates/app/views/view_user_profile/models/module/user_profile_state.dart';
import 'package:tiny_plates/app/views/view_user_profile/models/user_profile_view_model.dart';
import 'package:tiny_plates/gen/strings.g.dart';

// ─── Label helpers ────────────────────────────────────────────────────────────

const _kAllergenLabelsEn = {
  'milk': 'Milk',
  'egg': 'Egg',
  'peanut': 'Peanut',
  'treeNut': 'Tree Nut',
  'wheat': 'Wheat',
  'soy': 'Soy',
  'fish': 'Fish',
  'shellfish': 'Shellfish',
};

const _kAllergenLabelsTr = {
  'milk': 'Süt',
  'egg': 'Yumurta',
  'peanut': 'Yer Fıstığı',
  'treeNut': 'Sert Kabuklu Yemiş',
  'wheat': 'Buğday',
  'soy': 'Soya',
  'fish': 'Balık',
  'shellfish': 'Kabuklu Deniz Ürünü',
};

const _kChewingLabelsEn = {
  'none': 'None – liquid only',
  'minimal': 'Minimal – very soft',
  'soft': 'Soft – mashed foods',
  'moderate': 'Moderate – soft pieces',
  'full': 'Full – normal chewing',
};

const _kChewingLabelsTr = {
  'none': 'Hiç – yalnızca sıvı',
  'minimal': 'Minimal – çok yumuşak',
  'soft': 'Yumuşak – püre',
  'moderate': 'Orta – yumuşak parçalar',
  'full': 'Tam – normal çiğneme',
};

const _kTextureLabelsEn = {
  'smooth': 'Smooth – purees',
  'mashed': 'Mashed',
  'lumpy': 'Lumpy',
  'chopped': 'Chopped',
  'solid': 'Solid pieces',
};

const _kTextureLabelsTr = {
  'smooth': 'Düzgün – püre',
  'mashed': 'Ezilmiş',
  'lumpy': 'Topak topak',
  'chopped': 'Doğranmış',
  'solid': 'Katı parçalar',
};

const _kSensoryLabelsEn = {
  'smoothTextures': 'Smooth textures',
  'coldFoods': 'Cold foods',
  'warmFoods': 'Warm foods',
  'crunchyTextures': 'Crunchy textures',
  'softFoods': 'Soft foods',
  'sweetFlavors': 'Sweet flavors',
  'mildFlavors': 'Mild flavors',
};

const _kSensoryLabelsTr = {
  'smoothTextures': 'Düzgün dokular',
  'coldFoods': 'Soğuk yiyecekler',
  'warmFoods': 'Sıcak yiyecekler',
  'crunchyTextures': 'Çıtır dokular',
  'softFoods': 'Yumuşak yiyecekler',
  'sweetFlavors': 'Tatlı tatlar',
  'mildFlavors': 'Hafif tatlar',
};

bool _isTurkish(BuildContext context) {
  final locale = Localizations.localeOf(context).languageCode;
  return locale == 'tr';
}

String _allergenLabel(BuildContext context, String key) {
  final map = _isTurkish(context) ? _kAllergenLabelsTr : _kAllergenLabelsEn;
  return map[key] ?? key;
}

String _chewingLabel(BuildContext context, String key) {
  final map = _isTurkish(context) ? _kChewingLabelsTr : _kChewingLabelsEn;
  return map[key] ?? key;
}

String _textureLabel(BuildContext context, String key) {
  final map = _isTurkish(context) ? _kTextureLabelsTr : _kTextureLabelsEn;
  return map[key] ?? key;
}

String _sensoryLabel(BuildContext context, String key) {
  final map = _isTurkish(context) ? _kSensoryLabelsTr : _kSensoryLabelsEn;
  return map[key] ?? key;
}

// ─── Allergen & sensory option lists ─────────────────────────────────────────

const _kAllergens = [
  'milk',
  'egg',
  'peanut',
  'treeNut',
  'wheat',
  'soy',
  'fish',
  'shellfish',
];

const _kSensoryPreferences = [
  'smoothTextures',
  'coldFoods',
  'warmFoods',
  'crunchyTextures',
  'softFoods',
  'sweetFlavors',
  'mildFlavors',
];

// ─── ProfileStepperContent ───────────────────────────────────────────────────

class ProfileStepperContent extends StatelessWidget {
  const ProfileStepperContent({
    super.key,
    required this.viewModel,
    required this.state,
  });

  final UserProfileViewModel viewModel;
  final UserProfileState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (state is UserProfileSavingState) {
      return OsmeaComponents.center(
        child: OsmeaComponents.loading(
          type: LoadingType.rotatingDots,
          size: 40,
          color: theme.colorScheme.primary,
        ),
      );
    }

    if (state is UserProfileSavedState) {
      return _GuidanceScreen(
        state: state as UserProfileSavedState,
        viewModel: viewModel,
      );
    }

    if (state is UserProfileStepState) {
      return _StepperScreen(
        stepState: state as UserProfileStepState,
        viewModel: viewModel,
      );
    }

    return OsmeaComponents.center(
      child: OsmeaComponents.loading(
        type: LoadingType.rotatingDots,
        size: 36,
        color: theme.colorScheme.primary,
      ),
    );
  }
}

// ─── Step screen layout ───────────────────────────────────────────────────────

class _StepperScreen extends StatelessWidget {
  const _StepperScreen({
    required this.stepState,
    required this.viewModel,
  });

  final UserProfileStepState stepState;
  final UserProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final theme = Theme.of(context);
    final isLastStep =
        stepState.currentStep == UserProfileViewModel.totalSteps - 1;
    final progress =
        (stepState.currentStep + 1) / UserProfileViewModel.totalSteps;

    return SafeArea(
      child: Column(
        children: [
          // ── Header ──────────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.fromLTRB(
              context.spacing24,
              context.spacing16,
              context.spacing24,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OsmeaComponents.text(
                  t.profileSetupTitle,
                  variant: OsmeaTextVariant.headlineMedium,
                  fontWeight: FontWeight.w700,
                  color: theme.colorScheme.onSurface,
                ),
                OsmeaComponents.sizedBox(height: context.spacing8),
                OsmeaComponents.text(
                  '${t.profileStep} ${stepState.currentStep + 1} / ${UserProfileViewModel.totalSteps}',
                  variant: OsmeaTextVariant.bodySmall,
                  color: theme.colorScheme.onSurface
                      .withValues(alpha: 0.5),
                ),
                OsmeaComponents.sizedBox(height: context.spacing12),
                OsmeaComponents.progress(
                  type: ProgressType.linearRounded,
                  value: progress,
                  size: ProgressSize.small,
                  progressColor: theme.colorScheme.primary,
                ),
              ],
            ),
          ),

          // ── Step Content ─────────────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing24,
                vertical: context.spacing16,
              ),
              child: _buildStepContent(context),
            ),
          ),

          // ── Navigation ───────────────────────────────────────────────
          Padding(
            padding: EdgeInsets.fromLTRB(
              context.spacing24,
              0,
              context.spacing24,
              context.spacing24,
            ),
            child: Row(
              children: [
                if (stepState.currentStep > 0) ...[
                  Expanded(
                    child: OsmeaComponents.button(
                      text: t.profilePrevious,
                      onPressed: viewModel.previousStep,
                      variant: ButtonVariant.ghost,
                      size: ButtonSize.large,
                      backgroundColor: Colors.transparent,
                      textColor: theme.colorScheme.primary,
                    ),
                  ),
                  OsmeaComponents.sizedBox(width: context.spacing12),
                ],
                Expanded(
                  flex: 2,
                  child: OsmeaComponents.button(
                    text: isLastStep ? t.profileSave : t.profileNext,
                    onPressed:
                        isLastStep ? viewModel.saveProfile : viewModel.nextStep,
                    variant: ButtonVariant.ghost,
                    size: ButtonSize.large,
                    backgroundColor: theme.colorScheme.primary,
                    textColor: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContent(BuildContext context) {
    switch (stepState.currentStep) {
      case 0:
        return _AgeStep(profile: stepState.profile, viewModel: viewModel);
      case 1:
        return _AllergiesStep(
            profile: stepState.profile, viewModel: viewModel);
      case 2:
        return _TextureStep(
            profile: stepState.profile, viewModel: viewModel);
      case 3:
        return _SpecialConditionsStep(
            profile: stepState.profile, viewModel: viewModel);
      default:
        return const SizedBox.shrink();
    }
  }
}

// ─── Step 1: Age ──────────────────────────────────────────────────────────────

class _AgeStep extends StatefulWidget {
  const _AgeStep({required this.profile, required this.viewModel});

  final ChildProfile profile;
  final UserProfileViewModel viewModel;

  @override
  State<_AgeStep> createState() => _AgeStepState();
}

class _AgeStepState extends State<_AgeStep> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        TextEditingController(text: widget.profile.ageMonths.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaComponents.text(
          t.profileAgeTitle,
          variant: OsmeaTextVariant.titleLarge,
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
        ),
        OsmeaComponents.sizedBox(height: context.spacing8),
        OsmeaComponents.text(
          t.profileAgeDescription,
          variant: OsmeaTextVariant.bodyMedium,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
        OsmeaComponents.sizedBox(height: context.spacing24),
        OsmeaComponents.textField(
          controller: _controller,
          label: t.profileAgeLabel,
          hint: t.profileAgeHint,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(2),
          ],
          onChanged: (value) {
            final months = int.tryParse(value) ?? 0;
            widget.viewModel.updateAgeMonths(months);
          },
          fullWidth: true,
          variant: TextFieldVariant.outlined,
        ),
        OsmeaComponents.sizedBox(height: context.spacing12),
        OsmeaComponents.text(
          t.profileAgeNote,
          variant: OsmeaTextVariant.bodySmall,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
        ),
      ],
    );
  }
}

// ─── Step 2: Allergies ────────────────────────────────────────────────────────

class _AllergiesStep extends StatelessWidget {
  const _AllergiesStep({required this.profile, required this.viewModel});

  final ChildProfile profile;
  final UserProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaComponents.text(
          t.profileAllergiesTitle,
          variant: OsmeaTextVariant.titleLarge,
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
        ),
        OsmeaComponents.sizedBox(height: context.spacing8),
        OsmeaComponents.text(
          t.profileAllergiesDescription,
          variant: OsmeaTextVariant.bodyMedium,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
        ),
        OsmeaComponents.sizedBox(height: context.spacing24),
        Wrap(
          spacing: context.spacing8,
          runSpacing: context.spacing8,
          children: _kAllergens.map((allergen) {
            final isSelected = profile.allergies.contains(allergen);
            return OsmeaComponents.chips(
              text: _allergenLabel(context, allergen),
              selected: isSelected,
              onSelected: (_) => viewModel.toggleAllergy(allergen),
              variant: ChipsVariant.primary,
              style: isSelected ? ChipsStyle.soft : ChipsStyle.outlined,
              activeColor: theme.colorScheme.primary,
            );
          }).toList(),
        ),
      ],
    );
  }
}

// ─── Step 3: Chewing & Texture ────────────────────────────────────────────────

class _TextureStep extends StatelessWidget {
  const _TextureStep({required this.profile, required this.viewModel});

  final ChildProfile profile;
  final UserProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Chewing level
        OsmeaComponents.text(
          t.profileChewingTitle,
          variant: OsmeaTextVariant.titleLarge,
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
        ),
        OsmeaComponents.sizedBox(height: context.spacing16),
        ...ChewingLevel.values.map(
          (level) => Padding(
            padding: EdgeInsets.only(bottom: context.spacing8),
            child: OsmeaComponents.radioButton<ChewingLevel>(
              value: level,
              groupValue: profile.chewingLevel,
              onChanged: (v) {
                if (v != null) viewModel.setChewingLevel(v);
              },
              label: _chewingLabel(context, level.name),
              variant: RadioVariant.tile,
              fullWidth: true,
              activeColor: theme.colorScheme.primary,
            ),
          ),
        ),

        OsmeaComponents.sizedBox(height: context.spacing24),

        // Texture tolerance
        OsmeaComponents.text(
          t.profileTextureTitle,
          variant: OsmeaTextVariant.titleLarge,
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
        ),
        OsmeaComponents.sizedBox(height: context.spacing16),
        ...TextureToleranceLevel.values.map(
          (level) => Padding(
            padding: EdgeInsets.only(bottom: context.spacing8),
            child: OsmeaComponents.radioButton<TextureToleranceLevel>(
              value: level,
              groupValue: profile.textureToleranceLevel,
              onChanged: (v) {
                if (v != null) viewModel.setTextureTolerance(v);
              },
              label: _textureLabel(context, level.name),
              variant: RadioVariant.tile,
              fullWidth: true,
              activeColor: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Step 4: Special Conditions & Sensory ────────────────────────────────────

class _SpecialConditionsStep extends StatefulWidget {
  const _SpecialConditionsStep(
      {required this.profile, required this.viewModel});

  final ChildProfile profile;
  final UserProfileViewModel viewModel;

  @override
  State<_SpecialConditionsStep> createState() =>
      _SpecialConditionsStepState();
}

class _SpecialConditionsStepState extends State<_SpecialConditionsStep> {
  late final TextEditingController _dietaryController;
  late final TextEditingController _intolerancesController;

  @override
  void initState() {
    super.initState();
    _dietaryController =
        TextEditingController(text: widget.profile.specialDietaryNeeds);
    _intolerancesController =
        TextEditingController(text: widget.profile.foodIntolerances);
  }

  @override
  void dispose() {
    _dietaryController.dispose();
    _intolerancesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final theme = Theme.of(context);
    final profile = widget.profile;
    final viewModel = widget.viewModel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OsmeaComponents.text(
          t.profileSpecialTitle,
          variant: OsmeaTextVariant.titleLarge,
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
        ),
        OsmeaComponents.sizedBox(height: context.spacing20),

        // Premature checkbox
        OsmeaComponents.checkbox(
          value: profile.isPremature,
          onChanged: (v) => viewModel.setIsPremature(v ?? false),
          label: t.profileIsPrematureLabel,
          variant: CheckboxVariant.labeled,
          fullWidth: true,
          activeColor: theme.colorScheme.primary,
        ),

        OsmeaComponents.sizedBox(height: context.spacing20),

        // Special dietary needs
        OsmeaComponents.textField(
          controller: _dietaryController,
          label: t.profileDietaryNeedsLabel,
          hint: t.profileDietaryNeedsHint,
          onChanged: viewModel.setSpecialDietaryNeeds,
          fullWidth: true,
          maxLines: 2,
          variant: TextFieldVariant.outlined,
        ),

        OsmeaComponents.sizedBox(height: context.spacing16),

        // Food intolerances
        OsmeaComponents.textField(
          controller: _intolerancesController,
          label: t.profileFoodIntolerancesLabel,
          hint: t.profileFoodIntolerancesHint,
          onChanged: viewModel.setFoodIntolerances,
          fullWidth: true,
          maxLines: 2,
          variant: TextFieldVariant.outlined,
        ),

        OsmeaComponents.sizedBox(height: context.spacing24),

        // Sensory preferences
        OsmeaComponents.text(
          t.profileSensoryTitle,
          variant: OsmeaTextVariant.titleMedium,
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
        ),
        OsmeaComponents.sizedBox(height: context.spacing12),
        Wrap(
          spacing: context.spacing8,
          runSpacing: context.spacing8,
          children: _kSensoryPreferences.map((pref) {
            final isSelected = profile.sensoryPreferences.contains(pref);
            return OsmeaComponents.chips(
              text: _sensoryLabel(context, pref),
              selected: isSelected,
              onSelected: (_) => viewModel.toggleSensoryPreference(pref),
              variant: ChipsVariant.primary,
              style: isSelected ? ChipsStyle.soft : ChipsStyle.outlined,
              activeColor: theme.colorScheme.primary,
            );
          }).toList(),
        ),
      ],
    );
  }
}

// ─── Guidance Screen (after save) ────────────────────────────────────────────

class _GuidanceScreen extends StatelessWidget {
  const _GuidanceScreen({required this.state, required this.viewModel});

  final UserProfileSavedState state;
  final UserProfileViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(context.spacing24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OsmeaComponents.sizedBox(height: context.spacing16),
            OsmeaComponents.text(
              t.profileSavedTitle,
              variant: OsmeaTextVariant.headlineMedium,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
            OsmeaComponents.sizedBox(height: context.spacing8),
            OsmeaComponents.text(
              t.profileSavedSubtitle,
              variant: OsmeaTextVariant.bodyMedium,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            OsmeaComponents.sizedBox(height: context.spacing32),

            // AI Guidance card
            if (state.guidanceTip != null) ...[
              _GuidanceCard(tip: state.guidanceTip!, theme: theme, t: t),
              OsmeaComponents.sizedBox(height: context.spacing32),
            ],

            const Spacer(),

            // Continue button
            OsmeaComponents.button(
              text: t.profileContinue,
              onPressed: viewModel.continueToHome,
              variant: ButtonVariant.ghost,
              size: ButtonSize.large,
              backgroundColor: theme.colorScheme.primary,
              textColor: theme.colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}

// ─── AI Guidance Card ────────────────────────────────────────────────────────

class _GuidanceCard extends StatelessWidget {
  const _GuidanceCard({
    required this.tip,
    required this.theme,
    required this.t,
  });

  final String tip;
  final ThemeData theme;
  final Translations t;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.spacing20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(context.radiusMedium),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.tips_and_updates_outlined,
                color: theme.colorScheme.primary,
                size: 20,
              ),
              OsmeaComponents.sizedBox(width: context.spacing8),
              OsmeaComponents.text(
                t.profileGuidanceTitle,
                variant: OsmeaTextVariant.titleSmall,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
          OsmeaComponents.sizedBox(height: context.spacing12),
          OsmeaComponents.text(
            tip,
            variant: OsmeaTextVariant.bodyMedium,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
            lineHeight: 1.5,
          ),
        ],
      ),
    );
  }
}
