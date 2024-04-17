<?php

use Carbon\Carbon;
use GuzzleHttp\Exception\GuzzleException;
use Paco\PhpDemo\ActionRequest;
use Paco\PhpDemo\SecurityData;

class Payment extends ActionRequest
{
    /**
     * @throws GuzzleException
     * @throws Exception
     */
    public function ExecuteJose($merchantId, $accessToken, $sign_key, $decrypt_key, $orderNo, $paid_amt, $currency, $descInfo): string
    {
        $now = Carbon::now();
        //$orderNo = $now->getPreciseTimestamp(3);

        $request = [
            "apiRequest" => [
                "requestMessageID" => $this->Guid(),
                "requestDateTime" => $now->utc()->format('Y-m-d\TH:i:s.v\Z'),
                "language" => "en-US",
            ],
            "officeId" => $merchantId,
            "orderNo" => $orderNo,
            "productDescription" => $descInfo,
            "paymentType" => "CC",
            "paymentCategory" => "ECOM",
            "storeCardDetails" => [
                "storeCardFlag" => "N",
                "storedCardUniqueID" => "{{guid}}"
            ],
            "installmentPaymentDetails" => [
                "ippFlag" => "N",
                "installmentPeriod" => 0,
                "interestType" => null
            ],
            "mcpFlag" => "N",
            "request3dsFlag" => "Y",
            "transactionAmount" => [
                "amountText" => sprintf("%012d", ($paid_amt * 100)),
                "currencyCode" => $currency,
                "decimalPlaces" => 2,
                "amount" => $paid_amt
            ],
            "notificationURLs" => [
                "confirmationURL" => "http://localhost/sulav/includes/hblapiv2/hbl_response.php",
                "failedURL" => "http://localhost/sulav/includes/hblapiv2/hbl_response.php",
                "cancellationURL" => "http://localhost/sulav/includes/hblapiv2/hbl_response.php",
                "backendURL" => "http://localhost/sulav/includes/hblapiv2/hbl_response.php"
            ],
            "deviceDetails" => [
                "browserIp" => "1.0.0.1",
                "browser" => "Postman Browser",
                "browserUserAgent" => "PostmanRuntime/7.26.8 - not from header",
                "mobileDeviceFlag" => "N"
            ],
            "purchaseItems" => [
                [
                    "purchaseItemType" => "ticket",
                    "referenceNo" => $orderNo,
                    "purchaseItemDescription" => $descInfo,
                    "purchaseItemPrice" => [
                        "amountText" => sprintf("%012d", ($paid_amt * 100)),
                        "currencyCode" => $currency,
                        "decimalPlaces" => 2,
                        "amount" => $paid_amt
                    ],
                    "subMerchantID" => "string",
                    "passengerSeqNo" => 1
                ]
            ],
            "customFieldList" => [
                [
                    "fieldName" => "userDefined1",
                    "fieldValue" => $paid_amt
                ]
            ]
        ];

        $payload = [
            "request" => $request,
            "iss" => $accessToken,
            "aud" => "PacoAudience",
            "CompanyApiKey" => $accessToken,
            "iat" => $now->unix(),
            "nbf" => $now->unix(),
            "exp" => $now->addHour()->unix(),
        ];

        $stringPayload = json_encode($payload);
        $signingKey = $this->GetPrivateKey($sign_key);
        $encryptingKey = $this->GetPublicKey(SecurityData::$PacoEncryptionPublicKey);

        $body = $this->EncryptPayload($stringPayload, $signingKey, $encryptingKey);

        //third-party http client https://github.com/guzzle/guzzle
        $response = $this->client->post('api/1.0/Payment/prePaymentUi', [
            'headers' => [
                'Accept' => 'application/jose',
                'CompanyApiKey' => $accessToken,
                'Content-Type' => 'application/jose; charset=utf-8'
            ],
            'body' => $body
        ]);

        $token = $response->getBody()->getContents();
        $decryptingKey = $this->GetPrivateKey($decrypt_key);
        $signatureVerificationKey = $this->GetPublicKey(SecurityData::$PacoSigningPublicKey);

        return $this->DecryptToken($token, $decryptingKey, $signatureVerificationKey);
    }

}