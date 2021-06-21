import Foundation

class CoronaClass {
    
     var seats = [Int]()
    
     var seatPairs = [Pair]()
    
     let seatsCapacity: Int

     init(n: Int) {
        self.seatsCapacity = n
     }
     
     func seat() -> Int {
        seatPairs.removeAll()
        let elem = self.findPosition()
        seats.insert(elem.candidate, at: elem.pos)
        return elem.candidate
     }
     
     func leave(_ p: Int) {
        let idx = seats.firstIndex(of: p)
        seats.remove(at: idx!)
     }
}

extension CoronaClass {
    
    func findPosition() -> Pair {
        
        if self.seats.isEmpty {
            return Pair(first: 0, second: 0, pos: 0)
        }
        if self.seats.count == 1 {
            return Pair(first: 0, second: (self.seatsCapacity - 1) * 2, pos: 1)
        }
        if !self.seats.contains(0) {
            return Pair(first: 0, second: 0, pos: 0)
        }
        if !self.seats.contains(self.seatsCapacity - 1) {
            return Pair(first: 0, second: (self.seatsCapacity - 1) * 2, pos: self.seats.count)
        }
        for i in 1...self.seats.count - 1 {
            if (seats[i-1] + 1 != seats[i]) {
                seatPairs.append(Pair(first: seats[i-1], second: seats[i], pos: i))
            }
        }
        seatPairs.sort() {
            $0.prior > $1.prior
        }
        return seatPairs[0]
    }
    
}
