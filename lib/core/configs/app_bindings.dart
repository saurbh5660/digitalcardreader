import 'package:digital_card_grader/core/features/auth/controllers/forget_password_controller.dart';
import 'package:digital_card_grader/core/features/auth/controllers/set_password_controller.dart';
import 'package:digital_card_grader/core/features/card/controllers/card_grading_controller.dart';
import 'package:digital_card_grader/core/features/chat/controllers/chat_controller.dart';
import 'package:digital_card_grader/core/features/cms/controllers/cms_controller.dart';
import 'package:digital_card_grader/core/features/dashboard/controllers/dashboard_controller.dart';
import 'package:digital_card_grader/core/features/home/controllers/home_controller.dart';
import 'package:digital_card_grader/core/features/onboarding/controllers/onboarding_controller.dart';
import 'package:digital_card_grader/core/features/profile/controllers/edit_profile_controller.dart';
import 'package:digital_card_grader/core/features/profile/controllers/view_profile_controller.dart';
import 'package:digital_card_grader/core/features/setting/controllers/pack_controller.dart';
import 'package:get/get.dart';

import '../features/auth/controllers/change_password_controller.dart';
import '../features/auth/controllers/signin_controller.dart';
import '../features/auth/controllers/signup_controller.dart';
import '../features/auth/controllers/verfication_controller.dart';
import '../features/browse/controllers/browse_controller.dart';
import '../features/card/controllers/add_card_detail_controller.dart';
import '../features/card/controllers/payment_controller.dart';
import '../features/contact/controllers/contact_controller.dart';
import '../features/card/controllers/card_detail_controller.dart';
import '../features/message/controllers/message_controller.dart';
import '../features/profile/controllers/add_collection_controller.dart';
import '../features/profile/controllers/list_your_card_controller.dart';
import '../features/profile/controllers/profile_controller.dart';
import '../features/setting/controllers/setting_controller.dart';

class OnboardingBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}

class SigninBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SigninController());
  }
}

class SignupBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}

class VerificationBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerficationController());
  }
}

class ForgetPasswordBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}

class SetPasswordBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetPasswordController());
  }
}

class DashboardBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class CardDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardDetailController());
  }
}

class BrowseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BrowseController());
  }
}

class AddCardDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCardDetailController());
  }
}

class CardGradingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CardGradingController());
  }
}

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageController());
  }
}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}

class ListYourCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListYourCardController());
  }
}

class AddCollectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCollectionController());
  }
}

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
  }
}

class ViewProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewProfileController());
  }
}

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}

class CmsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CmsController());
  }
}

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactController());
  }
}


class PackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PacksController());
  }
}
