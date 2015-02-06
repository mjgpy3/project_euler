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
