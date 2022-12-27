/*
 * @Author: LuminolT copper_sulfate@qq.com
 * @Date: 2022-12-24 22:32:56
 * @LastEditors: LuminolT copper_sulfate@qq.com
 * @LastEditTime: 2022-12-27 18:06:19
 * @FilePath: /Lab-2-Crpyto-Sym/task-7/main.go
 * @Description: a go script to crack the AES-CBC-128 encryption
 *
 * Copyright (c) 2022 by LuminolT copper_sulfate@qq.com, All Rights Reserved.
 */

package main

import (
	"bufio"
	"bytes"
	"crypto/cipher"
	"encoding/hex"
	"fmt"
	"os"
	"sync"

	mopenssl "github.com/microsoft/go-crypto-openssl/openssl"
)

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

/**
 * @description: CrackCBC check the ciphertext equals ENC(text_p, key, iv)
 * @param {[]byte} key
 * @param {[]byte} text_c
 * @param {[]byte} text_p
 * @param {[]byte} iv
 * @return {*}
 */
func CrackCBC(key []byte, text_c []byte, text_p []byte, iv []byte) (bool, []byte, error) {
	// get the probable key

	if len(key) > 16 {
		return false, nil, nil
	}

	// key padding with '#' to 16 bytes
	if len(key) < 16 {
		key = append(key, []byte("################")[:16-len(key)]...)
	}

	// initialization of encrypter
	type CBCEncrypter interface {
		NewCBCEncrypter(iv []byte) cipher.BlockMode
	}

	block, err := mopenssl.NewAESCipher(key)
	if err != nil {
		fmt.Println(err)
		return false, nil, err
	}

	encrypter := block.(CBCEncrypter).NewCBCEncrypter(iv) // CBC Encrpyter

	// encrypt the plaintext
	text_c_prime := make([]byte, len(text_c))
	encrypter.CryptBlocks(text_c_prime, text_p)

	// compare with the ciphertext
	if string(text_c) == string(text_c_prime) {
		return true, key, nil
	} else {
		return false, nil, nil
	}
}

/**
 * @description: main function
 * @return {*}
 */
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
	var wg sync.WaitGroup

	for scanner.Scan() {
		// get the probable key
		key := []byte(scanner.Text())
		wg.Add(1)
		go func() {
			flag, key_pad, err := CrackCBC(key, text_c, text_p, iv)
			if err != nil {
				fmt.Println(err)
			}
			if flag {
				fmt.Println("key: ", string(key_pad))
			}
		}()
	}
	wg.Wait()
}
