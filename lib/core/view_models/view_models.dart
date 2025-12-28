import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'export.view_models.dart';
import 'package:pokemon/core/network/api_lock/export.api_lock.dart';

class AllProviders {
  static void disposeAllDisposableProviders(Ref ref) {
    DashboardProviders.disposeAllDisposableProviders(ref);
    ApiLockProviders.disposeAllDisposableProviders(ref);
  }
}

class DashboardProviders {
  static void disposeAllDisposableProviders(Ref ref) {
    // ref.read(notificationFiltersProvider.notifier).reset();
    // ref.read(groupNotificationFiltersProvider.notifier).reset();
  }
}

class ApiLockProviders {
  static void disposeAllDisposableProviders(Ref ref) {
    ref.read(apiFetchStatusProvider.notifier).disposeValues();
    ref.read(apiFetchDataProvider.notifier).disposeValues();
    ref.read(requestLockProvider.notifier).disposeValues(reason: 'Logout cleanup');
  }
}
