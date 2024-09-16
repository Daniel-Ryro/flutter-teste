import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:guarda_digital_flutter/features/account/controller/account_controller.dart';
import 'package:guarda_digital_flutter/features/account/domain/usecases/add_executor.dart';
import 'package:guarda_digital_flutter/features/account/domain/usecases/get_account_data.dart';
import 'package:guarda_digital_flutter/features/account/domain/usecases/get_beneficiaries.dart';
import 'package:guarda_digital_flutter/features/account/domain/usecases/get_executors.dart';
import 'package:guarda_digital_flutter/features/login/controllers/auth_controller.dart';
import 'package:guarda_digital_flutter/features/login/domain/repositories/auth_repository.dart';
import 'package:guarda_digital_flutter/features/login/domain/usecases/login_use_case.dart';
import 'package:guarda_digital_flutter/features/login/domain/usecases/sign_up_use_case.dart';
import 'package:guarda_digital_flutter/generated/l10n.dart';
import 'core/di/injection.dart';
import 'routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  // Configura as injeções de dependência
  setupInjection();

    Get.put<AuthController>(AuthController(
    loginUseCase: sl<LoginUseCase>(),
    signUpUseCase: sl<SignUpUseCase>(),
    authRepository: sl<AuthRepository>(),
  ));

  Get.put<AccountController>(AccountController(
    sl<GetAccountData>(),
    sl<GetExecutors>(),
    sl<AddExecutor>(),
    sl<GetBeneficiaries>(),
  ));

  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  String? accessToken = await secureStorage.read(key: 'accessToken');
  String initialRoute = AppRoutes.login;

  if (accessToken != null) {
    try {
      initialRoute = AppRoutes.main;
    } catch (e) {
      print("Erro ao verificar ou renovar o token: $e");
    }
  }

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Guarda Digital',
          initialRoute: initialRoute,
          getPages: AppRoutes.pages,  // Use getPages para definir as rotas
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        );
      },
    );
  }
}
