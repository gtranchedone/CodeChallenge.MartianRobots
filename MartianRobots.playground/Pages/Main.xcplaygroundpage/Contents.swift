//: [Previous](@previous)

import Foundation

/// See the contents of the `Sources` folder of the playground - `MarsRobots` - for
/// the implementation of the data structures used here.

let input = """
5 3
1 1 E
RFRFRFRF
3 2 N
FRRFLLFFRRFLL
0 3 W
LLFFFLFLFL
"""

let expectedOutput = """
1 1 E
3 3 N LOST
2 3 S
"""

do {
    let runner = ProgramRunner(input: input)
    let output = try runner.run()
    print(output)
    assert(output == expectedOutput)
}
catch {
    print("!!! An error occurred: \(error)")
}

//: [Next](@next)
