
# Table of Contents

1.  [The Order Placement System](#org4e6d9d4)
2.  [Overview](#org75038dd)
    1.  [Provide a non-technical overview of the business cases.](#org8b160d2)
    2.  [Actors](#orgb8fb040)
    3.  [Endpoints](#org5281064)
    4.  [Connecting](#org4589492)
        1.  [HTTPS / TLS](#orgbc50119)
        2.  [Authentication](#orgd6c55b4)
    5.  [Resource Types](#orge16fb9e)
3.  [Testing Schema files](#org2fb875a)
    1.  [JSON](#org94f7700)
    2.  [XML](#org189119a)
4.  [Probes](#org8d77b64)
    1.  [`./probes/top`](#org2f28baa)
    2.  [`./probes/bottom`](#org92d0cea)
        1.  [JSON](#org5cb6a2f)
        2.  [XML](#orgd93389b)
    3.  [`./probes`](#orgbd8e37e)
        1.  [JSON](#orgcd73562)
        2.  [XML](#orgd7164e8)
    4.  [Resource Schema](#orgeaffdb3)
        1.  [JSON](#org3637ecf)
        2.  [XML](#orgec4dc78)
    5.  [Test Results](#orgfefa798)
5.  [Stock](#org7cdd392)
    1.  [Provide a non-technical overview of the business cases.](#orgdb5d8ca)
    2.  [Sequence of Events](#org709b2e4)
    3.  [Versions](#orgdc4a23c)
        1.  [Version 1.0](#org86c754f)
        2.  [Version 2.0](#org26039b6)
    4.  [Use Cases](#org591c21b)
        1.  [As an unidentified buyer I would like to see the cost for one or more products](#org8c613fc)
        2.  [As an unidentified buyer I would like to know if the seller has enough stock to satisfy my order](#org8eb3a9d)
        3.  [As an unidentified buyer I would like to be able to specify a date when the order must be received.](#orgff8f986)
        4.  [As a seller I would like to be able to provide a replacement item when the seller specifies an outdated item number](#org28158f6)
        5.  [As a seller I would like to be able to provide a substitue when the item specified by the buyer is not in stock](#orgacae0b9)
    5.  [Resource Schemas](#orgbd73b3a)
        1.  [Version 1.0](#org0b33998)
        2.  [Version 2.0](#orgf682399)
    6.  [Testing](#org94b3651)
6.  [Invoice](#org7312dbe)
    1.  [Provide a non-technical overview of the business cases](#org486c374)
    2.  [Sequence of Events](#org6a8dc32)
    3.  [Versions](#org6a0957f)
        1.  [Version 1.0](#org714cd81)
        2.  [Version 2.0](#org6aca27f)
    4.  [Use Cases](#orga349767)
        1.  [](#orge150bd0)
    5.  [Resource Schemas](#orgbeec026)
        1.  [Version 1.0](#orgb1fd51f)
        2.  [Version 2.0](#org395b56c)
    6.  [Testing](#orgafd6adb)
7.  [Order](#orgc77823c)
    1.  [Provide a non-technical overview of the business cases](#orgeb1a2bc)
    2.  [Sequence of Events](#orgc1dd417)
    3.  [Versions](#org2d240b0)
        1.  [Version 1.0](#org6c21c5d)
        2.  [Version 2.0](#orgca90240)
    4.  [Use Cases](#org699d538)
        1.  [](#orgf63cde5)
    5.  [Resource Schemas](#org8363a68)
        1.  [Version 1.0](#org46f4ff3)
        2.  [Version 2.0](#org71ca8f7)
    6.  [Testing](#orgd40e67d)
8.  [Ship Method](#org60cfc42)
    1.  [Provide a non-technical overview of the business cases](#org06b85ec)
    2.  [Sequence of Events](#orgfaf4f63)
    3.  [Versions](#org3fa7151)
        1.  [Version 1.0](#org5ea08ba)
        2.  [Version 2.0](#org6cf73ff)
    4.  [Use Cases](#org73a07a5)
        1.  [](#org7027ef1)
    5.  [Resource Schemas](#org586470e)
        1.  [Version 1.0](#org995fa86)
        2.  [Version 2.0](#orgdadb2a0)
    6.  [Testing](#org1b0d402)
9.  [About this document](#org3210f19)
    1.  [Tangle](#orgecf588f)
    2.  [Export](#orgaa4944c)
10. [Resource Schemas](#orgbd0f007)
    1.  [](#org96e4097)
11. [Test Results](#orgff7eda8)



<a id="org4e6d9d4"></a>

# The Order Placement System

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa
qui officia deserunt mollit anim id est laborum.


<a id="org75038dd"></a>

# Overview



<a id="org8b160d2"></a>

## TODO Provide a non-technical overview of the business cases.

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
officia deserunt mollit anim id est laborum.


<a id="orgb8fb040"></a>

## Actors

Within the ECi Order Placement system a dealer typically takes on the role of
*Buyer*. A vendor or supplier (typical readers of this document) take the role of
*Seller*. A *Consumer* is the dealer's customer, though there are nuances we will
not attempt to explain right now.

![img](./images/buyer-usecases.puml.png)

![img](./images/seller-usecases.puml.png)

![img](./images/consumer-usecases.puml.png)


<a id="org5281064"></a>

## Endpoints

There are six endpoints, three provided by the Seller's system

![img](./images/sequence-buyer2seller.puml.png)

And three provided by the Buyer's system:

![img](./images/sequence-seller2buyer.puml.png)


<a id="org4589492"></a>

## Connecting


<a id="orgbc50119"></a>

### HTTPS / TLS

The ECi Order Placement services will always connect using a minimum of TLS 1.2.


<a id="orgd6c55b4"></a>

### Authentication

1.  Buyer -> Seller

    The Seller is responsible for providing participating dealers (Buyers) a user name
    and password which the ECi system will use to connect to the Seller's system. This
    information will be passed to the seller via HTTP Basic Authentication [RFC 7617](http://www.rfc-editor.org/info/rfc7617).
    Stock and Order resources allow for additional non-schema defined information
    (opaque) to be supplied by the Buyer and delivered to the Seller.

2.  Seller -> Buyer

    ECi is responsible for assigning and maintaining an ID and an API key to each of
    the Seller systems. This information will be passed to the buyer system via HTTP
    Basic Authentication. Stock and Order resources allow for additional non-schema
    defined information (opaque) to be supplied by the Seller and delivered to the Buyer.


<a id="orge16fb9e"></a>

## Resource Types

There are six resource types exchanged between the Buyer's system and the Seller's system:

![img](./images/resource-types.dot.png)

Not all Seller systems support resources or endpoints for Shipment Methods, Order&Delta;
(accept/reject), or Shipment information. We have chosen to represent resources using
JSON Schema and prefer Seller implementations also choose a JSON representation. The
Buyer's system can be programmed to send and receive resources in other representations,
though this is not part of the standard agreement and will need to be addressed separately.


<a id="org2fb875a"></a>

# Testing Schema files


<a id="org94f7700"></a>

## JSON


    #!/bin/bash
    #
    # brew install jsonlint
    # npm install jsonlint -g
    #

    #
    # make sure all of the files are well-formed JSON
    find ./rsrc-schema/tst ./rsrc-schema/src -type f -name '*.json' -exec jsonlint --quiet --compact {} \;


<a id="org189119a"></a>

## XML


    #!/bin/bash
    #
    # brew install xmllint

    # make sure all of the files are well-formed xml
    find ./rsrc-schema/src -type f -name '*.xsd' -exec xmllint --noout {} \;
    find ./rsrc-schema/tst -type f -name '*.xml' -exec xmllint --noout {} \;


<a id="org8d77b64"></a>

# Probes

Each API or Application MUST support two HTTP GET operations that will allow QA/IT/Support and
internal ( private network ) applications the ability to pro-actively monitor the health
of APIs and applications. It is expected that IT will be routinely calling the required probes with
network and application health monitoring system many times throughout the day. These probes should
also be made available to Customer Care ( Support ) where then can be executed on demand. The custom
probes will be executed on demand by IT, QA, and Support staff. They are not expected to be used by
frequent running software as they may cause strain on the system and have a negative impact on
system users and systems.

It is important that information returned from these probes is not cached. We recommend setting the
following HTTP headers:

    Cache-Control: no-cache, no-store, must-revalidate
    Pragma: no-cache
    Expires: 0


<a id="org2f28baa"></a>

## `./probes/top`

Version 1.0 *required*

This probe MUST be a light weight indicator of API or application availability. QA/IT/Support and
internal ( private network ) applications MUST be able to GET this low impact fast running probe.
It is expected that this probe will be called one or more times per minute. Calling applications are
required to check the HTTP status code as a pass ( *200* ) or fail ( *500* ) indicator. A body
MUST not be returned to the caller.

    curl -sw "%{http_code}\\n" http://localhost:3000/apis/v0/order/probes/top


<a id="org92d0cea"></a>

## `./probes/bottom`

Version 1.0 *required*

This probe should test all of the layers of the API or application and all vital connections to
required systems, APIs, databases, etc. QA/IT/Support staff and internal facing applications MUST be
able to GET this modest impact probe. It is expected that this probe will be called several times
per hour. Calling applications are required to check the HTTP status code as a pass ( *200* ) or
fail ( *500* ) indicator. A body is optional. If a body is provided by the endpoint it must contain
an array of one or more probe resources, each of which will contain its own HTTP Status Code.


<a id="org5cb6a2f"></a>

### JSON

    [
      {
        "self": "https://some.server/some.service/probes/bottom#auth",
        "code" :"auth",
        "httpStatusCode": 200,
        "when": "2018-04-23T18:25:43.511Z"
      },
      {
        "self": "https://some.server/some.service/probes/bottom",
        "description": "database connection test",
        "httpStatusCode": 400,
        "value":"The database cannot be contacted. Ensure the database is running and network reachable.",
        "when": "2018-04-23T18:25:44.511Z"
      }
    ]


<a id="orgd93389b"></a>

### XML

    <probes>
      <probe>
        <self>https://some.server/some.service/probes/bottom#auth</self>
        <code>auth</code>
        <httpStatusCode>200</httpStatusCode>
        <when>2018-04-23T18:25:43.511Z</when>
      </probe>
      <probe>
        <self>https://some.server/some.service/probes/bottom</self>
        <description>database connection test</description>
        <httpStatusCode>400</httpStatusCode>
        <value>The database cannot be contacted. Ensure the database is running and network reachable.</value>
        <when>2018-04-23T18:25:44.511Z</when>
      </probe>
    </probes>


<a id="orgbd8e37e"></a>

## `./probes`

Version 1.0 *optional*

APIs or Applications MAY choose to support individual probes outside of the top / bottom convention.
QA/IT/Support staff and internal facing applications may attempt a GET on this URL and will expect
the endpoint to return an ordered list of probes the application can call ( HTTP GET ) to determine
the pass ( *200* ) or fail ( *500* ) state of the probe. The body must contain an array of one or more
probe resources. These custom probes are expected to be run on demand, not routinely executed by IT
network and application health monitoring systems as the duration and impact of the probe's execution
is not defined.


<a id="orgcd73562"></a>

### JSON

    [
      {
        "self": "https://some.server/some.service/probes/auth",
        "code" :"auth"
      },
      {
        "self": "https://some.server/some.service/probes/con-db",
        "description": "database connection test"
      }
    ]


<a id="orgd7164e8"></a>

### XML

    <probes>
      <probe>
        <self>https://some.server/some.service/probes/auth</self>
        <code>auth</code>
      </probe>
      <probe>
        <self>https://some.server/some.service/probes/con-db</self>
        <description>database connection test</description>
      </probe>
    </probes>


<a id="orgeaffdb3"></a>

## Resource Schema

`self` Required. URL identifying the probe

`code` Machine facing value that uniquely identifies the probe
If `code` is not populated `description` MUST be populated

`description` Human facing value that uniquely identifies the probe.
If `description` is not populated `code` MUST be populated

`httpStatusCode` HTTP Status Code
This property is normally populated when used as the body of an HTTP GET on
*./probes/bottom* and may be populated when executing custom API or application
probes. Since the bottom probe may aggregate many probes we need a way to
communicate pass (*200* ) or fail ( *500* ) status of each individual probe function
aggregated by the bottom probe. If `httpStatusCode` is populated `when` MUST also
be populated

`when` The date and time of probe execution.
If `when` is populated `httpStatusCode` MUST also be populated

`value` Human facing text
Generally populated when there is a failure or warning of some type but the
implementor can use this field in any way they see fit. If populated the value
should give the human user some idea of where the failure or warning is happening
and why it might be happening.


<a id="org3637ecf"></a>

### JSON

    {
      "id": "./vnd.eci.stg.probe.1.0.0.json",
      "$schema": "http://json-schema.org/draft-08/schema#",
      "title": "Probe",
      "description": "Defines the location and description of a probe. Upon execution ( HTTP GET ) defines the state of the probe.",
      "type": "array",
      "items": {
        "additionalProperties": false,
        "required": ["self"],
        "anyOf": [{"required": ["code"]},
                  {"required": ["description"]}],
        "dependencies": {
          "httpStatusCode": { "required": [ "when" ]},
          "when": { "required": [ "httpStatusCode" ]}
        },

        "properties" : {

          "self": {
            "description": "system function identifying a unique system owned resource as a URL",
            "type": "string",
            "minLength": 1,
            "maxLength": 1024
          },

          "code": {
            "description": "machine facing value that uniquely identifies the probe",
            "type": "string",
            "minLength": 1,
            "maxLength": 32
          },

          "description": {
            "description": "human readable string describing the probe's purpose",
            "type": "string",
            "minLength": 1,
            "maxLength": 128
          },

          "httpStatusCode": {
            "description": "usually used bottom probe but may also be returned by api or application specific probes",
            "type": "integer",
            "default": 200,
            "minimum": 100,
            "maximum": 599
          },

          "value": {
            "description": "details from the probe that may help users understand the health of an endpoint",
            "type": "string",
            "minLength": 1,
            "maxLength" : 1024
          },

          "when": {
            "description": "date and time of probe execution",
            "type" : "string",
            "format": "date-time"
          }
        }
      }
    }


<a id="orgec4dc78"></a>

### XML

    <?xml version='1.0' encoding='utf-8'?>

    <xs:schema xmlns:xs='http://www.w3.org/2001/XMLSchema'
               elementFormDefault='qualified'
               xml:lang='en'>

      <xs:element name='probes'>
        <xs:complexType>
          <xs:sequence minOccurs='1' maxOccurs='50'>
            <xs:element name='probe' type='ProbeType'/>
          </xs:sequence>
        </xs:complexType>
      </xs:element>

      <xs:complexType name='ProbeType'>
        <xs:sequence>
          <xs:annotation>
            <xs:documentation>
              TODO
            </xs:documentation>
          </xs:annotation>
          <xs:element name='self' type='xs:string' minOccurs='0' maxOccurs='1'/>
          <xs:element name='code' type='xs:string' minOccurs='0' maxOccurs='1'/>
          <xs:element name='description' type='xs:string' minOccurs='0' maxOccurs='1'/>
          <xs:element name='httpStatusCode' type='xs:integer' minOccurs='0' maxOccurs='1'/>
          <xs:element name='when' type='xs:dateTime' minOccurs='0' maxOccurs='1'/>
          <xs:element name='value' type='xs:string' minOccurs='0' maxOccurs='1'/>
        </xs:sequence>
      </xs:complexType>
    </xs:schema>


<a id="orgfefa798"></a>

## Test Results

    ./test-json.sh 2>&1
    ./test-xml.sh 2>&1
    xmllint --noout --schema ./rsrc-schema/src/vnd.eci.stg.probe.1.0.0.xsd ./rsrc-schema/tst/vnd.eci.stg.probe.1.0.0*.xml


<a id="org7cdd392"></a>

# Stock



<a id="orgdb5d8ca"></a>

## TODO Provide a non-technical overview of the business cases.

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
officia deserunt mollit anim id est laborum.


<a id="org709b2e4"></a>

## Sequence of Events

![img](./images/stock-sequence.puml.png)

In the following section, Use Cases, examples of data ( `--data` ) to be sent and
received will be shown. It is assumed that the caller will make the actual *POST*
call with the required headers e.g.

    curl --request POST \
         --header "Content-Type: application/vnd.eci.stg.stock.1.0.0.xml" \
         --user user123:password123 \
         --url http://vendor-host/vendor-stock-endpoint
         --data ''


<a id="orgdc4a23c"></a>

## Versions


<a id="org86c754f"></a>

### Version 1.0

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


<a id="org26039b6"></a>

### Version 2.0

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


<a id="org591c21b"></a>

## Use Cases


<a id="org8c613fc"></a>

### As an unidentified buyer I would like to see the cost for one or more products

Version 1.0

1.  Request

    In this example a buyer is asking for her cost, the seller's asking price, for a product known to the
    seller as *abc-123*.

    1.  JSON

            { "items": [{ "sellerRef": "abc-123" }]}

    2.  XML

            <items>
              <item>
                <sellerRef>abc-123</sellerRef>
              </item>
            </items>

2.  Response

    The seller's response is intended to inform the buyer that the the item will cost her *99.99$USD*.

    1.  JSON

            { "items": [{ "sellerRef": "abc-123", "unitCost": 99.99}]}

    2.  XML

            <items>
              <item>
                <sellerRef>abc-123</sellerRef>
                <unitCost>99.99</unitCost>
              </item>
            </items>


<a id="org8eb3a9d"></a>

### As an unidentified buyer I would like to know if the seller has enough stock to satisfy my order

Version 1.0

In this case the buyer's intent is to understand if the seller an supply the requested number of
items ( *24* ) for a product known to the seller as *abc-123*.

1.  Request

    1.  JSON

            { "items": [{ "sellerRef": "abc-123", "quantity": 24}]}

    2.  XML

            <items>
              <item>
                <sellerRef>abc-123</sellerRef>
                <quantity>24</quantity>
              </item>
            </items>

2.  Response

    1.  If the seller can deliver the buyer's requested quantity ( *24* ) the seller may reply with

        1.  the requested quantity ( *24* )

            1.  JSON

                    { "items": [{ "sellerRef": "abc-123", "quantity": 24}]}

            2.  XML

                    <items>
                      <item>
                        <sellerRef>abc-123</sellerRef>
                        <quantity>24</quantity>
                      </item>
                    </items>

        2.  the quantity on hand ( *103* )

            1.  JSON

                    { "items": [{ "sellerRef": "abc-123", "quantity": 103}]}

            2.  XML

                    <items>
                      <item>
                        <sellerRef>abc-123</sellerRef>
                        <quantity>103</quantity>
                      </item>
                    </items>

        3.  a fixed value e.g. *1,000*.

            1.  JSON

                    { "items": [{ "sellerRef": "abc-123", "quantity": 1000}]}

            2.  XML

                    <items>
                      <item>
                        <sellerRef>abc-123</sellerRef>
                        <quantity>1000</quantity>
                      </item>
                    </items>

    2.  If the seller cannot deliver the buyer's requested quantity ( *24* ) the seller may reply with

        1.  the quantity on hand ( *12* ).

            1.  JSON

                    { "items": [{ "sellerRef": "abc-123", "quantity": 12}]}

            2.  XML

                    <items>
                      <item>
                        <sellerRef>abc-123</sellerRef>
                        <quantity>12</quantity>
                      </item>
                    </items>

        2.  a fixed value e.g. *0*.

            1.  JSON

                    { "items": [{ "sellerRef": "abc-123", "quantity": 0}]}

            2.  XML

                    <items>
                      <item>
                        <sellerRef>abc-123</sellerRef>
                        <quantity>0</quantity>
                      </item>
                    </items>


<a id="orgff8f986"></a>

### As an unidentified buyer I would like to be able to specify a date when the order must be received.

Version 2.0

In this example the buyer is providing the current date ( 24 April 2008 ) and the date
when they would expect the order to be delivered ( 24 April 2008 ).

    { "count": 1,
      "date" : "2018-04-24T17:00:00.000Z",
      "dateExpected" : "2018-04-26T17:00:00.000Z",
      "items": [
        { "line": 1,
          "item": { "sellerRef": "abc-123" }}]}

In this example the buyer is providing the current date ( 24 April 2008 ) and the date
when they would expect one of the line items in the order to be delivered ( 24 April 2008 ).

    { "count": 1,
      "items": [
        { "line": 1,
          "item": { "sellerRef": "abc-123",
                    "date" : "2018-04-24T17:00:00.000Z",
                    "dateExpected" : "2018-04-26T17:00:00.000Z"}}]}

1.  If the seller does not support this feature the reply can omit dateExpected

        { "count": 1,
          "date" : "2018-04-24T17:00:00.000Z",
          "items": [
            { "line": 1,
              "item": { "sellerRef": "abc-123" }}]}

2.  If the seller supports this feature the reply should contain a date the buyer can expect the item to be delivered

    In this example the seller is telling the buyer they can expect deliver on 30 April 2008

        { "count": 1,
          "date" : "2018-04-24T17:00:00.000Z",
          "dateExpected" : "2018-04-30T17:00:00.000Z",
          "items": [
            { "line": 1,
              "item": { "sellerRef": "abc-123" }}]}


<a id="org28158f6"></a>

### As a seller I would like to be able to provide a replacement item when the seller specifies an outdated item number

Version 2.0

1.  TODO


<a id="orgacae0b9"></a>

### As a seller I would like to be able to provide a substitue when the item specified by the buyer is not in stock

Version 2.0

1.  TODO


<a id="orgbd73b3a"></a>

## Resource Schemas


<a id="org0b33998"></a>

### Version 1.0

1.  Stock

    1.  JSON

            {
              "id": "./vnd.eci.stg.stock.1.0.0.json",
              "title": "Stock, Cost, Date Collection",
              "description": "a collection items a buyer may purchase from a seller",
              "type": "object",
              "properties" : {

                "items": {
                  "description": "the unique items that have or will have stock and cost information",
                  "type": "array",
                  "minItems": 1,
                  "maxItems": 1000,
                  "uniqueItems": true,
                  "items" : {
                    "$ref" : "#/definitions/item"
                  }
                }
              },

              "additionalProperties": false,

              "definitions" : {
                "item": {
                  "title": "Stock, Cost, Date Item",
                  "description": "describes the items a buyer would like to purchase from a seller.",
                  "type": "object",
                  "properties" : {

                    "sellerRef": {
                      "description": "seller function identifying a unique seller owned resource",
                      "type": "string",
                      "minLength": 1,
                      "maxLength": 32
                    },

                    "quantity": {
                      "description": "the number of individual units in the measure e.g. Box of 20",
                      "type": "number",
                      "minimum" : 1,
                      "maximum" : 999999999.999999
                    },

                    "unitCost": {
                      "description": "",
                      "type": "number",
                      "minimum" : 0,
                      "maximum" : 999999999999.999999
                    }
                  },

                  "additionalProperties": false
                }
              }
            }

    2.  XML

            <?xml version='1.0' encoding='utf-8'?>

            <xs:schema xmlns:xs='http://www.w3.org/2001/XMLSchema'
                       elementFormDefault='qualified'
                       xml:lang='en'>

              <xs:element name='items'>
                <xs:complexType>
                  <xs:sequence minOccurs='1' maxOccurs='1000'>
                    <xs:element name='item' type='StockItemType'/>
                  </xs:sequence>
                </xs:complexType>
              </xs:element>

              <xs:complexType name='StockItemType'>
                <xs:sequence>
                  <xs:annotation>
                    <xs:documentation>
                      The set of returned products must not contain duplicate products (that
                      is the nature of sets), and products, by defition, must have a unique
                      ID. Currently we do not place a restriction on the number of products
                      that can be requested at one time, but we should probably do that soon
                      to protect both ECi and the Vendor.
                    </xs:documentation>
                  </xs:annotation>
                  <xs:element name='sellerRef' type='IDType' minOccurs='0' maxOccurs='1'/>
                  <xs:element name='quantity' type='QuantityType' minOccurs='0' maxOccurs='1'/>
                  <xs:element name='unitCost' type='CostType' minOccurs='0' maxOccurs='1'/>
                </xs:sequence>
              </xs:complexType>

              <xs:simpleType name='CostType'>
                <xs:annotation>
                  <xs:documentation>
                    Every Product must have a unit cost that is equal to or greater than
                    0 and must cost just under one trillion monetary units. Version 1.0.0
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

              <xs:simpleType name='IDType'>
                <xs:annotation>
                  <xs:documentation>
                    Every Product must have at least one ID and that ID must uniquely locate
                    only one product; a Product may have more than one ID but a ID must relate
                    to only a single product.
                  </xs:documentation>
                </xs:annotation>
                <xs:restriction base='xs:token'>
                  <xs:minLength value='1'/>
                  <xs:maxLength value='32'/>
                </xs:restriction>
              </xs:simpleType>

              <xs:simpleType name='QuantityType'>
                <xs:restriction base='xs:unsignedInt'/>
              </xs:simpleType>

            </xs:schema>


<a id="orgf682399"></a>

### Version 2.0

1.  Stock

    1.  TODO

2.  Stock Item

    1.  TODO


<a id="org94b3651"></a>

## Testing

    ./test-json.sh 2>&1
    ./test-xml.sh 2>&1
    xmllint --noout --schema ./rsrc-schema/src/vnd.eci.stg.stock.1.0.0.xsd ./rsrc-schema/tst/vnd.eci.stg.stock.1.0.0*.xml


<a id="org7312dbe"></a>

# Invoice



<a id="org486c374"></a>

## TODO Provide a non-technical overview of the business cases

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
officia deserunt mollit anim id est laborum.


<a id="org6a8dc32"></a>

## Sequence of Events

![img](./images/invoice-sequence.puml.png)

In the following section, Use Cases, examples of data ( `--data` ) to be sent and
received will be shown. It is assumed that the caller will make the actual *POST*
call with the required headers e.g.

    curl --request POST \
         --header "Content-Type: application/vnd.eci.stg.invoice.1.0.0.xml" \
         --user user123:password123 \
         --url http://vendor-host/vendor-invoice-endpoint
         --data ''


<a id="org6a0957f"></a>

## Versions


<a id="org714cd81"></a>

### Version 1.0

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


<a id="org6aca27f"></a>

### Version 2.0

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


<a id="orga349767"></a>

## Use Cases


<a id="orge150bd0"></a>

### TODO

Version 1.0

1.  Request

    In this example a seller is

    1.  JSON

    2.  XML

2.  Response

    The buyer's response is intended to

    1.  JSON

    2.  XML


<a id="orgbeec026"></a>

## Resource Schemas


<a id="orgb1fd51f"></a>

### Version 1.0

1.  JSON

2.  XML


<a id="org395b56c"></a>

### Version 2.0

1.  JSON

2.  XML


<a id="orgafd6adb"></a>

## Testing

    ./test-json.sh 2>&1
    ./test-xml.sh 2>&1
    xmllint --noout --schema ./rsrc-schema/src/vnd.eci.stg.invoice.1.0.0.xsd ./rsrc-schema/tst/vnd.eci.stg.invoice.1.0.0*.xml


<a id="orgc77823c"></a>

# Order



<a id="orgeb1a2bc"></a>

## TODO Provide a non-technical overview of the business cases

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
officia deserunt mollit anim id est laborum.


<a id="orgc1dd417"></a>

## Sequence of Events

![img](./images/order-sequence.puml.png)

In the following section, Use Cases, examples of data ( `--data` ) to be sent and
received will be shown. It is assumed that the caller will make the actual *POST*
call with the required headers e.g.

    curl --request POST \
         --header "Content-Type: application/vnd.eci.stg.order.1.0.0.xml" \
         --user user123:password123 \
         --url http://vendor-host/vendor-order-endpoint
         --data ''


<a id="org2d240b0"></a>

## Versions


<a id="org6c21c5d"></a>

### Version 1.0

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


<a id="orgca90240"></a>

### Version 2.0

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


<a id="org699d538"></a>

## Use Cases


<a id="orgf63cde5"></a>

### TODO

Version 1.0

1.  Request

    In this example a buyer is

    1.  JSON

    2.  XML

2.  Response

    The seller's response is intended to

    1.  JSON

    2.  XML


<a id="org8363a68"></a>

## Resource Schemas


<a id="org46f4ff3"></a>

### Version 1.0

1.  JSON

2.  XML


<a id="org71ca8f7"></a>

### Version 2.0

1.  JSON

2.  XML


<a id="orgd40e67d"></a>

## Testing

    ./test-json.sh 2>&1
    ./test-xml.sh 2>&1
    xmllint --noout --schema ./rsrc-schema/src/vnd.eci.stg.order.1.0.0.xsd ./rsrc-schema/tst/vnd.eci.stg.order.1.0.0*.xml


<a id="org60cfc42"></a>

# Ship Method



<a id="org06b85ec"></a>

## TODO Provide a non-technical overview of the business cases

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
officia deserunt mollit anim id est laborum.


<a id="orgfaf4f63"></a>

## Sequence of Events

![img](./images/shipmethod-sequence.puml.png)

In the following section, Use Cases, examples of data ( `--data` ) to be sent and
received will be shown. It is assumed that the caller will make the actual *POST*
call with the required headers e.g.

    curl --request GET \
         --header "Accepts: application/vnd.eci.stg.shipmethod.1.0.0.xml" \
         --user user123:password123 \
         --url http://vendor-host/vendor-shipmethod-endpoint


<a id="org3fa7151"></a>

## Versions


<a id="org5ea08ba"></a>

### Version 1.0

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


<a id="org6cf73ff"></a>

### Version 2.0

Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


<a id="org73a07a5"></a>

## Use Cases


<a id="org7027ef1"></a>

### TODO

Version 1.0

1.  Request

    In this example a buyer is

    1.  JSON

    2.  XML

2.  Response

    The seller's response is intended to

    1.  JSON

    2.  XML


<a id="org586470e"></a>

## Resource Schemas


<a id="org995fa86"></a>

### Version 1.0

1.  JSON

2.  XML


<a id="orgdadb2a0"></a>

### Version 2.0

1.  JSON

2.  XML


<a id="org1b0d402"></a>

## Testing

    ./test-json.sh 2>&1
    ./test-xml.sh 2>&1
    xmllint --noout --schema ./rsrc-schema/src/vnd.eci.stg.shipmethod.1.0.0.xsd ./rsrc-schema/tst/vnd.eci.stg.shipmethod.1.0.0*.xml


<a id="org3210f19"></a>

# About this document

These documents wer created using [emacs's](https://www.gnu.org/software/emacs/) org mode in a Literate Programming style with additional
support from packages such as babel, htmlize, graphviz, plantuml, etc. Emacs was hosted on macOS
High Sierra (10.13.3). Supporting libraries and applications were installed and updated using Homebrew.

    emacs version: GNU Emacs 26.1 (build 1, x86_64-apple-darwin14.5.0, NS appkit-1348.17 Version 10.10.5 (Build 14F2511))
     of 2018-05-30
    org version: 9.1.13

Embedded within this document are code fragments that are executed and do actual
work. As an example the next bit of code creates directories to hold images
generated by graphviz, plantuml, etc. as well as folders for schema documents and
source code required to test and demonstrate key concepts. Not all executing code
will be weaved or tangled but may execute "silently".

    (progn (make-directory "./images" t)
           (make-directory "./rsrc-schema/src" t)
           (make-directory "./rsrc-schema/tst" t))


<a id="orgecf588f"></a>

## Tangle

To tangle documents use the key binding **C-c C-v t**


<a id="orgaa4944c"></a>

## Export

To export documents use the key binding **C-c C-e** and choose your preferred export format. For this
project I am using Markdown e.g. **C-c C-e m m**


<a id="orgbd0f007"></a>

# Resource Schemas


<a id="org96e4097"></a>

## TODO


<a id="orgff7eda8"></a>

# Test Results

    ./test-json.sh 2>&1
