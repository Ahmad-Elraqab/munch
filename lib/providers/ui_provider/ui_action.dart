import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:munch_app/providers/ui_provider/ui_provider.dart';

final uiProvider = Provider((ref) => UiProvider());
final languageProvider = Provider.family(
  (ref, con) {
    final httpClient = ref.read(uiProvider);
    httpClient.changeLanguage(con);
  },
);
