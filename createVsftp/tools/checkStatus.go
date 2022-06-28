package tools

func CheckStatus(e error) {
	if e != nil {
		panic(e)
	}
}
