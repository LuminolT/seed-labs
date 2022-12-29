/*
 * @Author: LuminolT luminol.chen@gmail.com
 * @Date: 2022-12-29 13:28:34
 * @LastEditors: LuminolT luminol.chen@gmail.com
 * @LastEditTime: 2022-12-29 13:36:49
 * @FilePath: /Lab-2-Crpyto-Sym/task-6/main.go
 * @Description:
 *
 * Copyright (c) 2022 by LuminolT luminol.chen@gmail.com, All Rights Reserved.
 */
package main

import (
	"encoding/hex"
	"fmt"
)

func main() {
	p1 := []byte("This is a known message!")
	c1, _ := hex.DecodeString("a469b1c502c1cab966965e50425438e1bb1b5f9037a4c159")
	c2, _ := hex.DecodeString("bf73bcd3509299d566c35b5d450337e1bb175f903fafc159")

	res := make([]byte, len(p1))
	for i := range p1 {
		res[i] = p1[i] ^ c1[i] ^ c2[i]
	}

	fmt.Println(string(res))
}
