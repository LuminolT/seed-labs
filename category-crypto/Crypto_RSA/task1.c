/*
 * @Author: LuminolT luminol.chen@gmail.com
 * @Date: 2023-02-06 12:51:56
 * @LastEditors: LuminolT luminol.chen@gmail.com
 * @LastEditTime: 2023-02-06 13:42:08
 * @FilePath: /Lab-3-Crypto-RSA/task1.c
 * @Description:
 *
 * Copyright (c) 2023 by ${git_name_email}, All Rights Reserved.
 */

#include <openssl/bn.h>
#include <stdio.h>

#define NBITS 256

void printBN(char *msg, BIGNUM *a) {
  /* Use BN_bn2hex(a) for hex string
   * Use BN_bn2dec(a) for decimal string */
  char *number_str = BN_bn2hex(a);
  printf("%s %s\n", msg, number_str);
  OPENSSL_free(number_str);
}

int main() {
  BN_CTX *ctx = BN_CTX_new();

  BIGNUM *p = BN_new();
  BIGNUM *q = BN_new();
  BIGNUM *n = BN_new();
  BIGNUM *phi_n = BN_new();
  BIGNUM *e = BN_new();
  BIGNUM *d = BN_new();

  // Initialize p, q, e
  BN_hex2bn(&p, "F7E75FDC469067FFDC4E847C51F452DF");
  BN_hex2bn(&q, "E85CED54AF57E53E092113E62F436F4F");
  BN_hex2bn(&e, "0D88C3");

  // n = p * q
  BN_mul(n, p, q, ctx);

  // phi_n = (p-1) * (q-1)
  BN_sub(p, p, BN_value_one());
  BN_sub(q, q, BN_value_one());
  BN_mul(phi_n, p, q, ctx);

  // d = e^-1 mod phi_n
  BN_mod_inverse(d, e, phi_n, ctx);

  // print the decryption exponent
  printBN("d = ", d);

  return 0;
}