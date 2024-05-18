import 'dart:async';

import 'package:remote_usb/command/remote_usb_command.dart';

class ClientCommand extends RemoteUsbCommand {
  @override
  String get description => "client Desc";

  @override
  String get name => "client";

  @override
  FutureOr? run() async {
    await service.runClientUsbfluxd(address, port);
  }
}
