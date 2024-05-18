import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:remote_usb/command/client_command.dart';
import 'package:remote_usb/command/host_command.dart';

void main(List<String> arguments) async {
  final runner = CommandRunner("rusb", "rusb Desc Text");
  final parser = runner.argParser;
  parser.addOption("port", abbr: "p", defaultsTo: "5000");
  parser.addOption("address", abbr: "a", defaultsTo: "172.17.0.1");
  runner.addCommand(HostCommand());
  runner.addCommand(ClientCommand());

  runner.run(arguments).catchError((error) {
    if (error is! UsageException) {
      throw error;
    }
    print(error);
    exit(64);
  });
}
