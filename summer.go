type summer struct {
	sum int
}

func (self *summer) add(value int) {
	self.sum += value
}

func (self *summer) show() {
	fmt.Println(self.sum)
}
