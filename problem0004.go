package main

import (
	"fmt"
	"strconv"
)

func isPalindrome(value string) bool {
	var aux func(int, int) bool
	aux = func(initial int, terminal int) bool{
		if initial >= terminal {
			return true
		}
		return value[initial] == value[terminal] && aux(initial+1, terminal-1)
	}

	return aux(0, len(value)-1)
}

func main () {
	var palindrome int
	for i := 999; i > 99; i -= 1 {
		for j := i; j > 99; j -= 1 {
			val := i*j
			if val > palindrome && isPalindrome(strconv.Itoa(val)) {
				palindrome = val
			}
		}
	}
	fmt.Println(palindrome)
}
