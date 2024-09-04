import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:guarda_digital_flutter/features/account/controller/account_controller.dart';
import 'package:guarda_digital_flutter/features/viacep/controller/viacep_controller.dart';
import 'package:guarda_digital_flutter/features/viacep/domain/usecases/get_cep_data.dart';
import 'package:guarda_digital_flutter/generated/l10n.dart';
import 'core/di/injection.dart';
import 'routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:guarda_digital_flutter/features/login/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  setupInjection();

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
          onGenerateRoute: AppRoutes.generateRoute,
          initialBinding: BindingsBuilder(() {
            Get.lazyPut<AuthController>(() => sl<AuthController>());
            Get.lazyPut<AccountController>(() => sl<AccountController>());
            Get.lazyPut<ViaCepController>(() => sl<ViaCepController>());
          }),
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
