import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations{

  static const List LOCALS =[
    {'name':'English',    'locale': Locale('en')},
    {'name':'العربية',    'locale': Locale('ar')},
    {'name':'Française',  'locale': Locale('fr')},
  ];

  @override
  Map<String, Map<String, String>> get keys => {

    //ENGLISH LANGUAGE
    'en':{
      //COMMON
      'save': 'Save',
      'cancel': 'Cancel',
      'update': 'Update',
      //LOGIN, REGISTER & FORGOT-PASSWORD PAGES
      'loginPageTitle':         'Enter your credentials',
      'emailInputLabel':        'Email',
      'passwordInputLabel':     'Password',
      'firstnameInputLabel':    'First name',
      'lastnameInputLabel':     'Last name',
      'phoneInputLabel':        'Phone number',
      'forgotPasswordBtn':      'Forgot password ?',
      'loginBtn':               'Login',
      'noAccountTxt':           "Doesn't have an account ? ",
      'hasAccountTxt':          "Already have account ? ",
      'registerBtn':            'Register',
      'updateLanguage':         "Language",
      'forgotPasswordTitle':    "Retrieve password",
      'submit':                 'Submit',
      'invalidEmailError':      "Provide valid Email",
      'invalidPhoneError':      "Provide valid Phone Number",
      'invalidPasswordError':   "Password must be of 6 characters",
      'requiredInputError':     "This field is required",
      'confirmCodePageTitle':   "Enter confirmation code",
      'codeInputLabel':         "Code",
      'confirmBtn':             "Confirm",

      //CHOOSE LANGUAGE DIALOG
      'chooseLangDialogTitle':  "Choose Your Language",

      //ON-BOARDING PAGE
      'pageOneTitle':          'Lorem Ipsum',
      'pageTwoTitle':          'Lorem Ipsum',
      'pageThreeTitle':        'Lorem Ipsum',
      'pageOneInfo':           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non efficitur nulla.',
      'pageTwoInfo':           'Phasellus et ornare tellus, ac dictum sapien. Nulla tristique nunc quis scelerisque tincidunt.',
      'pageThreeInfo':         'Nam eget egestas neque, in tempor ligula. Vivamus velit dui, ultrices sed nibh a, congue iaculis leo. Mauris placerat arcu ipsum, ut sagittis odio congue quis.',
      'start':                 'Start',
      'next':                  'Next',
      'registerStepLabel':     "Register",
      'activateStepLabel':     "Activate",
      'confirmStepLabel':      "Confirm",
      'createPasswordStepLabel':"Create password",

      //HOME PAGE
      'organisationsTag':      "Organisations",
      'favoritesTag':          "Favorites",
      'reservationsTag':       "Reservations",
      'profileTag':            "Profile",

      //Profile
      'accountTitle': 'Account',
      'passwordTileList': 'Change password',
      'languageTileList': 'Language',
      'credentialsTileList': 'Account\'s credentials',
      //Profil -> Change password
            'updatePasswordTitle': "Update password",
      'newPasswordInputLabel': "New password",
      'repeatedPasswordInputLabel': "Repeat password",
      'repeatPasswordErrorMsg': "Passwords should be identical",
      'updatePasswordTitle': "Update password",
      'newPasswordInputLabel': "New password",
      'repeatedPasswordInputLabel': "Repeat password",

    },

    //ARABIC LANGUAGE
    'ar':{
      //COMMUN
      'save': 'تسجيل',
      'cancel': 'الغاء',
      'update': 'تحديث',

      //LOGIN, REGISTER & FORGOT-PASSWORD PAGES
      "loginPageTitle":          "أدخل بيانات الاعتماد الخاصة بك",
      "emailInputLabel":         "البريد الإلكتروني" ,
      "passwordInputLabel":      "كلمة المرور" ,
      'firstnameInputLabel':     'الاسم',
      'lastnameInputLabel':      'اللقب',
      'phoneInputLabel':         'رقم الهاتف',
      'forgotPasswordBtn':       'هل نسيت كلمة المرور ؟',
      "loginBtn":                "تسجيل الدخول" ,
      'noAccountTxt':            "أليس لديك حساب ؟ ",
      'hasAccountTxt':           "لديك حساب بالفعل ؟ ",
      'registerBtn':             'سجل نفسك',
      'updateLanguage':          "اللغة",
      'forgotPasswordTitle':     "استرجاع كلمة المرور",
      'submit':                  'إرسال',
      'invalidEmailError':       "أدخل بريد إلكتروني بشكل صحيح",
      'invalidPhoneError':       "أدخل رقم هاتف بشكل صحيح",
      'invalidPasswordError':    "كلمة المرور يجب أن تتكون من 6 أحرف على الأقل" ,
      'requiredInputError':      "توفير هذه البيانات مطلوب",
      'confirmCodePageTitle':    "أدخل رمز التأكيد",
      'codeInputLabel':          "الرمز",
      'confirmBtn':              "التأكيد",
      'registerStepLabel':       "تسجيل" ,
      'activateStepLabel':       "التفعيل",
      'confirmStepLabel':        "التأكيد" ,
      'createPasswordStepLabel':"أنشئ كلمة مرور",

      //CHOOSE LANGUAGE DIALOG
      'chooseLangDialogTitle':  "اختر لغة",

       //ON-BOARDING PAGE
      'pageOneTitle':          'العنوان الأول',
      'pageTwoTitle':          'العنوان الثاني',
      'pageThreeTitle':        'العنوان الثالث',
      'pageOneInfo':           'في هذه شرسة مقاومة رجوعهم, بعض عل تحرّكت الأعمال الأثناء،',
      'pageTwoInfo':           'ثم تلك فشكّل لإنعدام. هو تلك يتعلّق والنرويج. قد أصقاع وبغطاء مدن, جنوب اليها الانجليزية بين عل.',
      'pageThreeInfo':         'ان أضف لهذه ولكسمبورغ. في عرض تونس احداث, في مدن الثالث الجنوبي.',
      'start':                 'ابدأ الآن',
      'next':                  'التالي',

      //HOME PAGE
      'organisationsTag':      "المؤسسات",
      'favoritesTag':          "مفضلاتك",
      'reservationsTag':       "التذاكر",
      'profileTag':            "الحساب",

      //Profil
      'accountTitle': 'حسابك الشخصي',
      'passwordTileList': 'تغيير كلمة المرور',
      'languageTileList': 'تغيير اللغة',
      'credentialsTileList': 'بيانات الحساب',
      //Profil -> Change password
      'updatePasswordTitle': "تحديث كلمة المرور",
      'newPasswordInputLabel': "كلمة المرور الجديدة",
      'repeatedPasswordInputLabel': "كرر كلمة المرور",
      'repeatPasswordErrorMsg': "يجب أن تكون كلمات المرور متطابقة",

    },

    //FRENCH LANGUAGE
    'fr':{
      //COMMUN
      'save': 'Enregistrer',
      'cancel': 'Annuler',
      'update': 'Mettre à jour',

      //LOGIN, REGISTER & FORGOT-PASSWORD PAGES
      'loginPageTitle':         'Entrez votre identifiants',
      'emailInputLabel':        'E-mail',
      'passwordInputLabel':     'Mot de passe',
      'firstnameInputLabel':    'Prénom',
      'lastnameInputLabel':     'Nom de famille',
      'phoneInputLabel':        'Numéro de téléphone',
      'forgotPasswordBtn':      'Mot de passe oublié ?',
      'loginBtn':               'Connexion',
      'noAccountTxt':           "Vous n'avez pas de compte ? ",
      'hasAccountTxt':          "Vous avez déjà un compte ? ",
      'registerBtn':            "S'inscrire",
      'updateLanguage':         "Langue",
      'forgotPasswordTitle':    "Récupérer mot de passe",
      'submit':                 'Envoyer',
      'invalidEmailError':      "Fournir une adresse e-mail valide",
      'invalidPhoneError':      "Fournir un numéro de téléphone valide",
      'invalidPasswordError':   "Le mot de passe doit comporter au moins 6 caractères",
      'requiredInputError':     "Ce champ est obligatoire",
      'confirmCodePageTitle':   "Entrez le code de confirmation",
      'codeInputLabel':         "Code",
      'confirmBtn':             "Confirmer",
      'registerStepLabel':      "Inscrire",
      'activateStepLabel':      "Activer",
      'confirmStepLabel':       "Confirmer",
      'createPasswordStepLabel':"Créer un mot de passe",


      //CHOOSE LANGUAGE DIALOG
      'chooseLangDialogTitle':  "Choisissez une langue",

      //ON-BOARDING PAGE
      'pageOneTitle':          'Lorem Ipsum',
      'pageTwoTitle':          'Lorem Ipsum',
      'pageThreeTitle':        'Lorem Ipsum',
      'pageOneInfo':           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non efficitur nulla.',
      'pageTwoInfo':           'Phasellus et ornare tellus, ac dictum sapien. Nulla tristique nunc quis scelerisque tincidunt.',
      'pageThreeInfo':         'Nam eget egestas neque, in tempor ligula. Vivamus velit dui, ultrices sed nibh a, congue iaculis leo. Mauris placerat arcu ipsum, ut sagittis odio congue quis.',
      'start':                 'Commencez',
      'next':                  'Suivant',

      //HOME PAGE
      'organisationsTag':      "Organisations",
      'favoritesTag':          "Favoris",
      'reservationsTag':       "Réservations",
      'profileTag':            "Profil",

      //Profil
      'accountTitle': 'Compte',
      'passwordTileList': 'Modifier le mot de passe',
      'languageTileList': 'Langue',
      'credentialsTileList': 'Informations du compte',

      //Profil -> Change password
      'updatePasswordTitle': "Changer le mot de passe",
      'newPasswordInputLabel': "Nouveau mot de passe",
      'repeatedPasswordInputLabel': "Répéter le mot de passe",
      'repeatPasswordErrorMsg': "Les mots de passe doivent être identiques",

    }
  };
}