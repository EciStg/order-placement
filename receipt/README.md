

# Receipt

    Accept: application/json
    Accept: application/xml
    Accept: application/vnd.eci.stg.receipt.json
    Accept: application/vnd.eci.stg.receipt.xml
    Accept: application/vnd.eci.stg.receipt-1.5.0.json
    Accept: application/vnd.eci.stg.receipt-1.5.0.xml


## tl;dr

Conceptually, a receipt extends an order e.g **`order V (package X shipment X tracking)`**. Compare
the order schema with the receipt schema, ignoring a few details, and the additions in defined in the
tuple above are easy to see.

    106a107,125
    >     "package": {
    >       "description": "",
    >       "type": "integer",
    >       "minimum": 1
    >     },
    >
    >     "shipment": {
    >       "description": "",
    >       "type": "integer",
    >       "minimum": 1
    >     },
    >
    >     "tracking": {
    >       "description": "",
    >       "type": "string",
    >       "minLength": 1,
    >       "maxLength": 32
    >     },
    >

The example diff below shows the most commonly added extenstion to the order, a tracking number.

    23,24c23,24
    <   "when": "2018-04-24T17:00:00.000Z",
    <   "whenExpected": "2018-07-24T17:00:00.000Z",
    ---
    >   "when": "2018-06-24T17:00:00.000Z",
    >   "whenExpected": "2018-08-24T17:00:00.000Z",
    29a30
    >   "tracking": "T-LMNOP-123",


### Example receipt

The Seller may create a receipt by make a few small modifications to an order.

-   [required] Add a tracking number
-   [optional] Populate the date when the shipment was sent or omit `when` from the receipt
-   [optional] Populate the date the shipment is expected to be delivered or omit whenExpected~ from the receipt
-   [optional] Supply a shipment number
-   [optional] Supply a pacakge number

Let us assume the Buyer has placed an order (two code blocks down). When the order has been fulfilled
and shipped the Seller will POST a shipping receipt providing tracking information for one shipment
with tracking number **T-LMNOP-123**. In the section below called UseCases, we will demonstrate other
ways the receipt can be expressed.

    { "reference": { "referencesCount": 2,
                     "references": [ {"code": "PO-2159403-2",
                                      "type": "buyer" },
                                     {"code": "PO-abc-q",
                                      "type": "consumer" }]},
      "buyer": { "reference": { "code": "buyer-abc",
                                "type": "seller" }},
      "consumer": { "reference": { "code": "consumer-xyz",
                                   "type": "seller" },
                    "contract": { "code": "contract-789",
                                  "type": "seller" }},
      "shipTo": { "location": { "mtn": "Jane Doe",
                                "rcp": "ECI Solutions, STG",
                                "alt": "Suite #200",
                                "dal": "4626 N 300 W",
                                "city": "Provo",
                                "region": "UT",
                                "postalCode": "84604"},
                  "email": "shipping-contact@example.com",
                  "phone": "1-555-555-5555"},
      "shippingMethod": { "code": "shipper-123",
                          "name": "usps-2day" },
      "when": "2018-06-24T17:00:00.000Z",
      "whenExpected": "2018-08-24T17:00:00.000Z",
      "currency": { "code": "DKK",
                    "name": "Danish krone",
                    "number": 208,
                    "precision": 18,
                    "scale": 2},
      "tracking": "T-LMNOP-123",
      "itemsCount": 1,
      "items": [{ "reference": { "code": "abc-123",
                                 "type": "seller" },
                  "quantity": 24,
                  "unitCost": 24.99 }]}


### Order used to generate the receipt

    { "reference": { "referencesCount": 2,
                     "references": [ {"code": "PO-2159403-2",
                                      "type": "buyer" },
                                     {"code": "PO-abc-q",
                                      "type": "consumer" }]},
      "buyer": { "reference": { "code": "buyer-abc",
                                 "type": "seller" }},
      "consumer": { "reference": { "code": "consumer-xyz",
                                    "type": "seller" },
                     "contract": { "code": "contract-789",
                                    "type": "seller" }},
      "shipTo": { "location": { "mtn": "Jane Doe",
                                 "rcp": "ECI Solutions, STG",
                                 "alt": "Suite #200",
                                 "dal": "4626 N 300 W",
                                 "city": "Provo",
                                 "region": "UT",
                                 "postalCode": "84604"},
                   "email": "shipping-contact@example.com",
                   "phone": "1-555-555-5555"},
      "shippingMethod": { "code": "shipper-123",
                           "name": "usps-2day" },
      "when": "2018-04-24T17:00:00.000Z",
      "whenExpected": "2018-07-24T17:00:00.000Z",
      "currency": { "code": "DKK",
                    "name": "Danish krone",
                    "number": 208,
                    "precision": 18,
                    "scale": 2},
      "itemsCount": 1,
      "items": [{ "reference": { "code": "abc-123",
                                 "type": "seller" },
                  "quantity": 24,
                  "unitCost": 24.99 }]}


## Testing and Test Results

    echo $(date -u +"%Y-%m-%dT%H:%M:%SZ") started
    xmllint --noout --schema ../rsrc-schema/src/vnd.eci.stg.receipt.1.5.0.xsd ../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.?-*.xml 2>&1
    ajv -s ../rsrc-schema/src/vnd.eci.stg.receipt.1.5.0.json -d "../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.?-*.json" 2>&1
    echo $(date -u +"%Y-%m-%dT%H:%M:%SZ") stopped

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">2019-08-29T04:42:36Z</td>
<td class="org-left">started</td>
</tr>


<tr>
<td class="org-left">../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.0-one-order-many-shipments-many-receipts.json-1.xml</td>
<td class="org-left">validates</td>
</tr>


<tr>
<td class="org-left">../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.0-one-order-many-shipments-many-receipts.json-2.xml</td>
<td class="org-left">validates</td>
</tr>


<tr>
<td class="org-left">../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.0-one-order-one-shipment-one-receipt.xml</td>
<td class="org-left">validates</td>
</tr>


<tr>
<td class="org-left">../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.0-example-order.json</td>
<td class="org-left">valid</td>
</tr>


<tr>
<td class="org-left">../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.0-example-receipt.json</td>
<td class="org-left">valid</td>
</tr>


<tr>
<td class="org-left">../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.0-one-order-many-shipments-many-receipts.json-1.json</td>
<td class="org-left">valid</td>
</tr>


<tr>
<td class="org-left">../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.0-one-order-many-shipments-many-receipts.json-2.json</td>
<td class="org-left">valid</td>
</tr>


<tr>
<td class="org-left">../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.0-one-order-one-shipment-one-receipt.json</td>
<td class="org-left">valid</td>
</tr>


<tr>
<td class="org-left">../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.0-package-number.json</td>
<td class="org-left">valid</td>
</tr>


<tr>
<td class="org-left">../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.0-shipment-number.json</td>
<td class="org-left">valid</td>
</tr>


<tr>
<td class="org-left">../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.0-tracking-number.json</td>
<td class="org-left">valid</td>
</tr>


<tr>
<td class="org-left">../rsrc-schema/tst/vnd.eci.stg.receipt.1.5.0-usecase-order.json</td>
<td class="org-left">valid</td>
</tr>


<tr>
<td class="org-left">2019-08-29T04:42:37Z</td>
<td class="org-left">stopped</td>
</tr>
</tbody>
</table>


## Overview

![img](../images/receipt-sequence.puml.png)

In the following section, Use Cases, examples of data ( `--data` ) to be sent and
received will be shown. It is assumed that the caller will make the actual *POST*
call with the required headers e.g.

    curl --request POST \
         --header "Content-Type: application/vnd.eci.stg.receipt.1.5.0.xml; charset=utf-8" \
         --user user123:password123 \
         --basic \
         --url http://vendor-host/vendor-receipt-endpoint
         --data ''


## Definition of Terms


## Use Cases

All use cases in this document will be based off of the following order:

    { "reference": { "referencesCount": 2,
                     "references": [ {"code": "PO-2159403-2",
                                      "type": "buyer" },
                                     {"code": "PO-abc-q",
                                      "type": "consumer" }]},
      "buyer": { "reference": { "code": "buyer-abc",
                                 "type": "seller" }},
      "consumer": { "reference": { "code": "consumer-xyz",
                                    "type": "seller" },
                     "contract": { "code": "contract-789",
                                    "type": "seller" }},
      "shipTo": { "location": { "mtn": "Jane Doe",
                                 "rcp": "ECI Solutions, STG",
                                 "alt": "Suite #200",
                                 "dal": "4626 N 300 W",
                                 "city": "Provo",
                                 "region": "UT",
                                 "postalCode": "84604"},
                   "email": "shipping-contact@example.com",
                   "phone": "1-555-555-5555"},
      "shippingMethod": { "code": "shipper-123",
                           "name": "usps-2day" },
      "when": "2018-04-24T17:00:00.000Z",
      "whenExpected": "2018-07-24T17:00:00.000Z",
      "currency": { "code": "DKK",
                    "name": "Danish krone",
                    "number": 208,
                    "precision": 18,
                    "scale": 2},
      "itemsCount": 3,
      "items": [{ "reference": { "code": "abc-123",
                                 "type": "seller" },
                  "quantity": 24,
                  "unitCost": 24.99 },
                { "reference": { "code": "def-456",
                                 "type": "seller" },
                  "quantity": 2,
                  "unitCost": 2.99 },
                { "reference": { "code": "ghi-789",
                                 "type": "seller" },
                  "quantity": 1,
                  "unitCost": 1.99 }]}


### As a seller I would like to provide a tracking number to buyer

1.  JSON

        { "reference": { "referencesCount": 2,
                         "references": [ { "code": "PO-ABC123-2",
                                           "type": "buyer" },
                                         { "code": "PO-XYZ-a",
                                           "type": "consumer" }]},
          "tracking": "T-123-ABC",
          "itemsCount": 3,
          "items": [{ "reference": { "code": "abc-123",
                                     "type": "seller" },
                      "quantity": 24,
                      "unitCost": 24.99 },
                    { "reference": { "code": "def-456",
                                     "type": "seller" },
                      "quantity": 2,
                      "unitCost": 2.99 },
                    { "reference": { "code": "ghi-789",
                                     "type": "seller" },
                      "quantity": 1,
                      "unitCost": 1.99 }]}


### As a seller I would like to provide a shipment number to buyer

1.  JSON

        { "reference": { "referencesCount": 2,
                         "references": [ { "code": "PO-ABC123-2",
                                           "type": "buyer" },
                                         { "code": "PO-XYZ-a",
                                           "type": "consumer" }]},
          "shipment": "T-123-ABC",
          "itemsCount": 3,
          "items": [{ "reference": { "code": "abc-123",
                                     "type": "seller" },
                      "quantity": 24,
                      "unitCost": 24.99 },
                    { "reference": { "code": "def-456",
                                     "type": "seller" },
                      "quantity": 2,
                      "unitCost": 2.99 },
                    { "reference": { "code": "ghi-789",
                                     "type": "seller" },
                      "quantity": 1,
                      "unitCost": 1.99 }]}


### As a seller I would like to provide a package number to the buyer

1.  JSON

        { "reference": { "referencesCount": 2,
                         "references": [ { "code": "PO-ABC123-2",
                                           "type": "buyer" },
                                         { "code": "PO-XYZ-a",
                                           "type": "consumer" }]},
          "package": "1 of 1",
          "itemsCount": 3,
          "items": [{ "reference": { "code": "abc-123",
                                     "type": "seller" },
                      "quantity": 24,
                      "unitCost": 24.99 },
                    { "reference": { "code": "def-456",
                                     "type": "seller" },
                      "quantity": 2,
                      "unitCost": 2.99 },
                    { "reference": { "code": "ghi-789",
                                     "type": "seller" },
                      "quantity": 1,
                      "unitCost": 1.99 }]}


### As a seller I would like to provide one receipt (T-123-ABC) for one order (PO-ABC123-2)

1.  JSON

        { "reference": { "referencesCount": 2,
                         "references": [ { "code": "PO-ABC123-2",
                                           "type": "buyer" },
                                         { "code": "PO-XYZ-a",
                                           "type": "consumer" }]},
          "shipment": "S-QRS-987",
          "itemsCount": 3,
          "items": [{ "reference": { "code": "abc-123",
                                     "type": "seller" },
                      "quantity": 24,
                      "unitCost": 24.99 },
                    { "reference": { "code": "def-456",
                                     "type": "seller" },
                      "quantity": 2,
                      "unitCost": 2.99 },
                    { "reference": { "code": "ghi-789",
                                     "type": "seller" },
                      "quantity": 1,
                      "unitCost": 1.99 }]}

2.  XML

        <receipt>
          <reference>
            <referencesCount>2</referencesCount>
            <references>
              <reference>
                <code>PO-2159403-2</code>
                <type>buyer</type>
              </reference>
              <reference>
                <code>PO-abc-q</code>
                <type>consumer</type>
              </reference>
            </references>
          </reference>
          <shipTo>
            <location>
              <mtn>Jane Doe</mtn>
              <rcp>ECI Solutions, STG</rcp>
              <alt>Suite #200</alt>
              <dal>4626 N 300 W"</dal>
              <city>Provo</city>
              <region>UT</region>
              <postalCode>84604</postalCode>
            </location>
            <email>shipping-contact@example.com></email>
            <phone>1-555-555-5555</phone>
          </shipTo>
          <tracking>T-123-ABC</tracking>
          <itemsCount>3</itemsCount>
          <items>
            <item>
              <reference>
                <code>abc-123</code>
                <type>seller</type>
              </reference>
              <quantity>24</quantity>
              <unitCost>24.99</unitCost>
            </item>
            <item>
              <reference>
                <code>def-456</code>
                <type>seller</type>
              </reference>
              <quantity>2</quantity>
              <unitCost>2.99</unitCost>
            </item>
            <item>
              <reference>
                <code>ghi-789</code>
                <type>seller</type>
              </reference>
              <quantity>1</quantity>
              <unitCost>1.99</unitCost>
            </item>
          </items>
        </receipt>


### As a seller I would like to provide many receipts (T-123-ABC, T-456-DEF) for one order (PO-ABC123-2)

1.  JSON

    POST first tracking number (T-123-ABC)

        { "reference": { "referencesCount": 2,
                         "references": [{ "code": "PO-ABC123-2",
                                          "type": "buyer" },
                                        { "code": "PO-XYZ-a",
                                          "type": "consumer" }]},
          "tracking": "T-123-ABC",
          "itemsCount": 2,
          "items": [{ "reference": { "code": "abc-123",
                                     "type": "seller"},
                      "quantity": 24,
                      "unitCost": 24.99 },
                    { "reference": { "code": "def-456",
                                     "type": "seller" },
                      "quantity": 2,
                      "unitCost": 2.99 },
                    { "reference": { "code": "ghi-789",
                                     "type": "seller" }}]}

    POST second tracking number (T-456-DEF)

        { "reference": { "referencesCount": 2,
                         "references": [ { "code": "PO-ABC123-2",
                                           "type": "buyer" },
                                         { "code": "PO-XYZ-a",
                                           "type": "consumer" }]},
          "tracking": "T-456-DEF",
          "itemsCount": 1,
          "items": [
            { "reference": { "code": "ghi-789",
                             "type": "seller" },
              "quantity": 1,
              "unitCost": 1.99 }]}

2.  XML

    POST first tracking number (T-123-ABC)

        <receipt>
          <reference>
            <referencesCount>2</referencesCount>
            <references>
              <reference>
                <code>PO-2159403-2</code>
                <type>buyer</type>
              </reference>
              <reference>
                <code>PO-abc-q</code>
                <type>consumer</type>
              </reference>
            </references>
          </reference>
          <shipTo>
            <location>
              <mtn>Jane Doe</mtn>
              <rcp>ECI Solutions, STG</rcp>
              <alt>Suite #200</alt>
              <dal>4626 N 300 W"</dal>
              <city>Provo</city>
              <region>UT</region>
              <postalCode>84604</postalCode>
            </location>
            <email>shipping-contact@example.com></email>
            <phone>1-555-555-5555</phone>
          </shipTo>
          <tracking>T-123-ABC</tracking>
          <itemsCount>2</itemsCount>
          <items>
            <item>
              <reference>
                <code>abc-123</code>
                <type>seller</type>
              </reference>
              <quantity>24</quantity>
              <unitCost>24.99</unitCost>
            </item>
            <item>
              <reference>
                <code>def-456</code>
                <type>seller</type>
              </reference>
              <quantity>2</quantity>
              <unitCost>2.99</unitCost>
            </item>
          </items>
        </receipt>

    POST second tracking number (T-456-DEF)

        <receipt>
          <reference>
            <referencesCount>2</referencesCount>
            <references>
              <reference>
                <code>PO-2159403-2</code>
                <type>buyer</type>
              </reference>
              <reference>
                <code>PO-abc-q</code>
                <type>consumer</type>
              </reference>
            </references>
          </reference>
          <shipTo>
            <location>
              <mtn>Jane Doe</mtn>
              <rcp>ECI Solutions, STG</rcp>
              <alt>Suite #200</alt>
              <dal>4626 N 300 W"</dal>
              <city>Provo</city>
              <region>UT</region>
              <postalCode>84604</postalCode>
            </location>
            <email>shipping-contact@example.com></email>
            <phone>1-555-555-5555</phone>
          </shipTo>
          <tracking>T-456-DEF</tracking>
          <itemsCount>1</itemsCount>
          <items>
            <item>
              <reference>
                <code>ghi-789</code>
                <type>seller</type>
              </reference>
              <quantity>1</quantity>
              <unitCost>1.99</unitCost>
            </item>
          </items>
        </receipt>


## Resource Schemas


### Version 1.0

No longer published


### Version 1.5

1.  JSON

        {
          "id": "./vnd.eci.stg.receipt.1.5.0.json",
          "$schema": "http://json-schema.org/draft-07/schema#",
          "title": "receipt",
          "description": "",
          "type": "object",
          "additionalProperties": false,
          "properties": {

            "reference": { "$ref": "#/definitions/reference" },

            "code": {
              "description": "",
              "type": "string",
              "minLength": 1,
              "maxLength": 32
            },

            "name": {
              "description": "",
              "type": "string",
              "minLength": 1,
              "maxLength": 32
            },

            "description": {
              "description": "",
              "type": "string",
              "minLength": 1,
              "maxLength": 128
            },

            "remarks": {
              "description": "",
              "type": "string",
              "minLength": 1,
              "maxLength": 256
            },

            "when": {
              "description": "",
              "type": "string",
              "format": "date-time"
            },

            "whenExpected": {
              "description": "",
              "type": "string",
              "format": "date-time"
            },

            "billTo": { "$ref": "#/definitions/billTo" },

            "buyer": { "$ref": "#/definitions/buyer" },

            "consumer": { "$ref": "#/definitions/consumer" },

            "seller": { "$ref": "#/definitions/seller" },

            "shipTo": { "$ref": "#/definitions/shipTo" },

            "shippingMethod": { "$ref": "#/definitions/shippingMethod" },

            "location": { "$ref": "#/definitions/address" },

            "make": {
              "description": "",
              "type": "string",
              "minLength": 1,
              "maxLength": 32
            },

            "model": {
              "description": "",
              "type": "string",
              "minLength": 1,
              "maxLength": 32
            },

            "serialNumber": {
              "description": "",
              "type": "string",
              "minLength": 1,
              "maxLength": 32
            },

            "quantity": {
              "description": "",
              "type": "number",
              "minimum": 0,
              "maximum": 999999999.999999
            },

            "unitMeasure": { "$ref": "#/definitions/unitMeasure" },

            "unitCost": {
              "description": "",
              "type": "number",
              "minimum": 0,
              "maximum": 999999999999.999999
            },

            "total": { "$ref": "#/definitions/total"},

            "currency": { "$ref": "#/definitions/currency"},

            "package": {
              "description": "",
              "type": "string",
              "minLength": 1,
              "maxLength": 32
            },

            "shipment": {
              "description": "",
              "type": "string",
              "minLength": 1,
              "maxLength": 32
            },

            "tracking": {
              "description": "",
              "type": "string",
              "minLength": 1,
              "maxLength": 32
            },

            "itemsCount": {
              "description": "number of things in the items collection",
              "type": "number",
              "minimum": 1,
              "maximum": 1000
            },

            "items": {
              "description": "",
              "type": "array",
              "minItems": 1,
              "maxItems": 1000,
              "uniqueItems": true,
              "items": {
                "$ref": "#"
              }
            }
          },

          "definitions": {

            "address": {
              "type": "object",
              "additionalProperties": false,
              "properties": {

                "reference": { "$ref": "#/definitions/reference" },

                "code": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "name": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "description": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 128
                },

                "remarks": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "msc": {
                  "description": "mail stop code",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 40
                },

                "mtn": {
                  "description": "attention line",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 40
                },

                "rcp": {
                  "description": "recipient or business name",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 40
                },

                "alt": {
                  "description": "alternate location",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 40
                },

                "dal": {
                  "description": "delivery address line",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 40
                },

                "city": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 40
                },

                "region": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 40
                },

                "postalCode": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 40
                },

                "country": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 40
                }
              }
            },

            "billTo": {
              "type": "object",
              "additionalProperties": false,
              "properties": {

                "reference": { "$ref": "#/definitions/reference" },

                "code": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "name": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "description": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 128
                },

                "remarks": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "location": { "$ref": "#/definitions/address" },

                "email": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "phone": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "taxID": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "contact": { "$ref": "#/definitions/contact" }
              }
            },

            "buyer": {
              "type": "object",
              "additionalProperties": false,
              "properties": {

                "reference": { "$ref": "#/definitions/reference" },

                "code": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "name": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "description": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 128
                },

                "remarks": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "location": { "$ref": "#/definitions/address" },

                "email": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "phone": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "taxID": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "contact": { "$ref": "#/definitions/contact" }
              }
            },

            "consumer": {
              "type": "object",
              "additionalProperties": false,
              "properties": {

                "reference": { "$ref": "#/definitions/reference" },

                "code": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "name": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "description": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 128
                },

                "remarks": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "location": { "$ref": "#/definitions/address" },

                "email": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "phone": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "taxID": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "contact": { "$ref": "#/definitions/contact" },

                "contract": { "$ref": "#/definitions/reference" }
              }
            },

            "contact": {
              "type": "object",
              "additionalProperties": false,
              "properties": {

                "reference": { "$ref": "#/definitions/reference" },

                "code": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "name": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "description": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 128
                },

                "remarks": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "location": { "$ref": "#/definitions/address" },

                "email": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "phone": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                }
              }
            },

            "currency": {
              "type": "object",
              "additionalProperties": false,
              "properties": {

                "code": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "name": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "description": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 128
                },

                "remarks": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "number": {
                  "description": "",
                  "type": "number",
                  "minimum": 1,
                  "maximum": 999
                },

                "precision": {
                  "description": "",
                  "type": "number",
                  "minimum": 0,
                  "maximum": 18
                },

                "scale": {
                  "description": "",
                  "type": "number",
                  "minimum": 1,
                  "maximum": 6
                }
              }
            },

            "reference": {
              "type": "object",
              "additionalProperties": false,
              "properties": {

                "code": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "name": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "description": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 128
                },

                "remarks": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "type": { "$ref": "#/definitions/reference/definitions/referenceTypeEnum" },

                "referencesCount": {
                  "description": "number of things in the references collection",
                  "type": "number",
                  "minimum": 1,
                  "maximum": 1000
                },

                "references": {
                  "description": "",
                  "type": "array",
                  "minItems": 1,
                  "maxItems": 1000,
                  "uniqueItems": true,
                  "items": {
                    "$ref": "#/definitions/reference"
                  }
                }
              },

              "definitions": {
                "referenceTypeEnum": {
                  "type": "string",
                  "enum": ["buyer", "consumer", "manufacturer", "seller" ]
                }
              }
            },

            "seller": {
              "type": "object",
              "additionalProperties": false,
              "properties": {

                "reference": { "$ref": "#/definitions/reference" },

                "code": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "name": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "description": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 128
                },

                "remarks": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "location": { "$ref": "#/definitions/address" },

                "email": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "phone": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "taxID": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "contact": { "$ref": "#/definitions/contact" }
              }
            },

            "shippingMethod": {
              "type": "object",
              "additionalProperties": false,
              "properties": {

                "code": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "name": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "description": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 128
                },

                "remarks": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "billTo": { "$ref": "#/definitions/billTo" },

                "itemsCount": {
                  "description": "number of shipping methods in the collection",
                  "type": "number",
                  "minimum": 1,
                  "maximum": 1000
                },

                "items": {
                  "description": "",
                  "type": "array",
                  "minItems": 1,
                  "maxItems": 1000,
                  "uniqueItems": true,
                  "items": {
                    "$ref": "#/definitions/shippingMethod"
                  }
                }
              }
            },

            "shipTo": {
              "type": "object",
              "additionalProperties": false,
              "properties": {

                "reference": { "$ref": "#/definitions/reference" },

                "code": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "name": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "description": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 128
                },

                "remarks": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "location": { "$ref": "#/definitions/address" },

                "email": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "phone": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "contact": { "$ref": "#/definitions/contact" },

                "isDropShip": {
                  "description": "",
                  "type": "boolean"
                }
              }
            },

            "tax": {
              "type": "object",
              "properties": {

                "code": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "name": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "description": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 128
                },

                "remarks": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "amount": {
                  "description": "",
                  "type": "number",
                  "minimum": 0,
                  "maximum": 999999999999.999999
                },

                "authority": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "itemsCount": {
                  "description": "number of things in the items collection",
                  "type": "number",
                  "minimum": 1,
                  "maximum": 1000
                },

                "items": {
                  "description": "",
                  "type": "array",
                  "minItems": 1,
                  "maxItems": 1000,
                  "uniqueItems": true,
                  "items": {
                    "$ref": "#/definitions/tax"
                  }
                }
              },

              "additionalProperties": false
            },

            "total": {
              "type": "object",
              "additionalProperties": false,
              "properties": {

                "amount": {
                  "description": "",
                  "type": "number",
                  "minimum": 0,
                  "maximum": 999999999999.999999
                },

                "discountAmount": {
                  "description": "",
                  "type": "number",
                  "minimum": 0,
                  "maximum": 999999999999.999999
                },

                "freightAmount": {
                  "description": "",
                  "type": "number",
                  "minimum": 0,
                  "maximum": 999999999999.999999
                },

                "termsAmount": {
                  "description": "",
                  "type": "number",
                  "minimum": 0,
                  "maximum": 999999999999.999999
                },

                "tax": { "$ref": "#/definitions/tax" },

                "remarks": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                }
              }
            },

            "unitMeasure": {
              "type": "object",
              "additionalProperties": false,
              "properties": {
                "code": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "name": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 32
                },

                "description": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 128
                },

                "remarks": {
                  "description": "",
                  "type": "string",
                  "minLength": 1,
                  "maxLength": 256
                },

                "quantity": {
                  "description": "",
                  "type": "number",
                  "minimum": 0,
                  "maximum": 999999999.999999
                }
              }
            }
          }
        }

2.  XML

        <?xml version='1.0' encoding='utf-8'?>

        <xs:schema xmlns:xs='http://www.w3.org/2001/XMLSchema'
                   elementFormDefault='qualified'
                   xml:lang='en'>

          <xs:element name='receipt' type='ItemType'/>

          <xs:complexType name='AddressType'>
            <xs:sequence>
              <xs:element name='reference'   type='ReferenceType' minOccurs='0' maxOccurs='1' />
              <xs:element name='name'        type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='description' type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='remarks'     type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='msc'         type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='mtn'         type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='rcp'         type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='alt'         type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='dal'         type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='city'        type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='region'      type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='postalCode'  type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='country'     type='xs:string'     minOccurs='0' maxOccurs='1' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='BillToType'>
            <xs:sequence>
              <xs:element name='reference'   type='ReferenceType' minOccurs='0' maxOccurs='1' />
              <xs:element name='name'        type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='description' type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='remarks'     type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='location'    type='AddressType'   minOccurs='0' maxOccurs='1' />
              <xs:element name='email'       type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='phone'       type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='taxID'       type='xs:string'     minOccurs='0' maxOccurs='1' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='BuyerType'>
            <xs:sequence>
              <xs:element name='reference'   type='ReferenceType' minOccurs='0' maxOccurs='1' />
              <xs:element name='name'        type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='description' type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='remarks'     type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='location'    type='AddressType'   minOccurs='0' maxOccurs='1' />
              <xs:element name='email'       type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='phone'       type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='taxID'       type='xs:string'     minOccurs='0' maxOccurs='1' />
            </xs:sequence>
          </xs:complexType>
          <xs:complexType name='ConsumerType'>
            <xs:sequence>
              <xs:element name='reference'   type='ReferenceType' minOccurs='0' maxOccurs='1' />
              <xs:element name='name'        type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='description' type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='remarks'     type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='location'    type='AddressType'   minOccurs='0' maxOccurs='1' />
              <xs:element name='contract'    type='ReferenceType' minOccurs='0' maxOccurs='1' />
              <xs:element name='email'       type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='phone'       type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='taxID'       type='xs:string'     minOccurs='0' maxOccurs='1' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='CurrencyType'>
            <xs:sequence>
              <xs:element name='code'      type='xs:string'  />
              <xs:element name='name'      type='xs:string'  />
              <xs:element name='number'    type='xs:integer' />
              <xs:element name='precision' type='xs:integer' />
              <xs:element name='scale'     type='xs:integer' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='ItemType'>
            <xs:sequence>
              <xs:element name='reference'       type='ReferenceType'      minOccurs='0' maxOccurs='1' />
              <xs:element name='name'            type='xs:string'          minOccurs='0' maxOccurs='1' />
              <xs:element name='description'     type='xs:string'          minOccurs='0' maxOccurs='1' />
              <xs:element name='remarks'         type='xs:string'          minOccurs='0' maxOccurs='1' />
              <xs:element name='location'        type='AddressType'        minOccurs='0' maxOccurs='1' />
              <xs:element name='buyer'           type='BuyerType'          minOccurs='0' maxOccurs='1' />
              <xs:element name='consumer'        type='ConsumerType'       minOccurs='0' maxOccurs='1' />
              <xs:element name='seller'          type='SellerType'         minOccurs='0' maxOccurs='1' />
              <xs:element name='shipTo'          type='ShipToType'         minOccurs='0' maxOccurs='1' />
              <xs:element name='billTo'          type='BillToType'         minOccurs='0' maxOccurs='1' />
              <xs:element name='shippingMethod'  type='ShippingMethodType' minOccurs='0' maxOccurs='1' />
              <xs:element name='when'            type='xs:dateTime'        minOccurs='0' maxOccurs='1' />
              <xs:element name='whenExpected'    type='xs:dateTime'        minOccurs='0' maxOccurs='1' />
              <xs:element name='lineNumber'      type='xs:integer'         minOccurs='0' maxOccurs='1' />
              <xs:element name='make'            type='xs:string'          minOccurs='0' maxOccurs='1' />
              <xs:element name='model'           type='xs:string'          minOccurs='0' maxOccurs='1' />
              <xs:element name='serialNumber'    type='xs:string'          minOccurs='0' maxOccurs='1' />
              <xs:element name='quantity'        type='xs:float'           minOccurs='0' maxOccurs='1' />
              <xs:element name='unitCost'        type='MoneyType'          minOccurs='0' maxOccurs='1' />
              <xs:element name='unitMeasure'     type='UnitMeasureType'    minOccurs='0' maxOccurs='1' />
              <xs:element name='total'           type='TotalType'          minOccurs='0' maxOccurs='1' />
              <xs:element name='currency'        type='CurrencyType'       minOccurs='0' maxOccurs='1' />
              <xs:element name='order'           type='ReferenceType'      minOccurs='0' maxOccurs='1' />
              <xs:element name='package'         type='xs:string'          minOccurs='0' maxOccurs='1' />
              <xs:element name='shipment'        type='xs:string'          minOccurs='0' maxOccurs='1' />
              <xs:element name='tracking'        type='xs:string'          minOccurs='0' maxOccurs='1' />
              <xs:element name='itemsCount'      type='xs:integer'         minOccurs='0' maxOccurs='1' />
              <xs:element name='items'           type='ItemsType'          minOccurs='0' maxOccurs='1' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='ItemsType'>
            <xs:sequence minOccurs='1' maxOccurs='5000'>
              <xs:element name='item' type='ItemType'/>
            </xs:sequence>
          </xs:complexType>

          <xs:simpleType name='MoneyType'>
            <xs:annotation>
              <xs:documentation>
                Every Product must have a unit cost that is equal to or greater than
                0 and must cost just under one trillion monetary units. Version 1.5.0
                assumes the monetary unit is US Dollars.
              </xs:documentation>
            </xs:annotation>
            <xs:restriction base='xs:decimal'>
              <xs:minInclusive value='0'/>
              <xs:maxInclusive value='999999999999.999999'/>
              <xs:fractionDigits value='6'/>
              <xs:totalDigits value='18'/>
            </xs:restriction>
          </xs:simpleType>

          <xs:complexType name='ReferenceType'>
            <xs:sequence>
              <xs:element name='code'        type='xs:string' minOccurs='0' maxOccurs='1' />
              <xs:element name='name'        type='xs:string' minOccurs='0' maxOccurs='1' />
              <xs:element name='description' type='xs:string' minOccurs='0' maxOccurs='1' />
              <xs:element name='remarks'     type='xs:string' minOccurs='0' maxOccurs='1' />
              <xs:element name='type'        type='ReferenceTypeEnum' minOccurs='0' maxOccurs='1' />

              <xs:element name='referencesCount' type='xs:integer'     minOccurs='0' maxOccurs='1' />
              <xs:element name='references'      type='ReferencesType' minOccurs='0' maxOccurs='1' />
            </xs:sequence>
          </xs:complexType>

          <xs:simpleType name='ReferenceTypeEnum'>
            <xs:restriction base='xs:string'>
              <xs:enumeration value='buyer'/>
              <xs:enumeration value='consumer'/>
              <xs:enumeration value='manufacturer'/>
              <xs:enumeration value='seller'/>
            </xs:restriction>
          </xs:simpleType>

          <xs:complexType name='ReferencesType'>
            <xs:sequence minOccurs='0' maxOccurs='1000'>
              <xs:element name='reference' type='ReferenceType'/>
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='SellerType'>
            <xs:sequence>
              <xs:element name='reference'   type='ReferenceType' minOccurs='0' maxOccurs='1' />
              <xs:element name='name'        type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='description' type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='remarks'     type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='location'    type='AddressType'   minOccurs='0' maxOccurs='1' />
              <xs:element name='email'       type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='phone'       type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='taxID'       type='xs:string'     minOccurs='0' maxOccurs='1' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='ShippingMethodType'>
            <xs:sequence>
              <xs:element name='code'        type='xs:string' minOccurs='0' maxOccurs='1' />
              <xs:element name='name'        type='xs:string' minOccurs='0' maxOccurs='1' />
              <xs:element name='description' type='xs:string' minOccurs='0' maxOccurs='1' />
              <xs:element name='remarks'     type='xs:string' minOccurs='0' maxOccurs='1' />

              <xs:element name='itemsCount' type='xs:integer'          minOccurs='0' maxOccurs='1' />
              <xs:element name='items'      type='ShippingMethodsType' minOccurs='0' maxOccurs='1' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='ShippingMethodsType'>
            <xs:sequence minOccurs='0' maxOccurs='1000'>
              <xs:element name='shippingMethod' type='ReferenceType'/>
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='ShipToType'>
            <xs:sequence>
              <xs:element name='reference'   type='ReferenceType' minOccurs='0' maxOccurs='1' />
              <xs:element name='name'        type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='description' type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='remarks'     type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='location'    type='AddressType'   minOccurs='0' maxOccurs='1' />
              <xs:element name='email'       type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='phone'       type='xs:string'     minOccurs='0' maxOccurs='1' />
              <xs:element name='isDropShip'  type='xs:boolean'    minOccurs='0' maxOccurs='1' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='TaxType'>
            <xs:sequence>
              <xs:element name='code'            type='xs:string'  minOccurs='0' maxOccurs='1' />
              <xs:element name='name'            type='xs:string'  minOccurs='0' maxOccurs='1' />
              <xs:element name='description'     type='xs:string'  minOccurs='0' maxOccurs='1' />
              <xs:element name='remarks'         type='xs:string'  minOccurs='0' maxOccurs='1' />
              <xs:element name='amount'          type='MoneyType'  minOccurs='0' maxOccurs='1' />
              <xs:element name='authority'       type='xs:string'  minOccurs='0' maxOccurs='1' />
              <xs:element name='itemsCount'      type='xs:integer' minOccurs='0' maxOccurs='1' />
              <xs:element name='items'           type='ItemsType'  minOccurs='0' maxOccurs='1' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='TotalType'>
            <xs:sequence>
              <xs:element name='amount'         type='MoneyType' minOccurs='0' maxOccurs='1' />
              <xs:element name='discountAmount' type='MoneyType' minOccurs='0' maxOccurs='1' />
              <xs:element name='freightAmount'  type='MoneyType' minOccurs='0' maxOccurs='1' />
              <xs:element name='termsAmount'    type='MoneyType' minOccurs='0' maxOccurs='1' />
              <xs:element name='tax'            type='TaxType'   minOccurs='0' maxOccurs='1' />
              <xs:element name='remarks'        type='xs:string' minOccurs='0' maxOccurs='1' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='UnitMeasureType'>
            <xs:sequence>
              <xs:element name='name'        type='xs:string'  />
              <xs:element name='description' type='xs:string'  />
              <xs:element name='remarks'     type='xs:string'  />
              <xs:element name='code'        type='xs:string'  />
              <xs:element name='quantity'    type='xs:decimal' />
            </xs:sequence>
          </xs:complexType>

        </xs:schema>


## © 2018-2019 ECI Software Solutions, Inc. All rights reserved.
