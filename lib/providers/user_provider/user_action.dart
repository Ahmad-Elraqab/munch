import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:munch_app/providers/user_provider/user_provider.dart';

final userProvider = Provider((ref) => UserProvider());
final setLoading = ChangeNotifierProvider((ref) => UserProvider());

final loginProvider = FutureProvider.autoDispose.family(
  (ref, con) async {
    final httpClient = ref.watch(setLoading);
    await httpClient.login(con);
  },
);
