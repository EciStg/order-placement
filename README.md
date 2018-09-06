

# Order Placement System


## Test Results

In the spirit of 'test first' here are the the test results of the latest build.

    ./test-json.sh 2>&1
    ./test-xml.sh 2>&1


## Overview

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.


### Actors

Within the ECi Order Placement system a dealer typically takes on the role of *Buyer*. A vendor or
supplier (typical readers of this document) take the role of *Seller*. A *Consumer* is the buyer's
customer and in rare cases, the buyer. There are nuances to be discussed, we will not attempt to
explain right now rather we will take up the details for the specific use cases as we come across
them.

![img](./images/buyer-usecases.puml.png)

![img](./images/seller-usecases.puml.png)

![img](./images/consumer-usecases.puml.png)


### Endpoints

There are six endpoints, three provided by the Seller's system

![img](./images/sequence-buyer2seller.puml.png)

And three provided by the Buyer's system:

![img](./images/sequence-seller2buyer.puml.png)


### Connecting

1.  HTTPS / TLS

    The ECi Order Placement services will always connect using a minimum of TLS 1.2.

2.  Authentication

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


### Code / Reference Type

At the heart of the order placement 1.0 resource schema is the notion or concept of a code. A code
is intended to describe a thing of interest to both humans and software and has the following three
components:

-   **Code:** software facing identity function; used to identify the object to a software system
-   **Description:** human facing description providing more information than the name allows
-   **Name:** human facing identity function; use to identify the object to human readers

In version 1.5 and beyond the code type will be replaced with a reference type. The human facing
elements are left in place and has an additional `remarks` field. The software facing `code` has
been extended to allow us to identify a thing in many different systems.

-   **Codes:** an array of codes that identify the object in one or more software systems
-   **Description:** human facing description providing more information than the name allows
-   **Name:** human facing identity function; use to identify the object to human readers
-   **Remarks:** non-schema human facing information sent back and forth between buyer and seller

The array of `codes` will be be populated with one or more codes, where a code is defined as

-   **Code:** retains its definition above. the form changes but the concept remains i.e. software facing identity function; used to identify the object to one or more software systems
-   **Reference:** the actor system that 'owns' or the value.

A contrived example, under my fingers is a keyboard. Using the reference type we can describe the
keyboard from the viewpoint of different actor's actor systems:

-   **Codes:** [[ buyer : wbkbd2345 ] [ seller : kbdbt4cha ]]
-   **Description:** four channel bluetooth Apple layout full size aluminum keyboard with backlit keys
-   **Name:** wireless keyboard
-   **Remarks:** requires two AAA batteries

Or in other words, this keyboard is known as `wbkbd2345` in the buyer's system and as `kbdbt4cha`
in the Seller's system.

Example XML

    <?xml version='1.0' encoding='utf-8'?>

    <Reference>
      <Codes>
        <Code><Code>wbkbd2345</Code><Reference>Buyer</Reference></Code>
        <Code><Code>kbdbt4cha</Code><Reference>Seller</Reference></Code>
      </Codes>
      <Name>wireless keyboard</Name>
      <Description>four channel bluetooth Apple layout full size aluminum keyboard with backlit keys</Description>
      <Remarks>requires two AAA batteries</Remarks>
    </Reference>

Example Schema

    <xs:schema attributeFormDefault='unqualified'
               elementFormDefault='qualified'
               xmlns:xs='http://www.w3.org/2001/XMLSchema'>

      <xs:element name='Reference' type='ReferenceType'/>

      <xs:complexType name='ReferenceType'>
        <xs:sequence>
          <xs:element name='Codes'       type='CodesType' />
          <xs:element name='Name'        type='xs:string' />
          <xs:element name='Description' type='xs:string' />
          <xs:element name='Remarks'     type='xs:string' />
        </xs:sequence>
      </xs:complexType>

      <xs:complexType name='CodesType'>
        <xs:sequence minOccurs='1' maxOccurs='5000'>
          <xs:element name='Code' type='CodeType'/>
        </xs:sequence>
      </xs:complexType>

      <xs:complexType name='CodeType'>
        <xs:sequence>
          <xs:element name='Code'      type='xs:string' />
          <xs:element name='Reference' type='CodeRefType' />
        </xs:sequence>
      </xs:complexType>

      <xs:simpleType name='CodeRefType'>
        <xs:restriction base='xs:string'>
          <xs:enumeration value='Buyer'/>
          <xs:enumeration value='Consumer'/>
          <xs:enumeration value='Manufacturer'/>
          <xs:enumeration value='Seller'/>
        </xs:restriction>
      </xs:simpleType>
    </xs:schema>


### Errors

1.  Defition of Terms

    -   **Code:** Software facing value that uniquely identifies the error. If `Code` is not populated `Name` MUST be populated
    -   **Description:** Human facing text. Generally populated when there is a failure or warning of some type. If populated the value should give the human user some idea of where the failure or warning is happening and why it might be happening.
    -   **Name:** Human facing value that uniquely identifies the probe. If `Name` is not populated `Code` MUST be populated
    -   **Remarks:** Human facing text. Generally populated with one or more actions the user can take to solve the problem
    -   **When:** The date and time of probe execution. If `When` is populated `HttpStatusCode` MUST also be populated

2.  Resource Schema

    1.  JSON

            <?xml version='1.0' encoding='utf-8'?>

            <xs:schema xmlns:xs='http://www.w3.org/2001/XMLSchema'
                       elementFormDefault='qualified'
                       xml:lang='en'>

              <xs:element name='Items'>
                <xs:complexType>
                  <xs:sequence minOccurs='1' maxOccurs='50'>
                    <xs:element name='Error' type='ErrorType'/>
                  </xs:sequence>
                </xs:complexType>
              </xs:element>

              <xs:complexType name='ErrorType'>
                <xs:sequence>
                  <xs:annotation>
                    <xs:documentation>
                      TODO
                    </xs:documentation>
                  </xs:annotation>
                  <xs:element name='Code'        type='xs:string'   minOccurs='0' maxOccurs='1' />
                  <xs:element name='Name'        type='xs:string'   minOccurs='0' maxOccurs='1' />
                  <xs:element name='Description' type='xs:string'   minOccurs='0' maxOccurs='1' />
                  <xs:element name='When'        type='xs:dateTime' minOccurs='0' maxOccurs='1' />
                  <xs:element name='Remarks'     type='xs:string'   minOccurs='0' maxOccurs='1' />
                </xs:sequence>
              </xs:complexType>
            </xs:schema>

    2.  XML

            {
              "id": "./vnd.eci.stg.error.1.5.0.json",
              "$schema": "http://json-schema.org/draft-08/schema#",
              "title": "Error",
              "description": "defines when an error occurred, what the error was, and perhaps how to resolve it.",
              "type": "array",
              "Items": {
                "additionalProperties": false,
                "anyOf": [{"required": ["Code"]},
                          {"required": ["Name"]},
                          {"required": ["When"]}],

                "properties" : {

                  "Code": {
                    "description": "software facing value used to identify and respond to errors",
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 32
                  },

                  "Name": {
                    "description": "human facing value used to identify and respond to errors",
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 32
                  },

                  "Description": {
                    "description": "human readable string describing the error",
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 128
                  },

                  "When": {
                    "description": "origination date and time of the error",
                    "type" : "string",
                    "format": "date-time"
                  },

                  "Remarks": {
                    "description": "details of the error that may help users solve the problem",
                    "type": "string",
                    "minLength": 1,
                    "maxLength" : 256
                  }
                }
              }
            }


### Resource Types

These types are intended to represent data in flight and are not meant to represent data at rest.

There are six resource types exchanged between the Buyer's system and the Seller's system:

![img](./images/resource-types.dot.png)

Not all Seller systems support resources or endpoints for Shipment Methods, Order&Delta;
(accept/reject), or Shipment information. We have chosen to represent resources using
JSON Schema and prefer Seller implementations also choose a JSON representation. The
Buyer's system can be programmed to send and receive resources in other representations,
though this is not part of the standard agreement and will need to be addressed separately.


## Endpoint Documentation


### Invoice

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.

Invoice [documentation](./invoice/README.md)


### Order

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.

Order [documentation](./order/README.md)


### Probe

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.

Probe [documentation](./probe/README.md)


### Ship Method

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.

Ship Method [documentation](./ship-method/README.md)


### Stock

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.

Stock [documentation](./stock/README.md)


## Testing


### Schemas

1.  JSON


        #!/bin/bash
        #
        # brew install jsonlint
        # npm install jsonlint -g
        #

        #
        # make sure all of the files are well-formed JSON
        find ./rsrc-schema/tst ./rsrc-schema/src -type f -name '*.json' -exec jsonlint --quiet --compact {} \;

2.  XML


        #!/bin/bash
        #
        # brew install xmllint

        # make sure all of the files are well-formed xml
        find ./rsrc-schema/src -type f -name '*.xsd' -exec xmllint --noout {} \;
        find ./rsrc-schema/tst -type f -name '*.xml' -exec xmllint --noout {} \;


## About this document

These documents were created using [emacs's](https://www.gnu.org/software/emacs/) org mode in a Literate Programming style with additional
support from packages such as babel, htmlize, graphviz, plantuml, etc. Emacs was hosted on macOS
High Sierra (10.13.3). Supporting libraries and applications were installed and updated using Homebrew.

    emacs version: GNU Emacs 25.3.1 (x86_64-apple-darwin13.4.0, NS appkit-1265.21 Version 10.9.5 (Build 13F1911))
     of 2017-09-12
    org version: 9.1.8

Embedded within this document are code fragments that are executed and do actual
work. As an example the next bit of code creates directories to hold images
generated by graphviz, plantuml, etc. as well as folders for schema documents and
source code required to test and demonstrate key concepts. Not all executing code
will be weaved or tangled but may execute "silently".

    (progn (make-directory "./images" t)
           (make-directory "./rsrc-schema/src" t)
           (make-directory "./rsrc-schema/tst" t))


### Tangle

To tangle documents use the key binding **C-c C-v t**


### Export

To export documents use the key binding **C-c C-e** and choose your preferred export format. For this
project I am using Markdown e.g. **C-c C-e m m**
