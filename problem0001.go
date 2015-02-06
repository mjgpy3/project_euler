package main

import "fmt"

type resObj struct {
	isDivisibleByAnyOf func([]int) bool
}

func theNumber (num int) resObj {
	result := resObj{}

	result.isDivisibleByAnyOf = func (values []int) bool {
		for _, v := range values {
			if num % v == 0 {
				return true
			}
		}
		return false
	}


	return result
}

type summer struct {
	sum int
}

func (self *summer) add(value int) {
	self.sum += value
}

func (self *summer) show() {
	fmt.Println(self.sum)
}

func main () {
	(func (counter summer, divisors []int) {

		for i := 0; i < 1000; i += 1 {
			if theNumber(i).isDivisibleByAnyOf(divisors){
				counter.add(i)
			}
		}

		counter.show()

	})(summer{}, []int{5, 3})
}
