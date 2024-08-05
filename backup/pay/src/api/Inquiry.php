<?php

use Carbon\Carbon;
use GuzzleHttp\Exception\GuzzleException;
use Paco\PhpDemo\ActionRequest;
use Paco\PhpDemo\SecurityData;

class Inquiry extends ActionRequest
{
    /**
     * @throws GuzzleException
     * @throws Exception
     */
    public function ExecuteJose($merchantId, $accessToken, $signKey, $decryptKey, $orderNo, $currency): string
    {
        $now = Carbon::now();
        //$accessToken = ($currency == 'USD') ? SecurityData::$AccessTokenUsd : SecurityData::$AccessTokenNpr;

        $request = [
            "apiRequest" => [
                "requestMessageID" => $this->Guid(),
                "requestDateTime" => $now->utc()->format('Y-m-d\TH:i:s.v\Z'),
                "language" => "en-US",
            ],
            "advSearchParams" => [
                "controllerInternalID" => null,
                "officeId" => [
                    $merchantId
                ],
                "orderNo" => [
                    $orderNo
                ],
                "invoiceNo2C2P" => null,
                "fromDate" => "0001-01-01T00:00:00",
                "toDate" => "0001-01-01T00:00:00",
                "amountFrom" => null,
                "amountTo" => null
            ],
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
        $signingKey = $this->GetPrivateKey($signKey);
        $encryptingKey = $this->GetPublicKey(SecurityData::$PacoEncryptionPublicKey);

        $body = $this->EncryptPayload($stringPayload, $signingKey, $encryptingKey);

        //third-party http client https://github.com/guzzle/guzzle
        $response = $this->client->post('api/1.0/Inquiry/transactionList', [
            'headers' => [
                'Accept' => 'application/jose',
                'CompanyApiKey' => $accessToken,
                'Content-Type' => 'application/jose; charset=utf-8'
            ],
            'body' => $body
        ]);

        $token = $response->getBody()->getContents();
        $decryptingKey = $this->GetPrivateKey($decryptKey);
        $signatureVerificationKey = $this->GetPublicKey(SecurityData::$PacoSigningPublicKey);

        return $this->DecryptToken($token, $decryptingKey, $signatureVerificationKey);
    }


}