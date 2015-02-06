package main

import "fmt"

var UPPER_BOUND = 4000000

type fibGenerator struct {
	current int
	next int
}

func (self *fibGenerator) moveNext() {
	self.current, self.next = self.next, self.next + self.current
}

func fibs() fibGenerator {
	return fibGenerator{1, 2}
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
	fib := fibs()
	sum := summer{}

	for fib.current < UPPER_BOUND {
		if fib.current % 2 == 0 {
			sum.add(fib.current)
		}
		fib.moveNext()
	}
	sum.show()
}
