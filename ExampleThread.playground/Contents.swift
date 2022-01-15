import UIKit

let generateThread = GenerateThread(chip: Chip.make())
let workThread = WorkThread(isWait: true)

generateThread.start()
workThread.start()
