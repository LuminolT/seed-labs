/*
 * @Author: LuminolT luminol.chen@gmail.com
 * @Date: 2022-12-29 13:49:02
 * @LastEditors: LuminolT luminol.chen@gmail.com
 * @LastEditTime: 2022-12-29 23:57:55
 * @FilePath: /6-3/main.go
 * @Description:
 *
 * Copyright (c) 2022 by LuminolT luminol.chen@gmail.com, All Rights Reserved.
 */
package main

import (
	"bytes"
	"encoding/hex"
	"fmt"
)

func main() {
	// bob_cipher, _ := hex.DecodeString("3885dc03cfa7315bed3b437e9de67335")
	bob_iv, _ := hex.DecodeString("a0dc0b660f47e5a33f99c49485373e45")

	next_iv, _ := hex.DecodeString("c8e19ee9b14cc46ccbd591f6774e40e3")

	// Guess 'Yes'

	text_p := []byte("Yes")
	text_p = PKCS7Padding(text_p, 16)

	fmt.Println(hex.EncodeToString(text_p))

	res := make([]byte, len(text_p))
	for i := range text_p {
		res[i] = text_p[i] ^ bob_iv[i] ^ next_iv[i]
	}

	fmt.Println(hex.EncodeToString(res)[:16])
	fmt.Println(res)
	fmt.Println(hex.EncodeToString(res))

}

/**
* @description: pad ciphertext with PKCS7
* @param {[]byte} ciphertext
* @param {int} blockSize
* @return {*}
 */
func PKCS7Padding(ciphertext []byte, blockSize int) []byte {
	padding := blockSize - len(ciphertext)%blockSize
	padtext := bytes.Repeat([]byte{byte(padding)}, padding)
	return append(ciphertext, padtext...)
}
