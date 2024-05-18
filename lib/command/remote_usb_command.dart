import 'package:args/command_runner.dart';
import 'package:remote_usb/service/process_service.dart';

abstract class RemoteUsbCommand extends Command {
  final service = ProcessService();

  String get port {
    return globalResults!.option("port")!;
  }

  String get address {
    return globalResults!.option("address")!;
  }
}
