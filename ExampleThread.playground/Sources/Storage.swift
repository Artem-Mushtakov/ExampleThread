import Foundation

public class Storage {
    
    private var count = 0
    private var condition = NSCondition()
    var storage: [Chip] = []
    public var isAvailable = false

    public var isEmpty: Bool {
        return storage.isEmpty
    }
    
    public init() {}
    
    func push(chip: Chip) {

        condition.lock()
        storage.append(chip)
        count += 1
        print("Экземпляр чипа № \(count) добавлен в хранилище.")
        isAvailable = true
        condition.signal()
        condition.unlock()
    }
    
    func pop() -> Chip {

        while (!isAvailable) {
            condition.wait()
        }
        
        let storageLast = storage.removeLast()
        condition.signal()
        condition.unlock()

        if isEmpty {
            isAvailable = false
        }

        return storageLast
    }
}
