///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'en_US'
	String get localLanguageCode => 'en_US';

	/// en: 'Tiny Plates'
	String get appTitle => 'Tiny Plates';

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'Tiny Plates'
	String get homeTitle => 'Tiny Plates';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Skip'
	String get onboardingSkip => 'Skip';

	/// en: 'Previous'
	String get onboardingPrevious => 'Previous';

	/// en: 'Next'
	String get onboardingNext => 'Next';

	/// en: 'Get started'
	String get onboardingGetStarted => 'Get started';

	/// en: 'No onboarding pages'
	String get onboardingNoPages => 'No onboarding pages';

	/// en: 'Load failed'
	String get onboardingLoadFailed => 'Load failed';

	/// en: 'Diary'
	String get diary => 'Diary';

	/// en: 'Child Profile'
	String get profileSetupTitle => 'Child Profile';

	/// en: 'Step'
	String get profileStep => 'Step';

	/// en: 'Next'
	String get profileNext => 'Next';

	/// en: 'Previous'
	String get profilePrevious => 'Previous';

	/// en: 'Save Profile'
	String get profileSave => 'Save Profile';

	/// en: 'Continue'
	String get profileContinue => 'Continue';

	/// en: 'How old is your child?'
	String get profileAgeTitle => 'How old is your child?';

	/// en: 'Enter your child's age in months so we can personalise their nutrition plan.'
	String get profileAgeDescription => 'Enter your child\'s age in months so we can personalise their nutrition plan.';

	/// en: 'Age (months)'
	String get profileAgeLabel => 'Age (months)';

	/// en: 'e.g. 8'
	String get profileAgeHint => 'e.g. 8';

	/// en: 'Enter a value between 0 and 36 months.'
	String get profileAgeNote => 'Enter a value between 0 and 36 months.';

	/// en: 'Any allergies?'
	String get profileAllergiesTitle => 'Any allergies?';

	/// en: 'Select all allergens that apply. We will filter out unsafe foods automatically.'
	String get profileAllergiesDescription => 'Select all allergens that apply. We will filter out unsafe foods automatically.';

	/// en: 'Chewing level'
	String get profileChewingTitle => 'Chewing level';

	/// en: 'Texture tolerance'
	String get profileTextureTitle => 'Texture tolerance';

	/// en: 'Special conditions & sensory'
	String get profileSpecialTitle => 'Special conditions & sensory';

	/// en: 'My child was born premature'
	String get profileIsPrematureLabel => 'My child was born premature';

	/// en: 'Special dietary needs'
	String get profileDietaryNeedsLabel => 'Special dietary needs';

	/// en: 'e.g. vegan, halal, kosher…'
	String get profileDietaryNeedsHint => 'e.g. vegan, halal, kosher…';

	/// en: 'Food intolerances'
	String get profileFoodIntolerancesLabel => 'Food intolerances';

	/// en: 'e.g. lactose, gluten…'
	String get profileFoodIntolerancesHint => 'e.g. lactose, gluten…';

	/// en: 'Sensory preferences'
	String get profileSensoryTitle => 'Sensory preferences';

	/// en: 'Profile saved!'
	String get profileSavedTitle => 'Profile saved!';

	/// en: 'Here is a personalised tip based on your child's texture level.'
	String get profileSavedSubtitle => 'Here is a personalised tip based on your child\'s texture level.';

	/// en: 'AI Texture Tip'
	String get profileGuidanceTitle => 'AI Texture Tip';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'localLanguageCode' => 'en_US',
			'appTitle' => 'Tiny Plates',
			'home' => 'Home',
			'homeTitle' => 'Tiny Plates',
			'settings' => 'Settings',
			'save' => 'Save',
			'cancel' => 'Cancel',
			'loading' => 'Loading...',
			'error' => 'Error',
			'retry' => 'Retry',
			'onboardingSkip' => 'Skip',
			'onboardingPrevious' => 'Previous',
			'onboardingNext' => 'Next',
			'onboardingGetStarted' => 'Get started',
			'onboardingNoPages' => 'No onboarding pages',
			'onboardingLoadFailed' => 'Load failed',
			'diary' => 'Diary',
			'profileSetupTitle' => 'Child Profile',
			'profileStep' => 'Step',
			'profileNext' => 'Next',
			'profilePrevious' => 'Previous',
			'profileSave' => 'Save Profile',
			'profileContinue' => 'Continue',
			'profileAgeTitle' => 'How old is your child?',
			'profileAgeDescription' => 'Enter your child\'s age in months so we can personalise their nutrition plan.',
			'profileAgeLabel' => 'Age (months)',
			'profileAgeHint' => 'e.g. 8',
			'profileAgeNote' => 'Enter a value between 0 and 36 months.',
			'profileAllergiesTitle' => 'Any allergies?',
			'profileAllergiesDescription' => 'Select all allergens that apply. We will filter out unsafe foods automatically.',
			'profileChewingTitle' => 'Chewing level',
			'profileTextureTitle' => 'Texture tolerance',
			'profileSpecialTitle' => 'Special conditions & sensory',
			'profileIsPrematureLabel' => 'My child was born premature',
			'profileDietaryNeedsLabel' => 'Special dietary needs',
			'profileDietaryNeedsHint' => 'e.g. vegan, halal, kosher…',
			'profileFoodIntolerancesLabel' => 'Food intolerances',
			'profileFoodIntolerancesHint' => 'e.g. lactose, gluten…',
			'profileSensoryTitle' => 'Sensory preferences',
			'profileSavedTitle' => 'Profile saved!',
			'profileSavedSubtitle' => 'Here is a personalised tip based on your child\'s texture level.',
			'profileGuidanceTitle' => 'AI Texture Tip',
			_ => null,
		};
	}
}
