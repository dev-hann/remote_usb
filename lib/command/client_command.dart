import 'dart:async';

import 'package:remote_usb/command/remote_usb_command.dart';

class ClientCommand extends RemoteUsbCommand {
  @override
  String get description =>
      "Run in the client machine. (passthrough usb machine)";

  @override
  String get name => "client";

  @override
  FutureOr? run() async {
    print("Run Remote Usb Client..");
    await service.initClientUsbfluxd(address, port);
  }
}
