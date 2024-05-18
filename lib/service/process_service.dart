import 'dart:convert';
import 'dart:io';

class ProcessService {
  Future _run(String command) async {
    final process = await Process.start(
      'sudo',
      command.split(" "),
    );
    _printOutput(process);
    return process;
  }

  Future restartUsbmuxd() {
    return _run(
      "systemctl restart usbmuxd",
    );
  }

  Future runSocat(String port) {
    return _run(
      "socat tcp-listen:$port,fork unix-connect:/var/run/usbmuxd",
    );
  }

  Future runHostUsbfluxd() {
    return _run(
      "usbfluxd -f -n",
    );
  }

  Future runClientUsbfluxd(String address, String port) {
    return _run(
      "usbfluxd -f -r $address:$port",
    );
  }

  Future<void> _printOutput(Process process) async {
    process.stdout
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .listen((value) {
      print(value);
    });

    process.stderr
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .listen((value) {
      print(value);
    });
  }
}
