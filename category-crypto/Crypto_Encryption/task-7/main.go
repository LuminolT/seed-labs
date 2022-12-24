package main

import (
	"bufio"
	"bytes"
	"crypto/cipher"
	"encoding/hex"
	"fmt"
	"os"

	mopenssl "github.com/microsoft/go-crypto-openssl/openssl"
)

func PKCS7Padding(ciphertext []byte, blockSize int) []byte {
	padding := blockSize - len(ciphertext)%blockSize
	padtext := bytes.Repeat([]byte{byte(padding)}, padding)
	return append(ciphertext, padtext...)
}

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

	// plain text padding with PKCS7

	text_p = PKCS7Padding(text_p, 16)

	iv, err := hex.DecodeString("aabbccddeeff00998877665544332211")
	if err != nil {
		fmt.Println(err)
		return
	}

	// read file ./words.txt
	file, err := os.Open("words.txt")
	if err != nil {
		fmt.Println(err)
		return
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	iter := 1
	for scanner.Scan() {

		// get the probable key
		key := []byte(scanner.Text())

		if len(key) > 16 {
			continue
		}

		// iterator
		fmt.Printf("\r iter: %d | ", iter)
		iter++

		// key padding with '#' to 16 bytes
		if len(key) < 16 {
			key = append(key, []byte("################")[:16-len(key)]...)
		}

		// initialization of encrypter
		type extraModes interface {
			NewCBCEncrypter(iv []byte) cipher.BlockMode
		}

		block, err := mopenssl.NewAESCipher(key)
		if err != nil {
			fmt.Println(err)
			println(string(key))
			return
		}

		encrypter := block.(extraModes).NewCBCEncrypter(iv) // CBC Encrpyter

		// encrypt the plaintext
		text_c_prime := make([]byte, len(text_c))
		encrypter.CryptBlocks(text_c_prime, text_p)

		// compare with the ciphertext
		if string(text_c) == string(text_c_prime) {
			fmt.Println("key: ", string(key))
			break
		}
	}
}
