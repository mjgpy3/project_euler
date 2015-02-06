package main

import "fmt"

type factor struct {
    value int
    count int
}

func primeFactors(num int) []factor {
	result := []factor{}

	for i := 2; num != 1; i += 1 {
		if num % i == 0 {
			result = append(result, factor{i, 0})
		}

		for num % i == 0 {
			result[len(result)-1].count += 1
			num /= i
		}
	}

	return result
}

func main () {
	result := primeFactors(600851475143)

	fmt.Println(result[len(result)-1].value)
}
