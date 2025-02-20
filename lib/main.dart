import 'package:flutter/material.dart';
import 'package:h_c_1/config/constants/enviroments.dart';
import 'package:h_c_1/config/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await Environment.initEnvironment();
  await initializeDateFormatting('es_EC', null);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      locale: const Locale('es', 'EC'),
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
