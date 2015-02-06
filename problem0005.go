package main

import "fmt"

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

func max(a int, b int) int {
	if a > b {
		return a
	}
	return b
}

func main() {
	resultProducts := map[int]int{}
	for i := 2; i <= 20; i += 1 {
		factors := primeFactorsMap(i)
		for factor, count := range factors {
			resultProducts[factor] = max(resultProducts[factor], count)
		}
	}

	result := 1
	for factor, count := range resultProducts {
		for i := 0; i < count; i += 1 {
			result *= factor
		}
	}

	fmt.Println(result)
}
