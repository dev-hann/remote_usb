import 'dart:async';

import 'package:remote_usb/command/remote_usb_command.dart';

class HostCommand extends RemoteUsbCommand {
  @override
  String get description =>
      "Run in the host machine. (connected physical usb machine)";

  @override
  String get name => "host";
  @override
  FutureOr? run() async {
    print("Run Remote Usb Host..");
    await service.restartUsbmuxd();
    await service.initSocat(port);
    await service.initHostUsbfluxd();
  }
}
