import Foundation

/// Классс Генерации чипов

public class GenerateThread: Thread {
    
    private var storage: Storage
    
    public init(storage: Storage) {
        self.storage = storage
    }
    
    public override func main() {
        RunLoop.current.add(createChip(), forMode: .common)
        RunLoop.current.run(until: Date.now + 20)
    }
    
    public func createChip() -> Timer {
        let timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { [unowned self] _ in
            storage.push(chip: Chip.make())
        })
        return timer
    }
}
