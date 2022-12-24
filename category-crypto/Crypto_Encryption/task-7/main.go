package main

import (
	"encoding/hex"
	"fmt"

	mopenssl "github.com/microsoft/go-crypto-openssl/openssl"
)

func main() {
	// initalization of the openssl
	mopenssl.Init()

	// initial data: plaintext, ciphertext and iv
	text_p := []byte("This is a top secret.")
	text_c, err := hex.DecodeString("764aa26b55a4da654df6b19e4bce00f4ed05e09346fb0e762583cb7da2ac93a2")
	if err != nil {
		fmt.Println(err)
		return
	}

	iv, err := hex.DecodeString("aabbccddeeff00998877665544332211")
	if err != nil {
		fmt.Println(err)
		return
	}

	fmt.Println("plaintext: ", text_p)
	fmt.Println("ciphertext: ", text_c)
	fmt.Println("iv: ", iv)

	// build new aes key

}
