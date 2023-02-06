/*
 * @Author: LuminolT luminol.chen@gmail.com
 * @Date: 2023-02-06 12:51:56
 * @LastEditors: LuminolT luminol.chen@gmail.com
 * @LastEditTime: 2023-02-06 13:53:18
 * @FilePath: /Lab-3-Crypto-RSA/task3.c
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
  //   BIGNUM *msg_bn_prime = BN_new();

  // Initialize n, e, d, c
  BN_hex2bn(&n,
            "DCBFFE3E51F62E09CE7032E2677A78946A849DC4CDDE3A4D0CB81629242FB1A5");
  BN_hex2bn(&e, "010001");
  BN_hex2bn(&d,
            "74D806F9F3A62BAE331FFE3F0A68AFE35B3D2E4794148AACBC26AA381CD7D30D");

  BN_hex2bn(&c,
            "8C0F971DF2F3672B28811407E2DABBE1DA0FEBBBDFC7DCB67396567EA1E2493F");

  // m = c^d mod n
  BN_mod_exp(msg_bn, c, d, n, ctx);
  printBN("m = ", msg_bn);

  return 0;
}