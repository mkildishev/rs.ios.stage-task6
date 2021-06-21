import Foundation

class CoronaClass {
    
     var seats = [Int]()
    
     let seatsCapacity: Int

     init(n: Int) {
        self.seatsCapacity = n
     }
     
     func seat() -> Int {
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
        var candidatePair = Pair(first: 0, second: 0, pos: 0)
        if !seats.contains(0) {
            let firstElem = seats.first ?? 0
            if let newCandidate = makeNewCandidatePair(candidatePrior: candidatePair.prior, first: -firstElem, second: firstElem, pos: 0) {
                candidatePair = newCandidate
            }
            
        } else if !seats.contains(seatsCapacity - 1) {
            let lastElem = seats.last!
            if let newCandidate = makeNewCandidatePair(candidatePrior: candidatePair.prior, first: lastElem, second: (seatsCapacity - 1) * 2 - lastElem, pos: seats.count) {
                candidatePair = newCandidate
            }
            
        }
        if (seats.isEmpty || seats.count - 1 == 0) {
            return candidatePair
        }
        for i in 1...seats.count - 1 {
            if let newCandidate = makeNewCandidatePair(candidatePrior: candidatePair.prior, first: seats[i-1], second: seats[i], pos: i) {
                candidatePair = newCandidate
            }
        }
        
        return candidatePair
    }
    
    func makeNewCandidatePair(candidatePrior: Int, first: Int, second: Int, pos: Int) -> Pair? {
        let newPair = Pair(first: first, second: second, pos: pos)
        if (newPair.prior > candidatePrior) {
            return newPair
        }
        return nil
    }
    
}
