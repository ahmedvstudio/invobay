import 'package:invobay/core/utils/formatters/formatters.dart';

class VText {
  VText._();
  // General
  static const String appName = "InvoBay";
  static final backupFileName =
      'app_backup_${VFormatters.formatBackupDate(DateTime.now())}.invobak';

  // Getting Started
  static const String gettingStartedTitle1 = "Choose Your Product";
  static const String gettingStartedSubTitle1 =
      "Welcome to a World of Limitless Choices - Your Perfect Product Awaits!";
  static const String gettingStartedTitle2 = "Select Payment Method";
  static const String gettingStartedSubTitle2 =
      "For Seamless Transactions, Choose Your Payment Path - Your Convenience, Our Priority!";
  static const String gettingStartedTitle3 = "Deliver A Your Door Step";
  static const String gettingStartedSubTitle3 =
      "From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!";

  // -- Auth Form Texts
  static const String firstName = "First Name";
  static const String lastName = "Last Name";
  static const String email = "E-Mail";
  static const String password = "Password";
  static const String newPassword = "New Password";
  static const String userName = "Username";
  static const String phoneNumber = "Phone Number";
  static const String rememberMe = "Remember Me";
  static const String forgetPassword = "Forgot Password?";
  static const String signIn = "Sign In";
  static const String createAccount = "Create Account";
  static const String orSignInWith = "or sign in with";
  static const String orSignUpWith = "or sign up with";
  static const String iAgreeTo = "I agree to";
  static const String and = "and";
  static const String vContinue = "Continue";
  static const String privacyPolicy = "Privacy Policy";
  static const String termsOfUse = "Terms of use";
  static const String verificationCode = "Verification Code";
  static const String resendEmail = "Resend Email";
  static const String resendEmailIn = "Resend email in";
  static const String submit = "Submit";
  static const String done = "Done";

  // -- Auth Heading Texts
  static const String loginTitle = "Welcome back,";
  static const String loginSubtitle =
      "Discover Limitless Choices and Unmatched Convenient.";
  static const String signUpTitle = "Let's create your account";
  static const String forgetPasswordTitle = "Forget password";
  static const String forgetPasswordSubTitle =
      "Don't worry sometimes people can forgot too, enter your email and we will send you a password reset link.";
  static const String changeYourPasswordTitle = "Password Reset Email Sent";
  static const String changeYourPasswordSubTitle =
      "Your Account Security is Our Priority! We've Sent You a Secure Link to Safety Change Your Password and Keep Your Account Protected.";
  static const String confirmEmail = "Verify your email address!";
  static const String confirmEmailSubTitle =
      "Congratulation! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.";
  static const String emailNotReceivedMessage =
      "Didn't get the email? Check your junk/spam or resend it.";
  static const String yourAccountCreatedTitle =
      "Your account successfully created!";
  static const String yourAccountCreatedSubTitle =
      "Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!";

  // -- Home
  static const String homeAppBarTitle = "Welcome back";
  static const String homeAppBarSubTitle = "Ahmed Adnan";

  //
  static const termsOfUseMessage = '''
Effective Date: 01/06/2025

Welcome to InvoBay! By using this application, you agree to the following terms:

1. Acceptance of Terms
By accessing or using InvoBay, you accept these Terms of Use. If you do not agree, please do not use the app.

2. License
You are granted a non-exclusive, non-transferable license to use the app for inventory management purposes.

3. User Responsibilities
- You are responsible for maintaining the confidentiality of any information stored on your device.
- Do not use the app for illegal activities.

4. Permissions
To provide full functionality, InvoBay may request access to certain device features:
- Notifications: To send you important updates and alerts.
- Camera: To allow you to scan items or upload photos related to your inventory.
You can control these permissions at any time in your device settings. The app will not access these features without your consent.

5. Intellectual Property
All rights, title, and interest in the app remain with Ahmed V. Studio.

6. Limitation of Liability
Ahmed V. Studio is not liable for any damages arising from the use or inability to use the app.

7. Changes to Terms
We may update these terms at any time. Updated terms will be available within the app.

8. Contact
For any questions, contact us at ahmed47v@gmail.com.
''';

  static const privacyPolicyMessage = '''
Effective Date: 01/06/2025

InvoBay respects your privacy. This policy explains what information we collect and how we use it.

1. Data Collection
- Offline Usage: The app currently operates offline and does not collect or transmit any personal data.
- Crash Logs: In future updates, we may collect anonymous crash logs to help improve app stability. These logs will not contain personal information.

2. Use of Information
- Crash logs will be used solely for debugging and improving app performance.

3. Data Sharing
- We do not share any data with third parties.

4. Security
- All data remains on your device unless you choose to share it.

5. Changes to Policy
We may update this policy if features change. Updates will be available within the app.

6. Contact
If you have questions about this policy, contact us at ahmed47v@gmail.com.
''';

  ///
  static const termsOfUseMessageAR = '''
تاريخ السريان: 01/06/2025

مرحبًا بك في InvoBay ! باستخدامك لهذا التطبيق، فإنك توافق على الشروط التالية:

1. قبول الشروط
بدخولك أو استخدامك لتطبيق InvoBay، فإنك تقبل هذه الشروط. إذا كنت لا توافق، يرجى عدم استخدام التطبيق.

2. الترخيص
يُمنح لك ترخيص غير حصري وغير قابل للتحويل لاستخدام التطبيق لأغراض إدارة المخزون فقط.

3. مسؤوليات المستخدم
- أنت مسؤول عن الحفاظ على سرية أي معلومات مخزنة على جهازك.
- لا تستخدم التطبيق لأي أنشطة غير قانونية.

4. الأذونات
لتوفير كافة الوظائف، قد يطلب تطبيق InvoBay الوصول إلى بعض ميزات الجهاز:
- الإشعارات: لإرسال التحديثات والتنبيهات الهامة لك.
- الكاميرا: للسماح لك بمسح العناصر ضوئيًا أو تحميل صور تتعلق بمخزونك.
يمكنك التحكم في هذه الأذونات في أي وقت من إعدادات جهازك. لن يصل التطبيق لهذه الميزات دون موافقتك.

5. الملكية الفكرية
جميع الحقوق والملكية والمصلحة في التطبيق تعود إلى Ahmed V. Studio.

6. تحديد المسؤولية
لا يتحمل Ahmed V. Studio أي مسؤولية عن أي أضرار ناتجة عن استخدام أو عدم القدرة على استخدام التطبيق.

7. التغييرات على الشروط
قد نقوم بتحديث هذه الشروط في أي وقت. ستكون الشروط المحدثة متوفرة داخل التطبيق.

8. التواصل
لأي استفسارات، يرجى التواصل معنا على ahmed47v@gmail.com.
''';

  static const privacyPolicyMessageAR = '''
تاريخ السريان: 01/06/2025

InvoBay يحترم خصوصيتك. توضح هذه السياسة المعلومات التي نجمعها وكيفية استخدامها.

1. جمع البيانات
- الاستخدام دون اتصال: يعمل التطبيق حاليًا بدون اتصال بالإنترنت ولا يجمع أو يرسل أي بيانات شخصية.
- سجلات الأعطال: في التحديثات المستقبلية، قد نقوم بجمع سجلات أعطال مجهولة للمساعدة في تحسين استقرار التطبيق. هذه السجلات لن تحتوي على معلومات شخصية.

2. استخدام المعلومات
- سيتم استخدام سجلات الأعطال فقط لأغراض تصحيح الأخطاء وتحسين أداء التطبيق.

3. مشاركة البيانات
- لا نشارك أي بيانات مع أطراف ثالثة.

4. الأمان
- تظل جميع البيانات على جهازك ما لم تختر مشاركتها بنفسك.

5. التغييرات على السياسة
قد نقوم بتحديث هذه السياسة إذا تغيرت الميزات. ستكون التحديثات متوفرة داخل التطبيق.

6. التواصل
إذا كان لديك أي أسئلة حول هذه السياسة، يرجى التواصل معنا على ahmed47v@gmail.com.
''';
}
