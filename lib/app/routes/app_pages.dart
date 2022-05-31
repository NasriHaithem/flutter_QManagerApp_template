import 'package:get/get.dart';

import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/favorites/bindings/favorites_binding.dart';
import '../modules/home/views/favorites/views/favorites_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/organisations/bindings/organisations_binding.dart';
import '../modules/home/views/organisations/views/categories/bindings/categories_binding.dart';
import '../modules/home/views/organisations/views/categories/views/categories_view.dart';
import '../modules/home/views/organisations/views/organisation_details/bindings/organisation_details_binding.dart';
import '../modules/home/views/organisations/views/organisation_details/views/organisation_details_view.dart';
import '../modules/home/views/organisations/views/organisations_list/bindings/organisations_list_binding.dart';
import '../modules/home/views/organisations/views/organisations_list/views/organisations_list_view.dart';
import '../modules/home/views/organisations/views/organisations_view.dart';
import '../modules/home/views/profile/bindings/profile_binding.dart';
import '../modules/home/views/profile/views/account_credentials/bindings/account_credentials_binding.dart';
import '../modules/home/views/profile/views/account_credentials/views/account_credentials_view.dart';
import '../modules/home/views/profile/views/profile_view.dart';
import '../modules/home/views/profile/views/update_password/bindings/update_password_binding.dart';
import '../modules/home/views/profile/views/update_password/views/update_password_view.dart';
import '../modules/home/views/reservations/bindings/reservations_binding.dart';
import '../modules/home/views/reservations/views/reservations_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/on_boarding/bindings/on_boarding_binding.dart';
import '../modules/on_boarding/views/on_boarding_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.ORGANISATIONS,
          page: () => OrganisationsView(),
          binding: OrganisationsBinding(),
          children: [
            GetPage(
              name: _Paths.CATEGORIES,
              page: () => CategoriesView(),
              binding: CategoriesBinding(),
            ),
            GetPage(
              name: _Paths.ORGANISATIONS_LIST,
              page: () => OrganisationsListView(),
              binding: OrganisationsListBinding(),
            ),
            GetPage(
              name: _Paths.ORGANISATION_DETAILS,
              page: () => OrganisationDetailsView(),
              binding: OrganisationDetailsBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.FAVORITES,
          page: () => FavoritesView(),
          binding: FavoritesBinding(),
        ),
        GetPage(
          name: _Paths.RESERVATIONS,
          page: () => ReservationsView(),
          binding: ReservationsBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () => ProfileView(),
          binding: ProfileBinding(),
          children: [
            GetPage(
              name: _Paths.UPDATE_PASSWORD,
              page: () => UpdatePasswordView(),
              binding: UpdatePasswordBinding(),
            ),
            GetPage(
              name: _Paths.ACCOUNT_CREDENTIALS,
              page: () => AccountCredentialsView(),
              binding: AccountCredentialsBinding(),
            ),
          ],
        ),
      ],
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
