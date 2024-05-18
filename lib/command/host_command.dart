import 'dart:async';

import 'package:remote_usb/command/remote_usb_command.dart';

class HostCommand extends RemoteUsbCommand {
  @override
  String get description => "host Desc";

  @override
  String get name => "host";
  @override
  FutureOr? run() async {
    await service.restartUsbmuxd();
    await service.runSocat(port);
    await service.runHostUsbfluxd();
    print("Host run");
  }
}
