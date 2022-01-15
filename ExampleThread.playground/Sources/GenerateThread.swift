import Foundation

/// Классс Генерации чипов

public class GenerateThread: Thread {

    let lockThread = NSCondition()
    let chip: Chip
    static var arrayChip: [Chip] = []

    public init(chip: Chip) {
        self.chip = chip
    }

    public override func main() {
        RunLoop.current.add(timerChip(), forMode: .common)
        RunLoop.current.run()
    }

    func timerChip() -> Timer {

        let timerCreateChip = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { _ in
            self.lockThread.lock()
            let chipObject = self.chip
            print("Создали экземпляр: \(chipObject)" )
            GenerateThread.arrayChip.append(chipObject)
            self.lockThread.signal()
            self.lockThread.unlock()
        })

        let timerEndCreateChip = Timer.scheduledTimer(withTimeInterval: 20, repeats: false) { _ in
            timerCreateChip.invalidate()
        }
        return timerEndCreateChip
    }
}
