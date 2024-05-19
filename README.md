# Remote Usb

## Passthrough USB Connection by Local Network

`remote-usb` is a CLI tool that facilitates USB connections over a local network using `usbmuxd` and `socat`. It allows you to connect USB devices on a remote host, making USB management more flexible and accessible.

## Features

- **Remote Access**: Connect and manage USB devices on a remote host.
- **Network Flexibility**: Operates over the same local network.
- **Ease of Use**: Simple commands to set up host and client connections.

## Requirements

To use remote-usb, you need the following tools installed on your system:

- [usbmuxd](https://github.com/libimobiledevice/usbmuxd)
- [usbfluxd](https://github.com/corellium/usbfluxd)
- [socat](https://github.com/3ndG4me/socat)

## Installation

To use `remote-usb`, you need to have Dart installed on your system. You can install Dart from [dart.dev](https://dart.dev/get-dart).

Clone this repository and navigate to the project directory:

```bash
git clone https://github.com/dev-hann/remote_usb.git
cd remote_usb
```

## Usage

```bash
rusb <command> [arguments]
```

### Global Options

- `-h`, `--help`       Print usage information.
- `-p`, `--port`       Specify the port (defaults to `5000`).
- `-a`, `--address`    Specify the address (defaults to `172.17.0.1`).

### Available Commands

#### `client`

Run in the client machine to connect to a remote host and access USB devices.

**Usage:**

```bash
rusb client [options]
```

**Options:**

- `-p`, `--port`       Specify the port to connect to on the host machine.
- `-a`, `--address`    Specify the address of the host machine.

**Example:**

```bash
rusb client -p 5000 -a 192.168.1.100
```

#### `host`

Run in the host machine to share connected USB devices over the network.

**Usage:**

```bash
rusb host [options]
```

**Options:**

- `-p`, `--port`       Specify the port to listen on for incoming connections.

**Example:**

```bash
rusb host -p 5000
```

## Examples

### Setting Up the Host

Run the following command on the machine with the physical USB devices:

```bash
rusb host -p 5000
```

### Connecting a Client

Run the following command on the machine that needs to access the remote USB devices:

```bash
rusb client -p 5000 -a 192.168.1.100
```

## Detailed Description

`remote-usb` uses `usbmuxd` to manage USB device connections and `socat` to handle network communication. By setting up a host on one machine and connecting clients from other machines on the same network, you can seamlessly access and manage USB devices remotely.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss what you would like to change.

## License

This project is licensed under the MIT License.

---

By using this README, you can effectively communicate the purpose, usage, and setup instructions for your `remote-usb` CLI tool on GitHub.
