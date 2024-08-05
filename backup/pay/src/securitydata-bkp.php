<?php

namespace Paco\PhpDemo;

class SecurityData
{
    public static string $MerchantId = "9100931542";
    /**
     * JWE Key Id.
     *
     * @var string
     */
    public static string $EncryptionKeyId = "19f84b5655f04e25a99b09f1ee2fac78";

    /**
     * Access Token.
     *
     * @var string
     */

    //public static string $AccessToken = "e8b4be492c5746859df2720f51956d5d"; //required from Bank(USD)
    public static string $AccessToken = "8706d45948b811edaf360279bcee2f04";

    /**
     * Token Type - Used in JWS and JWE header.
     *
     * @var string
     */
    public static string $TokenType = "JWT";

    /**
     * JWS (JSON Web Signature) Signature Algorithm - This parameter identifies the cryptographic algorithm used to
     * secure the JWS.
     *
     * @var string
     */
    public static string $JWSAlgorithm = "PS256";

    /**
     * JWE (JSON Web Encryption) Key Encryption Algorithm - This parameter identifies the cryptographic algorithm
     * used to secure the JWE.
     *
     * @var string
     */
    public static string $JWEAlgorithm = "RSA-OAEP";

    /**
     * JWE (JSON Web Encryption) Content Encryption Algorithm - This parameter identifies the content encryption
     * algorithm used on the plaintext to produce the encrypted ciphertext.
     *
     * @var string
     */
    public static string $JWEEncrptionAlgorithm = "A128CBC-HS256";

    /**
     * Merchant Signing Private Key is used to cryptographically sign and create the request JWS.
     *
     * @var string
     */
    public static string $MerchantSigningPrivateKey = "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";
    /**
     * PACO Encryption Public Key is used to cryptographically encrypt and create the request JWE.
     *
     * @var string
     */
    public static string $PacoEncryptionPublicKey = "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA6ZLups2K0iYEMxQqgASX8gY6tWhNVCp08YuDgjCsOVrGVgUHD0dh0TWFNJ7Lq2Jp0SOsGgi54+hrjwPOL2CCZxw8pKUlL57UksoD9oWUrK/KkSvEAwPU4cZqzxIXyhBcZb8O96iN4WQJILkRTg+DXLkML6qisO496fPGIs+vCoc87toucy5O9fRfaYSjcqjreyi8JDkvVJM/BeNtOEM2a0b/lcWa67RH+tN97H25k+Qez7QthLru6oBfWBgD6iIwhV+ICqLWHmp6fQ+DHQk/o+OO3yFiY9OAvMiy8MOTinvkBlFwYgYNznG3/w0Xh8U5vtudUXPDNUO6ddf4y99+6LlWDiKgJn/Th93YUg+gFH4LUJHyPrSY2JuC+Q8kksp2xyiZDTHGzi96kturwrqCui6TytCHcU4UB0VRMR+M7VRl3S2YPhcxv5U8Fh2PITqydZE5vv1Va06qhegjOlSZnEUl2xKPm5k/u+UHvUP/oq04fQLTlYqyA3JYDCe4z5Ea2SOgjeVl+qTatWYzmkUXyCONLZ4UaRrgbYCp0nCPHoTFgRQdChu8ezDbnYY9IW7cT/s2fEi5N7X1XrQttiEP4rbn0y0qVYYjN86+elfhtYGHidZTUSUS5RSTHqOkj59p5LIGwFF9iTXzCjfUqq8clnfOk76qSLY1+Kj+SMMe6Z8CAwEAAQ==";
    /**
     * PACO Signing Public Key is used to cryptographically verify the response JWS signature.
     *
     * @var string
     */
    public static string $PacoSigningPublicKey = "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAr0XW6QacR8GilY4nZrJZW40wnFeYu7h9aXUSqxCP6djurCWZmLqnrsYWP7/HR8WOulYPHTVpfqJesTOdVqPgY6p10H811oRbJG9jvsG8j8kn/Bk8b2wZ9qelNqdNJMDbR5WUyaytaDWW6QdI4+clqjFfwCOw76noDSe+R4pDSzgMiyCk5R4m2ECT1fv/4Axz2bvLN+DRTg5DPPIMLWpA87lgjxeaDlGyJqZCbkJozW7JX0AJVc0X7YR9kzbiTi3LVOInSKY+VHT8yCARIdvXtKc6+IWSbVQqgpNIBB8GN0OvU8xedjPNCMGZnnMtgd7XLTf/okyadbdNLAqQLTbDs/5HnIVx8FyfgiOS/zsim5ivi3ljVAW3T3ePGjkY0q1DMzr5iJ4m/WTL2d1TArlfHyQhkSpFpQPOO+pJyVQqttHJo99vMirQogdSx4lIu//aod0yJyJLpjCeiqb2Fz3Qk0AZ4S78QKeeGsxTRchTP6Wsb6okaZd+cFi6z8qbP0z/Y3xRZO7vOLB/whkqS+pMVKBQ42YzgQPRzbXXmgCkf1nCqgrD9bnIB5ovdRGfDXW86GKY8XwGVjb4BoMvql+HsbonKHAO+eGfQulpB5YfQGQU3ZXdMdfCLAk8FuqemH4k7S7diLzVvRCuisHsEx6qJ4ewxzNCvW7OGVinTR9NSQUCAwEAAQ==";
    /**
     * Merchant Decryption Private Key used to cryptographically decrypt the response JWE.
     * @var string
     */
    public static string $MerchantDecryptionPrivateKey = "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";
}