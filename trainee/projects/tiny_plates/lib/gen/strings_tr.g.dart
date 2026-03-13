///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsTr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsTr _root = this; // ignore: unused_field

	@override 
	TranslationsTr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsTr(meta: meta ?? this.$meta);

	// Translations
	@override String get localLanguageCode => 'tr_TR';
	@override String get appTitle => 'Tiny Plates';
	@override String get home => 'Ana Sayfa';
	@override String get homeTitle => 'Tiny Plates';
	@override String get settings => 'Ayarlar';
	@override String get save => 'Kaydet';
	@override String get cancel => 'İptal';
	@override String get loading => 'Yükleniyor...';
	@override String get error => 'Hata';
	@override String get retry => 'Tekrar Dene';
	@override String get onboardingSkip => 'Atla';
	@override String get onboardingPrevious => 'Önceki';
	@override String get onboardingNext => 'İleri';
	@override String get onboardingGetStarted => 'Başla';
	@override String get onboardingNoPages => 'Onboarding sayfası yok';
	@override String get onboardingLoadFailed => 'Yüklenemedi';
	@override String get diary => 'Günlük';
	@override String get profileSetupTitle => 'Çocuk Profili';
	@override String get profileStep => 'Adım';
	@override String get profileNext => 'İleri';
	@override String get profilePrevious => 'Geri';
	@override String get profileSave => 'Profili Kaydet';
	@override String get profileContinue => 'Devam Et';
	@override String get profileAgeTitle => 'Çocuğunuz kaç aylık?';
	@override String get profileAgeDescription => 'Beslenme planını kişiselleştirmek için çocuğunuzun yaşını ay olarak girin.';
	@override String get profileAgeLabel => 'Yaş (ay)';
	@override String get profileAgeHint => 'ör. 8';
	@override String get profileAgeNote => '0 ile 36 ay arasında bir değer girin.';
	@override String get profileAllergiesTitle => 'Alerji var mı?';
	@override String get profileAllergiesDescription => 'Geçerli olan tüm alerjenleri seçin. Güvensiz yiyecekleri otomatik olarak filtreleyeceğiz.';
	@override String get profileChewingTitle => 'Çiğneme düzeyi';
	@override String get profileTextureTitle => 'Doku toleransı';
	@override String get profileSpecialTitle => 'Özel durumlar ve duyusal tercihler';
	@override String get profileIsPrematureLabel => 'Çocuğum prematüre doğdu';
	@override String get profileDietaryNeedsLabel => 'Özel diyet ihtiyaçları';
	@override String get profileDietaryNeedsHint => 'ör. vegan, helal, kosher…';
	@override String get profileFoodIntolerancesLabel => 'Gıda intoleransları';
	@override String get profileFoodIntolerancesHint => 'ör. laktoz, gluten…';
	@override String get profileSensoryTitle => 'Duyusal tercihler';
	@override String get profileSavedTitle => 'Profil kaydedildi!';
	@override String get profileSavedSubtitle => 'Çocuğunuzun doku düzeyine göre kişiselleştirilmiş bir ipucu.';
	@override String get profileGuidanceTitle => 'AI Doku İpucu';
}

/// The flat map containing all translations for locale <tr>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsTr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'localLanguageCode' => 'tr_TR',
			'appTitle' => 'Tiny Plates',
			'home' => 'Ana Sayfa',
			'homeTitle' => 'Tiny Plates',
			'settings' => 'Ayarlar',
			'save' => 'Kaydet',
			'cancel' => 'İptal',
			'loading' => 'Yükleniyor...',
			'error' => 'Hata',
			'retry' => 'Tekrar Dene',
			'onboardingSkip' => 'Atla',
			'onboardingPrevious' => 'Önceki',
			'onboardingNext' => 'İleri',
			'onboardingGetStarted' => 'Başla',
			'onboardingNoPages' => 'Onboarding sayfası yok',
			'onboardingLoadFailed' => 'Yüklenemedi',
			'diary' => 'Günlük',
			'profileSetupTitle' => 'Çocuk Profili',
			'profileStep' => 'Adım',
			'profileNext' => 'İleri',
			'profilePrevious' => 'Geri',
			'profileSave' => 'Profili Kaydet',
			'profileContinue' => 'Devam Et',
			'profileAgeTitle' => 'Çocuğunuz kaç aylık?',
			'profileAgeDescription' => 'Beslenme planını kişiselleştirmek için çocuğunuzun yaşını ay olarak girin.',
			'profileAgeLabel' => 'Yaş (ay)',
			'profileAgeHint' => 'ör. 8',
			'profileAgeNote' => '0 ile 36 ay arasında bir değer girin.',
			'profileAllergiesTitle' => 'Alerji var mı?',
			'profileAllergiesDescription' => 'Geçerli olan tüm alerjenleri seçin. Güvensiz yiyecekleri otomatik olarak filtreleyeceğiz.',
			'profileChewingTitle' => 'Çiğneme düzeyi',
			'profileTextureTitle' => 'Doku toleransı',
			'profileSpecialTitle' => 'Özel durumlar ve duyusal tercihler',
			'profileIsPrematureLabel' => 'Çocuğum prematüre doğdu',
			'profileDietaryNeedsLabel' => 'Özel diyet ihtiyaçları',
			'profileDietaryNeedsHint' => 'ör. vegan, helal, kosher…',
			'profileFoodIntolerancesLabel' => 'Gıda intoleransları',
			'profileFoodIntolerancesHint' => 'ör. laktoz, gluten…',
			'profileSensoryTitle' => 'Duyusal tercihler',
			'profileSavedTitle' => 'Profil kaydedildi!',
			'profileSavedSubtitle' => 'Çocuğunuzun doku düzeyine göre kişiselleştirilmiş bir ipucu.',
			'profileGuidanceTitle' => 'AI Doku İpucu',
			_ => null,
		};
	}
}
