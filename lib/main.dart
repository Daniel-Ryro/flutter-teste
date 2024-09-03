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
  // Ensure Flutter's bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables before any dependency injection
  await dotenv.load();

  // Set up dependency injection
  setupInjection();

  // Inicializa o FlutterSecureStorage
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  // Verifica se o usuário está logado
  String? accessToken = await secureStorage.read(key: 'accessToken');
  String initialRoute = AppRoutes.login;

  if (accessToken != null) {
    // Valida o token, ou tenta renová-lo
    try {
      // (opcional) Verifique se o token ainda é válido antes de usá-lo
      // Caso não seja, você pode tentar renovar o token aqui

      initialRoute = AppRoutes.main; // Defina a rota principal
    } catch (e) {
      print("Erro ao verificar ou renovar o token: $e");
      // Se falhar, permaneça na tela de login
    }
  }

  // Run the app
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
            Get.put<ViaCepController>(ViaCepController(sl<GetCepData>()));
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
