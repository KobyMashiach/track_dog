import 'package:package_info_plus/package_info_plus.dart';
import 'package:track_dog/core/global_vars.dart';

getAppFutureInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  globalAppName = packageInfo.appName;
  globalAppVersion = packageInfo.version;
}
