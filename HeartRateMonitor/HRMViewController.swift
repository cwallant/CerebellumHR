import UIKit
import CoreBluetooth
import AVFoundation

let heartRateServiceCBUUID = CBUUID(string: "0x180D")
let heartRateMeasurementCharacteristicCBUUID = CBUUID(string: "2A37")
let bodySensorLocationCharacteristicCBUUID = CBUUID(string: "2A38")
let synthesizer = AVSpeechSynthesizer()


class HRMViewController: UIViewController {
  
  @IBOutlet weak var heartRateLabel: UILabel!
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var bodySensorLocationLabel: UILabel!
  @IBOutlet weak var upperOutlet: UIButton!
  @IBOutlet weak var fullOutlet: UIButton!
  @IBOutlet weak var lowerOutlet: UIButton!
  var timer:Timer = Timer()
  var count:Int = 0
  var workoutActive = false
  var typeOfWorkout = "a full body workout"
  
  @IBAction func upperBody(_ sender: UIButton) {
    typeOfWorkout = "an upper body workout"
    sender.backgroundColor = UIColor(red: 1.00, green: 0.68, blue: 0.00, alpha: 1.00)
    fullOutlet.backgroundColor = UIColor(red: 0.00, green: 0.65, blue: 0.59, alpha: 1.00)
    lowerOutlet.backgroundColor = UIColor(red: 0.00, green: 0.65, blue: 0.59, alpha: 1.00)
  }
  @IBAction func fullBody(_ sender: UIButton) {
    typeOfWorkout = "a full body workout"
    sender.backgroundColor = UIColor(red: 1.00, green: 0.68, blue: 0.00, alpha: 1.00)
    upperOutlet.backgroundColor = UIColor(red: 0.00, green: 0.65, blue: 0.59, alpha: 1.00)
    lowerOutlet.backgroundColor = UIColor(red: 0.00, green: 0.65, blue: 0.59, alpha: 1.00)
  }
  @IBAction func lowerBody(_ sender: UIButton) {
    typeOfWorkout = "a lower body workout"
    sender.backgroundColor = UIColor(red: 1.00, green: 0.68, blue: 0.00, alpha: 1.00)
    fullOutlet.backgroundColor = UIColor(red: 0.00, green: 0.65, blue: 0.59, alpha: 1.00)
    upperOutlet.backgroundColor = UIColor(red: 0.00, green: 0.65, blue: 0.59, alpha: 1.00)
  }
  @IBAction func startWorkout(_ sender: UIButton) {
    if (workoutActive == false) {
      sender.setTitle("Finish Workout", for: [])
      sender.backgroundColor = UIColor(red: 1.00, green: 0.68, blue: 0.00, alpha: 1.00)
      workoutActive = true
      timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
      executeWorkout(typeOfWorkout:typeOfWorkout)
    }
    else {
      sender.setTitle("Start Workout", for: [])
      sender.backgroundColor = UIColor(red: 0.00, green: 0.65, blue: 0.59, alpha: 1.00)
      workoutActive = false
      timer.invalidate()
      finalizeWorkout()
      let storyboard = UIStoryboard(name: "Main", bundle: nil);
      let vc = storyboard.instantiateViewController(withIdentifier: "CompleteWorkout") ;
      self.present(vc, animated: true, completion: nil);
      timerLabel.text = "00:00:00"
      count = 0
    }
  }
  @objc func timerCounter() -> Void {
    count = count + 1
    let time = secondsToHoursMinutesSeconds(seconds: count)
    let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
    timerLabel.text = timeString
  }
  func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int) {
    return ((seconds / 3600), ((seconds % 3600) / 60),((seconds % 3600) % 60))
  }
  
  func makeTimeString(hours: Int, minutes: Int, seconds : Int) -> String {
    var timeString = ""
    timeString += String(format: "%02d", hours)
    timeString += ":"
    timeString += String(format: "%02d", minutes)
    timeString += ":"
    timeString += String(format: "%02d", seconds)
    return timeString
  }
  var centralManager: CBCentralManager!
  var heartRatePeripheral: CBPeripheral!

  override func viewDidLoad() {
    super.viewDidLoad()

    centralManager = CBCentralManager(delegate: self, queue: nil)

    // Make the digits monospaces to avoid shifting when the numbers change
    heartRateLabel.font = UIFont.monospacedDigitSystemFont(ofSize: heartRateLabel.font!.pointSize, weight: .regular)
  }

  func onHeartRateReceived(_ heartRate: Int) {
    heartRateLabel.text = String(heartRate)
    print("BPM: \(heartRate)")
  }
}

extension HRMViewController: CBCentralManagerDelegate {
  func centralManagerDidUpdateState(_ central: CBCentralManager) {
    switch central.state {
    case .unknown:
      print("central.state is .unknown")
    case .resetting:
      print("central.state is .resetting")
    case .unsupported:
      print("central.state is .unsupported")
    case .unauthorized:
      print("central.state is .unauthorized")
    case .poweredOff:
      print("central.state is .poweredOff")
    case .poweredOn:
      print("central.state is .poweredOn")
      centralManager.scanForPeripherals(withServices: [heartRateServiceCBUUID])
    }
  }

  func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
                      advertisementData: [String : Any], rssi RSSI: NSNumber) {
    print(peripheral)
    heartRatePeripheral = peripheral
    heartRatePeripheral.delegate = self
    centralManager.stopScan()
    centralManager.connect(heartRatePeripheral)
  }

  func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
    print("Connected!")
    heartRatePeripheral.discoverServices([heartRateServiceCBUUID])
  }
}

extension HRMViewController: CBPeripheralDelegate {
  func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
    guard let services = peripheral.services else { return }
    for service in services {
      print(service)
      peripheral.discoverCharacteristics(nil, for: service)
    }
  }

  func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
    guard let characteristics = service.characteristics else { return }

    for characteristic in characteristics {
      print(characteristic)

      if characteristic.properties.contains(.read) {
        print("\(characteristic.uuid): properties contains .read")
        peripheral.readValue(for: characteristic)
      }
      if characteristic.properties.contains(.notify) {
        print("\(characteristic.uuid): properties contains .notify")
        peripheral.setNotifyValue(true, for: characteristic)
      }
    }
  }

  func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
    switch characteristic.uuid {
    case bodySensorLocationCharacteristicCBUUID:
      print("ok")
    case heartRateMeasurementCharacteristicCBUUID:
      let bpm = heartRate(from: characteristic)
      onHeartRateReceived(bpm)
    default:
      print("Unhandled Characteristic UUID: \(characteristic.uuid)")
    }
  }

  private func bodyLocation(from characteristic: CBCharacteristic) -> String {
    guard let characteristicData = characteristic.value,
      let byte = characteristicData.first else { return "Error" }

    switch byte {
    case 0: return "Other"
    case 1: return "Chest"
    case 2: return "Wrist"
    case 3: return "Finger"
    case 4: return "Hand"
    case 5: return "Ear Lobe"
    case 6: return "Foot"
    default:
      return "Reserved for future use"
    }
  }

  private func heartRate(from characteristic: CBCharacteristic) -> Int {
    guard let characteristicData = characteristic.value else { return -1 }
    let byteArray = [UInt8](characteristicData)

    // See: https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.characteristic.heart_rate_measurement.xml
    // The heart rate mesurement is in the 2nd, or in the 2nd and 3rd bytes, i.e. one one or in two bytes
    // The first byte of the first bit specifies the length of the heart rate data, 0 == 1 byte, 1 == 2 bytes
    let firstBitValue = byteArray[0] & 0x01
    if firstBitValue == 0 {
      // Heart Rate Value Format is in the 2nd byte
      return Int(byteArray[1])
    } else {
      // Heart Rate Value Format is in the 2nd and 3rd bytes
      return (Int(byteArray[1]) << 8) + Int(byteArray[2])
    }
  }
}
