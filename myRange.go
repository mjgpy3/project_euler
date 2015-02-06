type myRange struct {
	sumOfSquares func() int
	squareOfSum func() int
}

func onRange(start int, finish int) myRange {
	result := myRange{}

	result.squareOfSum = func () int {
		var result int
		for i := start; i <= finish; i += 1 {
			result += i
		}
		return result*result
	}

	result.sumOfSquares = func () int {
		var result int
		for i := start; i <= finish; i += 1 {
			result += i*i
		}
		return result
	}

	return result
}
