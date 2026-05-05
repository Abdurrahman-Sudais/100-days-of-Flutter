void main() {
  Device device1 = Device("iphone");
  device1.powerOn();
  SmartTV myTV = SmartTV("samsumg", 15);
  myTV.powerOn();
  myTV.connectToWifi();
  myTV.increaseVolume();
}

class Device {
  String? name;
  bool? _isPoweredOn;

  Device(this.name);

  void powerOn() {
    _isPoweredOn = true;
    print("$name is powered on!");
  }

  void powerOff() {
    _isPoweredOn = false;
    print("$name is powered off!");
  }
}

class Connectable {
  void connectToWifi() {
    print("Connected to wifi");
  }
}

class SmartTV extends Device with VolumeControl implements Connectable {
  int screenSize;

  SmartTV(String name, this.screenSize) : super(name);
  void connectToWifi() {
    print("$name connected to wifi!");
  }
}

mixin VolumeControl {
  void increaseVolume() {
    print("volume increased");
  }

  void decreaseVolume() {
    print("volume decreased");
  }
}
