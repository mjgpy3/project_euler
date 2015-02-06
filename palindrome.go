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
