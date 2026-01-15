import 'package:digital_card_grader/core/configs/app_bindings.dart';
import 'package:digital_card_grader/core/constants/app_routes.dart';
import 'package:digital_card_grader/core/features/auth/screens/change_password_screen.dart';
import 'package:digital_card_grader/core/features/auth/screens/forget_password_screen.dart';
import 'package:digital_card_grader/core/features/auth/screens/set_password_screen.dart';
import 'package:digital_card_grader/core/features/auth/screens/signin_screen.dart';
import 'package:digital_card_grader/core/features/auth/screens/verification_screen.dart';
import 'package:digital_card_grader/core/features/browse/screens/browse_screen.dart';
import 'package:digital_card_grader/core/features/card/screens/add_card_detail_screen.dart';
import 'package:digital_card_grader/core/features/card/screens/add_payment_card_screen.dart';
import 'package:digital_card_grader/core/features/card/screens/back_card_screen.dart';
import 'package:digital_card_grader/core/features/card/screens/card_grading_screen.dart';
import 'package:digital_card_grader/core/features/card/screens/collection_card_screen.dart';
import 'package:digital_card_grader/core/features/card/screens/payment_screen.dart';
import 'package:digital_card_grader/core/features/card/screens/front_card_screen.dart';
import 'package:digital_card_grader/core/features/chat/screens/chat_screen.dart';
import 'package:digital_card_grader/core/features/cms/screens/cms_screens.dart';
import 'package:digital_card_grader/core/features/contact/screens/contact_screen.dart';
import 'package:digital_card_grader/core/features/dashboard/screens/dashboard_screen.dart';
import 'package:digital_card_grader/core/features/card/screens/card_detail_screen.dart';
import 'package:digital_card_grader/core/features/home/screens/home_screen.dart';
import 'package:digital_card_grader/core/features/message/screens/message_screen.dart';
import 'package:digital_card_grader/core/features/onboarding/screens/onboarding_screen.dart';
import 'package:digital_card_grader/core/features/profile/screens/add_collection_image_screen.dart';
import 'package:digital_card_grader/core/features/profile/screens/add_collection_screen.dart';
import 'package:digital_card_grader/core/features/profile/screens/edit_profile_screen.dart';
import 'package:digital_card_grader/core/features/profile/screens/list_your_card_screen.dart';
import 'package:digital_card_grader/core/features/profile/screens/profile_screen.dart';
import 'package:digital_card_grader/core/features/profile/screens/view_profile_screen.dart';
import 'package:digital_card_grader/core/features/setting/pack_screen.dart';
import 'package:digital_card_grader/core/features/setting/screens/inventory_screen.dart';
import 'package:digital_card_grader/core/features/setting/screens/setting_screen.dart';
import 'package:digital_card_grader/core/features/success/screens/success_screen.dart';
import 'package:digital_card_grader/splash_screen.dart';
import 'package:get/get.dart';

import '../features/auth/screens/signup_screen.dart';

class AppPages {
  const AppPages._();

  static final all = <GetPage>[
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingScreen(),
      binding: OnboardingBinging(),
    ),
    GetPage(
      name: AppRoutes.signin,
      page: () => SigninScreen(),
      binding: SigninBinging(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupScreen(),
      binding: SignupBinging(),
    ),
    GetPage(
      name: AppRoutes.verification,
      page: () => VerificationScreen(),
      binding: VerificationBinging(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => ForgetPasswordScreen(),
      binding: ForgetPasswordBinging(),
    ),
    GetPage(
      name: AppRoutes.setPassword,
      page: () => SetPasswordScreen(),
      binding: SetPasswordBinging(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardScreen(),
      binding: DashboardBinging(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.cardDetail,
      page: () => CardDetailScreen(),
      binding: CardDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.browse,
      page: () => BrowseScreen(),
      binding: BrowseBinding(),
    ),
    GetPage(
      name: AppRoutes.addCardDetail,
      page: () => AddCardDetailScreen(),
      binding: AddCardDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.cardGrading,
      page: () => CardGradingScreen(),
      binding: CardGradingBinding(),
    ),
    GetPage(
      name: AppRoutes.payment,
      page: () => PaymentScreen(),
      binding: PaymentBinding(),
    ),
    GetPage(name: AppRoutes.addPaymentCard, page: () => AddPaymentCardScreen()),
    GetPage(
      name: AppRoutes.chat,
      page: () => ChatScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.message,
      page: () => MessageScreen(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.listCard,
      page: () => ListYourCardScreen(),
      binding: ListYourCardBinding(),
    ),
    GetPage(
      name: AppRoutes.addCollection,
      page: () => AddCollectionScreen(),
      binding: AddCollectionBinding(),
    ),
    GetPage(
      name: AppRoutes.addCollectionImage,
      page: () => AddCollectionImageScreen(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => EditProfileScreen(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.viewProfile,
      page: () => ViewProfileScreen(),
      binding: ViewProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => SettingScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.cms,
      page: () => CmsScreens(),
      binding: CmsBinding(),
    ),
    GetPage(
      name: AppRoutes.contact,
      page: () => ContactScreen(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: AppRoutes.pack,
      page: () => PacksScreen(),
      binding: PackBinding(),
    ),
    GetPage(
      name: AppRoutes.uploadCard,
      page: () => FrontCardsScreen(),
    ),
    GetPage(
      name: AppRoutes.uploadBackCard,
      page: () => BackCardScreen(),
    ),
    GetPage(
      name: AppRoutes.collectionCardScreen,
      page: () => CollectionCardScreen(),
      binding: CollectionCardBinding(),
    ),
    GetPage(
      name: AppRoutes.success,
      page: () => SuccessScreen(
        title: Get.arguments["title"],
        onPressed: Get.arguments["onPressed"],
      ),
    ),
    GetPage(
      name: AppRoutes.inventory,
      page: () => InventoryScreen(),
    ),
  ];
}
