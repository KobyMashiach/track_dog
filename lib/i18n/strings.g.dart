/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 73
///
/// Built on 2024-09-02 at 06:38 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.he;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.he) // set locale
/// - Locale locale = AppLocale.he.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.he) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	he(languageCode: 'he', build: Translations.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.he,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <he>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get hello => 'שלום';
	String get choose_own_gender => 'בחירת המין שלך';
	String get choose_partner_gender => 'בחירת מין הבן/בת זוג';
	String get home_screen => 'מסך בית';
	String get settings => 'הגדרות';
	String get contact_us => 'יצירת קשר';
	String get pick_color => 'בחר צבע';
	String get ok => 'אישור';
	String get cancel => 'ביטול';
	String get recommand_drak_colors => 'מומלץ צבעים כהים';
	String get build_app => 'בונה את האפליקציה';
	String get build_app_description => 'האפליקציה נבנית כרגע במיוחד בשבילך!';
	String get change_color => 'שינוי צבע';
	String get change_gender => 'שינוי מין';
	String get choose_gender => 'בחר מין';
	String get male => 'זכר';
	String get female => 'נקבה';
	String get app_info => 'מידע על האפליקציה';
	String get app_name => 'שם האפליקציה';
	String get app_version => 'גרסת האפליקציה';
	String get event_id => 'מספר אירוע';
	String get change_language => 'שינוי שפה';
	String get choose_language => 'בחר שפה';
	String get soon => 'בקרוב';
	String get back => 'חזור';
	String get login_screen => 'מסך התחברות';
	String get login => 'התחברות';
	String get register_screen => 'מסך הרשמה';
	String get register => 'הרשמה';
	String get phone => 'טלפון';
	String get password => 'סיסמה';
	String get have_account => 'יש משתמש';
	String get no_account => 'אין משתמש';
	String get click_here => 'לחץ כאן';
	String get password_verification => 'אימות סיסמה';
	String get got_it => 'בסדר, הבנתי';
	String get short_password => 'סיסמה קצרה מידי';
	String get password_dont_match => 'הסיסמאות לא תואמות';
	String get phone_exist => 'טלפון קיים במערכת';
	String get phone_not_valid => 'מספר הטלפון לא חוקי';
	String get short_password_description => 'הסיסמה צריכה להיות 8 תווים לפחות';
	String get password_dont_match_description => '2 הסיסמאות שהזנת לא תואמות, נא נסה שוב';
	String get phone_exist_description => 'מספר הטלפון קיים במערכת שלנו, עבור למסך ההתחברות ונסה שנית';
	String get phone_not_valid_description => 'כנראה שטעית במספר הטלפון, נא נסה שנית';
	String get email => 'אימייל';
	String get email_exist => 'כתובת מייל קיימת במערכת';
	String get email_not_valid => 'כתובת המייל לא חוקית';
	String get email_exist_description => 'כתובת המייל קיימת במערכת שלנו, עבור למסך ההתחברות ונסה שנית';
	String get email_not_valid_description => 'כנראה שטעית בכתובת המייל, נא נסה שנית';
	String get wrong_password => 'האימייל או הסיסמה שגויים, נסה שוב';
	String get user_not_found => 'לא נמצאה כתובת המייל הזו, נסה שוב';
	String get user_disabled => 'משתמש מושבת';
	String get too_many_requests => 'יותר מדי בקשות להתחבר לחשבון זה';
	String get operation_not_allowed => 'שגיאת שרת, אנא נסה שוב מאוחר יותר';
	String get default_error => 'ההתחברות נכשלה. בבקשה נסה שוב';
	String get invalid_credential => 'כתובת המייל או הסיסמה לא נכונים, נא נסה שנית';
	String get want_login_exist_user => 'להתחברות למשתמש קיים​';
	String get want_register => 'ברצוני להירשם';
	String get want_report_lost_dog => 'ברצוני לדווח על כלב אבוד כאורח​';
	String get forgot_password => 'שכחת סיסמה';
	String get password_recovery => 'שחזור סיסמה';
	String get send_mail => 'שלח מייל';
	String get mail__recover_sent_title => 'מייל לשחזור סיסמה נשלח בהצלחה';
	String get mail__recover_sent_description => 'נא לחץ על הקישור במייל.\nאם אינך רואה את המייל נסה לחפש בתיקיית הספאם או נסה שנית';
	String get report_lost_dog => 'דיווח על כלב אבוד';
	String get thanks_report_details => 'תודה שבחרת לעזור באיתור הכלבים האבודים באזורנו!\nכדי לדווח על כלב שנמצא, אנא מלא את הפרטים הבאים:​';
	String get upload_dog_image => 'העלה תמונה של הכלב';
	String get add_notes => 'הוספת הערות';
	String get aggressive_dog_warning => 'חשוב לדעת: אם ראית כלב עם התנהגות תוקפנית או חשד לכלב בר, אנו ממליצים שלא לגשת אליו ולהימנע מסיכון. האפליקציה מתמקדת באיתור כלבים ביתיים, ודיווחים על כלבים פראיים יש לדווח למוקד השירות הווטרינרי האזורי.​';
	String get explanation_friendly_dog => 'לקבלת הסבר כיצד לזהות כלב ידידותי​';
	String get send_report => 'שלח דיווח';
	String get contact_phone => 'מספר טלפון ליצירת קשר';
	String get full_name => 'שם מלא';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'hello': return 'שלום';
			case 'choose_own_gender': return 'בחירת המין שלך';
			case 'choose_partner_gender': return 'בחירת מין הבן/בת זוג';
			case 'home_screen': return 'מסך בית';
			case 'settings': return 'הגדרות';
			case 'contact_us': return 'יצירת קשר';
			case 'pick_color': return 'בחר צבע';
			case 'ok': return 'אישור';
			case 'cancel': return 'ביטול';
			case 'recommand_drak_colors': return 'מומלץ צבעים כהים';
			case 'build_app': return 'בונה את האפליקציה';
			case 'build_app_description': return 'האפליקציה נבנית כרגע במיוחד בשבילך!';
			case 'change_color': return 'שינוי צבע';
			case 'change_gender': return 'שינוי מין';
			case 'choose_gender': return 'בחר מין';
			case 'male': return 'זכר';
			case 'female': return 'נקבה';
			case 'app_info': return 'מידע על האפליקציה';
			case 'app_name': return 'שם האפליקציה';
			case 'app_version': return 'גרסת האפליקציה';
			case 'event_id': return 'מספר אירוע';
			case 'change_language': return 'שינוי שפה';
			case 'choose_language': return 'בחר שפה';
			case 'soon': return 'בקרוב';
			case 'back': return 'חזור';
			case 'login_screen': return 'מסך התחברות';
			case 'login': return 'התחברות';
			case 'register_screen': return 'מסך הרשמה';
			case 'register': return 'הרשמה';
			case 'phone': return 'טלפון';
			case 'password': return 'סיסמה';
			case 'have_account': return 'יש משתמש';
			case 'no_account': return 'אין משתמש';
			case 'click_here': return 'לחץ כאן';
			case 'password_verification': return 'אימות סיסמה';
			case 'got_it': return 'בסדר, הבנתי';
			case 'short_password': return 'סיסמה קצרה מידי';
			case 'password_dont_match': return 'הסיסמאות לא תואמות';
			case 'phone_exist': return 'טלפון קיים במערכת';
			case 'phone_not_valid': return 'מספר הטלפון לא חוקי';
			case 'short_password_description': return 'הסיסמה צריכה להיות 8 תווים לפחות';
			case 'password_dont_match_description': return '2 הסיסמאות שהזנת לא תואמות, נא נסה שוב';
			case 'phone_exist_description': return 'מספר הטלפון קיים במערכת שלנו, עבור למסך ההתחברות ונסה שנית';
			case 'phone_not_valid_description': return 'כנראה שטעית במספר הטלפון, נא נסה שנית';
			case 'email': return 'אימייל';
			case 'email_exist': return 'כתובת מייל קיימת במערכת';
			case 'email_not_valid': return 'כתובת המייל לא חוקית';
			case 'email_exist_description': return 'כתובת המייל קיימת במערכת שלנו, עבור למסך ההתחברות ונסה שנית';
			case 'email_not_valid_description': return 'כנראה שטעית בכתובת המייל, נא נסה שנית';
			case 'wrong_password': return 'האימייל או הסיסמה שגויים, נסה שוב';
			case 'user_not_found': return 'לא נמצאה כתובת המייל הזו, נסה שוב';
			case 'user_disabled': return 'משתמש מושבת';
			case 'too_many_requests': return 'יותר מדי בקשות להתחבר לחשבון זה';
			case 'operation_not_allowed': return 'שגיאת שרת, אנא נסה שוב מאוחר יותר';
			case 'default_error': return 'ההתחברות נכשלה. בבקשה נסה שוב';
			case 'invalid_credential': return 'כתובת המייל או הסיסמה לא נכונים, נא נסה שנית';
			case 'want_login_exist_user': return 'להתחברות למשתמש קיים​';
			case 'want_register': return 'ברצוני להירשם';
			case 'want_report_lost_dog': return 'ברצוני לדווח על כלב אבוד כאורח​';
			case 'forgot_password': return 'שכחת סיסמה';
			case 'password_recovery': return 'שחזור סיסמה';
			case 'send_mail': return 'שלח מייל';
			case 'mail__recover_sent_title': return 'מייל לשחזור סיסמה נשלח בהצלחה';
			case 'mail__recover_sent_description': return 'נא לחץ על הקישור במייל.\nאם אינך רואה את המייל נסה לחפש בתיקיית הספאם או נסה שנית';
			case 'report_lost_dog': return 'דיווח על כלב אבוד';
			case 'thanks_report_details': return 'תודה שבחרת לעזור באיתור הכלבים האבודים באזורנו!\nכדי לדווח על כלב שנמצא, אנא מלא את הפרטים הבאים:​';
			case 'upload_dog_image': return 'העלה תמונה של הכלב';
			case 'add_notes': return 'הוספת הערות';
			case 'aggressive_dog_warning': return 'חשוב לדעת: אם ראית כלב עם התנהגות תוקפנית או חשד לכלב בר, אנו ממליצים שלא לגשת אליו ולהימנע מסיכון. האפליקציה מתמקדת באיתור כלבים ביתיים, ודיווחים על כלבים פראיים יש לדווח למוקד השירות הווטרינרי האזורי.​';
			case 'explanation_friendly_dog': return 'לקבלת הסבר כיצד לזהות כלב ידידותי​';
			case 'send_report': return 'שלח דיווח';
			case 'contact_phone': return 'מספר טלפון ליצירת קשר';
			case 'full_name': return 'שם מלא';
			default: return null;
		}
	}
}
