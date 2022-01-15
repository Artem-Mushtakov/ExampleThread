import Foundation

///Класс припайки чипов

public class WorkThread: Thread {

    let lockThread = NSCondition()
    var isWait: Bool

    public init(isWait: Bool) {
        self.isWait = isWait
    }

    public override func main() {
        RunLoop.current.add(solderTheChip(), forMode: .common)
        RunLoop.current.run()
    }

    func solderTheChip() -> Timer {
        let timerSolderTheChip = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true, block: { [unowned self] _ in
            lockThread.lock()
            guard GenerateThread.arrayChip.count != 0 else { return self.lockThread.wait()}
            GenerateThread.arrayChip.removeLast().sodering()
            print("\nПРИПОЯЛИ СХЕМУ: \(GenerateThread.arrayChip)")
            print("Количество экземпляров в массиве: \(GenerateThread.arrayChip.count) \n")
            lockThread.signal()
            lockThread.unlock()
        })
        return timerSolderTheChip
    }
}
