type factor struct {
    value int
    count int
}

type pfHandler struct {
	then func(func(int), func(int))
}

func findPrimeFactorsBetween(start int, finish int) pfHandler {
	result := pfHandler{}
	result.then = func(foundFn func(int), repeatesFn func(int)) {
		for i := start; finish != 1; i += 1 {
			if finish % i == 0 {
				foundFn(i)
			}

			for finish % i == 0 {
				repeatesFn(i)
				finish /= i
			}
		}
	}

	return result
}

func primeFactorsMap(num int) map[int]int {
	result := map[int]int{}

	findPrimeFactorsBetween(2, num).then(func (factor int) {
		result[factor] = 0
	}, func (factor int) {
		result[factor] += 1
	});

	return result
}

func primeFactors(num int) []factor {
	result := []factor{}

	findPrimeFactorsBetween(2, num).then(func (factor int) {
		result = append(result, factor{i, 0})
	}, func (factor int) {
		result[len(result)-1].count += 1
	});

	return result
}
