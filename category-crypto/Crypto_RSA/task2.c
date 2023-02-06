/*
 * @Author: LuminolT luminol.chen@gmail.com
 * @Date: 2023-02-06 12:51:56
 * @LastEditors: LuminolT luminol.chen@gmail.com
 * @LastEditTime: 2023-02-06 14:33:59
 * @FilePath: /Lab-3-Crypto-RSA/task2.c
 * @Description:
 *
 * Copyright (c) 2023 by ${git_name_email}, All Rights Reserved.
 */

#include <openssl/bn.h>
#include <stdio.h>

#define NBITS 256

#define CB(x) case x:
#define CS(x)                                                                  \
  break;                                                                       \
  case x:
#define DF                                                                     \
  break;                                                                       \
  default:                                                                     \
    break;

void printBN(char *msg, BIGNUM *a) {
  /* Use BN_bn2hex(a) for hex string
   * Use BN_bn2dec(a) for decimal string */
  char *number_str = BN_bn2hex(a);
  printf("%s %s\n", msg, number_str);
  OPENSSL_free(number_str);
}

int main() {
  BN_CTX *ctx = BN_CTX_new();

  BIGNUM *n = BN_new();
  BIGNUM *e = BN_new();
  BIGNUM *d = BN_new();
  BIGNUM *msg_bn = BN_new();
  BIGNUM *c = BN_new();
  BIGNUM *msg_bn_prime = BN_new();

  // Initialize n, e, d, msg
  BN_hex2bn(&n,
            "DCBFFE3E51F62E09CE7032E2677A78946A849DC4CDDE3A4D0CB81629242FB1A5");
  BN_hex2bn(&e, "010001");
  BN_hex2bn(&d,
            "74D806F9F3A62BAE331FFE3F0A68AFE35B3D2E4794148AACBC26AA381CD7D30D");
  BN_hex2bn(&msg_bn, "4120746F702073656372657421");

  // c = m^e mod n
  BN_mod_exp(c, msg_bn, e, n, ctx);
  printBN("c  = ", c);

  // m' = c^d mod n
  BN_mod_exp(msg_bn_prime, c, d, n, ctx);
  printBN("m' = ", msg_bn_prime);

  // compare m and m'
  switch (BN_cmp(msg_bn, msg_bn_prime)) {
    CB(-1)
    printf("msg_bn not equal to msg_bn_prime\n");
    CS(0)
    printf("msg_bn equal to msg_bn_prime\n");
    DF
  }

  //   printf("%d\n", BN_cmp(msg_bn, msg_bn_prime));

  // print msg_bn, msg_bn_prime
  printBN("msg_bn       = ", msg_bn);
  printBN("msg_bn_prime = ", msg_bn_prime);

  return 0;
}