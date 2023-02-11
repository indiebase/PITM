import 'package:cached_memory_image/cached_memory_image.dart';
import 'package:disable_battery_optimization/disable_battery_optimization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notification_listener/flutter_notification_listener.dart';
import 'package:get/get.dart';
import 'package:pitm/i18n/i18n.dart';
import 'package:unicons/unicons.dart';

import '../add_rules/add_rules_controller.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final RulesController _rulesController = RulesController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 50),
        children: [
          ListTile(
            title: Text(
              'Settings'.tr,
              style: const TextStyle(fontSize: 34),
            ),
          ),
          const SizedBox(height: 10),
          Obx(
            () => Column(
              children: [
                _rulesController.rules.isEmpty
                    ? Container()
                    : const SizedBox(
                        height: 40,
                        child: ListTile(
                          title: Text(
                            "listening apps",
                            style: TextStyle(fontSize: 14, color: Colors.green),
                          ),
                        ),
                      ),
                ..._rulesController.rules
                    .map(
                      (element) => ListTile(
                        onTap: () {
                          Get.toNamed('/add_rules', parameters: {
                            "action": "update",
                            "packageName": element.packageName
                          });
                        },
                        trailing: InkWell(
                          onTap: () {
                            _rulesController.deleteRule(element);
                          },
                          child: Icon(
                            UniconsLine.times,
                            color: Colors.green[900],
                          ),
                        ),
                        leading: SizedBox(
                          width: 45,
                          height: 45,
                          child: CachedMemoryImage(
                            bytes: element.icon,
                            width: 45,
                            height: 45,
                            uniqueKey: element.packageName,
                          ),
                        ),
                        title: Text(element.appName),
                        subtitle: Text(element.packageName),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 40,
                child: ListTile(
                  title: Text(
                    "system".tr,
                    style: const TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  String code = Get.locale!.languageCode;

                  if (code.contains('en')) {
                    Get.updateLocale(TranslationService.zhCN);
                  }

                  if (code.contains('zh')) {
                    Get.updateLocale(TranslationService.enUS);
                  }
                },
                title: const Text("Language"),
                trailing: Text('_locale'.tr),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 40,
                child: ListTile(
                  title: Text(
                    "permission".tr,
                    style: const TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  NotificationsListener.openPermissionSettings();
                },
                title: Text("Notification listener permission".tr),
              ),
              ListTile(
                onTap: () async {
                  await DisableBatteryOptimization.showEnableAutoStartSettings(
                      "Enable Auto Start",
                      "Follow the steps and enable the auto start of this app");
                },
                title: Text("Auto start".tr),
              ),
              ListTile(
                onTap: () async {
                  await DisableBatteryOptimization
                      .showDisableBatteryOptimizationSettings();
                },
                title: Text("Battery optimization".tr),
              ),
              ListTile(
                onTap: () async {
                  await DisableBatteryOptimization
                      .showDisableManufacturerBatteryOptimizationSettings(
                          "Your device has additional battery optimization",
                          "Follow the steps and disable the optimizations to allow smooth functioning of this app");
                },
                title: Text("Manufacturer specific Battery Optimization".tr),
              ),
            ],
          )
        ],
      ),
    );
  }
}
