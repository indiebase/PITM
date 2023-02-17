import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:system_info2/system_info2.dart';
import 'package:version/version.dart';

import '../../i18n/i18n.dart';

class GithubRelease {
  final String version;
  final String url;
  final int size;

  GithubRelease({required this.size, required this.url, required this.version});
}

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();

  late final PackageInfo? packageInfo;
  late final release = Rxn<GithubRelease>();
  final currentVersion = Rxn<Version>();
  final latestVersion = Rxn<Version>();

  _getArch(String name) {
    switch (name) {
      case 'X86_64':
        return 'x86_64';
      case 'ARM64':
        return 'arm64-v8a';
      case 'ARM':
        return 'armeabi-v7a';
      default:
        return '';
    }
  }

  Future<GithubRelease?> fetchGithubRelease(String owner, String repo) async {
    var res = await GetConnect()
        .get("https://api.github.com/repos/$owner/$repo/releases/latest");

    GithubRelease? resource;

    if (res.isOk) {
      String arch = _getArch(SysInfo.kernelArchitecture.name);
      Map body = res.body;

      if (body["tag_name"] != null && body["assets"] != null) {
        for (Map<dynamic, dynamic> asset in body["assets"]) {
          if (asset["content_type"] ==
                  "application/vnd.android.package-archive" &&
              asset["name"] == "pitm-release-${body["tag_name"]}-$arch.apk") {
            resource = GithubRelease(
              url: asset["browser_download_url"],
              version: body["tag_name"],
              size: asset["size"],
            );
          }
        }
      }
    }

    return resource;
  }

  bool hasNewVersion() {
    if (latestVersion.value != null &&
        currentVersion.value != null &&
        latestVersion.value! > currentVersion.value!) {
      return true;
    }
    return false;
  }

  Future<void> checkUpdate() async {
    await initGithubRelease();
    if (hasNewVersion()) {
      Get.defaultDialog(
        titlePadding: const EdgeInsets.only(top: 20),
        titleStyle: const TextStyle(fontSize: 22),
        contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        title: "${latestVersion.string} available!",
        // content: Column(
        //   children: [
        //     Text(
        //       latestVersion.string,
        //       style: const TextStyle(fontSize: 16),
        //     )
        //   ],
        // ),
        confirm: TextButton(
          child: const Text(
            "Update",
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      );
    } else {
      Fluttertoast.showToast(msg: 'Latest version');
    }
  }

  initGithubRelease() async {
    GithubRelease? res = await fetchGithubRelease("deskbtm-letscollab", "PITM");

    if (res != null) {
      release.value = res;
      latestVersion.value = Version.parse(res.version.replaceFirst("v", ''));
    }
  }

  @override
  void onInit() async {
    packageInfo = await PackageInfo.fromPlatform();
    currentVersion.value = Version.parse(packageInfo?.version ?? '');

    await initGithubRelease();

    super.onInit();
  }

  setLanguage() {
    String code = Get.locale!.languageCode;

    if (code.contains('en')) {
      Get.updateLocale(TranslationService.zhCN);
    }

    if (code.contains('zh')) {
      Get.updateLocale(TranslationService.enUS);
    }
  }
}
