import 'package:bank/blocs/auth/auth_bloc.dart';
import 'package:bank/blocs/user/user_bloc.dart';
import 'package:bank/shared/theme.dart';
import 'package:bank/ui/pages/Home/main_page.dart';
import 'package:bank/ui/pages/Home/nav_history_page.dart';
import 'package:bank/ui/pages/Home/nav_home_page.dart';
import 'package:bank/ui/pages/Home/nav_reward_page.dart';
import 'package:bank/ui/pages/Home/nav_statistic_page.dart';
import 'package:bank/ui/pages/Home/nav_transfer_page.dart';
import 'package:bank/ui/pages/PaketData_Page/data_provider_page.dart';
import 'package:bank/ui/pages/PaketData_Page/data_success_page.dart';
import 'package:bank/ui/pages/onboarding_page.dart';
import 'package:bank/ui/pages/pin_page.dart';
import 'package:bank/ui/pages/profile_Page/profile_edit_page.dart';
import 'package:bank/ui/pages/profile_Page/profile_edit_pin_page.dart';
import 'package:bank/ui/pages/profile_Page/profile_edit_success_page.dart';
import 'package:bank/ui/pages/profile_Page/profile_page.dart';
import 'package:bank/ui/pages/sign_in_page.dart';
import 'package:bank/ui/pages/sign_up_page.dart';
import 'package:bank/ui/pages/sign_up_success_page.dart';
import 'package:bank/ui/pages/splash_page.dart';
import 'package:bank/ui/pages/TopUp_Page/topup_page.dart';
import 'package:bank/ui/pages/TopUp_Page/topup_success.dart';
import 'package:bank/ui/pages/transfer_page.dart';
import 'package:bank/ui/pages/transfer_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          //? AuthBloc akan cek apakah ada user yg tersimpan di dalam local
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: background1,
          appBarTheme: AppBarTheme(
            backgroundColor: background1,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: whiteColor,
            ),
            titleTextStyle: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ),
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/nav_history_page': (context) => const HistoryPage(),
          '/nav_transfer_page': (context) => const NavTransferPage(),
          '/nav_statistic_page': (context) => const StatisticPage(),
          '/nav_reward_page': (context) => const RewardPage(),
          '/main_page': (context) => MainPage(),
          '/home': (context) => const HomePage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          '/profile': (context) => const ProfilePage(),
          '/pin': (context) => const PinPage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-pin': (context) => const ProfileEditPinPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
          '/topup': (context) => const TopupPage(),
          '/topup-success': (context) => const TopupSuccessPage(),
          '/transfer': (context) => const TransferPage(),
          '/transfer-success': (context) => const TransferSuccessPage(),
          '/data-provider': (context) => const DataProviderPage(),
          '/data-success': (context) => const DataSuccessPage(),
          '/reward': (context) => const DataSuccessPage(),
        },
      ),
    );
  }
}
