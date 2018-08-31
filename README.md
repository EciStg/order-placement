

# The Order Placement System

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.


# Overview

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.


## Actors

Within the ECi Order Placement system a dealer typically takes on the role of
*Buyer*. A vendor or supplier (typical readers of this document) take the role of
*Seller*. A *Consumer* is the dealer's customer, though there are nuances we will
not attempt to explain right now.

![img](./images/buyer-usecases.puml.png)

![img](./images/seller-usecases.puml.png)

![img](./images/consumer-usecases.puml.png)


## Endpoints

There are six endpoints, three provided by the Seller's system

![img](./images/sequence-buyer2seller.puml.png)

And three provided by the Buyer's system:

![img](./images/sequence-seller2buyer.puml.png)


## Connecting


### HTTPS / TLS

The ECi Order Placement services will always connect using a minimum of TLS 1.2.


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


## Resource Types

There are six resource types exchanged between the Buyer's system and the Seller's system:

![img](./images/resource-types.dot.png)

Not all Seller systems support resources or endpoints for Shipment Methods, Order&Delta;
(accept/reject), or Shipment information. We have chosen to represent resources using
JSON Schema and prefer Seller implementations also choose a JSON representation. The
Buyer's system can be programmed to send and receive resources in other representations,
though this is not part of the standard agreement and will need to be addressed separately.


# Endpoints


## Invoice

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.

Invoice [documentation](./invoice/invoice.md)


## Order

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.

Order [documentation](./order/order.md)


## Probes

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.

Probe [documentation](./probe/probe.md)


## Ship Method

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.

Ship Method [documentation](./ship-method/ship-method.md)


## Stock

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.

Stock [documentation](./stock/stock.md)


# Testing


## Schemas


### JSON


    #!/bin/bash
    #
    # brew install jsonlint
    # npm install jsonlint -g
    #

    #
    # make sure all of the files are well-formed JSON
    find ./rsrc-schema/tst ./rsrc-schema/src -type f -name '*.json' -exec jsonlint --quiet --compact {} \;


### XML


    #!/bin/bash
    #
    # brew install xmllint

    # make sure all of the files are well-formed xml
    find ./rsrc-schema/src -type f -name '*.xsd' -exec xmllint --noout {} \;
    find ./rsrc-schema/tst -type f -name '*.xml' -exec xmllint --noout {} \;


# About this document

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


## Tangle

To tangle documents use the key binding **C-c C-v t**


## Export

To export documents use the key binding **C-c C-e** and choose your preferred export format. For this
project I am using Markdown e.g. **C-c C-e m m**


# Test Results

    ./test-json.sh 2>&1
    ./test-xml.sh 2>&1

    ./rsrc-schema/tst/vnd.eci.stg.shipmethod.1.0.0-request.json: line 1, col 0, found: 'EOF' - expected: 'STRING', 'NUMBER', 'NULL', 'TRUE', 'FALSE', '{', '['.
    ./rsrc-schema/tst/vnd.eci.stg.shipmethod.1.0.0-response.json: line 1, col 0, found: 'EOF' - expected: 'STRING', 'NUMBER', 'NULL', 'TRUE', 'FALSE', '{', '['.
    ./rsrc-schema/src/vnd.eci.stg.invoice.1.0.0.json: line 1, col 0, found: 'EOF' - expected: 'STRING', 'NUMBER', 'NULL', 'TRUE', 'FALSE', '{', '['.
    ./rsrc-schema/src/vnd.eci.stg.order.1.5.0.json: line 1, col 0, found: 'EOF' - expected: 'STRING', 'NUMBER', 'NULL', 'TRUE', 'FALSE', '{', '['.
    ./rsrc-schema/src/vnd.eci.stg.order.2.0.0.json: line 1, col 0, found: 'EOF' - expected: 'STRING', 'NUMBER', 'NULL', 'TRUE', 'FALSE', '{', '['.
    ./rsrc-schema/src/vnd.eci.stg.shipmethod.1.0.0.json: line 1, col 0, found: 'EOF' - expected: 'STRING', 'NUMBER', 'NULL', 'TRUE', 'FALSE', '{', '['.
    ./rsrc-schema/src/vnd.eci.stg.shipmethod.1.5.0.json: line 1, col 0, found: 'EOF' - expected: 'STRING', 'NUMBER', 'NULL', 'TRUE', 'FALSE', '{', '['.
    ./rsrc-schema/src/vnd.eci.stg.invoice.1.0.0.xsd:2: parser error : Start tag expected, '<' not found
    ./rsrc-schema/src/vnd.eci.stg.order.2.0.0.xsd:2: parser error : Start tag expected, '<' not found
    ./rsrc-schema/src/vnd.eci.stg.shipmethod.1.0.0.xsd:2: parser error : Start tag expected, '<' not found
    ./rsrc-schema/src/vnd.eci.stg.shipmethod.1.5.0.xsd:2: parser error : Start tag expected, '<' not found
    ./rsrc-schema/tst/vnd.eci.stg.shipmethod.1.0.0-request.xml:2: parser error : Start tag expected, '<' not found
    ./rsrc-schema/tst/vnd.eci.stg.shipmethod.1.0.0-response.xml:2: parser error : Start tag expected, '<' not found
