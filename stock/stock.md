

# Non-technical Overview


## TODO provide a non-technical overview of the business cases


# Sequence of Events

![img](../images/stock-sequence.puml.png)

In the following section, Use Cases, examples of data ( `--data` ) to be sent and
received will be shown. It is assumed that the caller will make the actual *POST*
call with the required headers e.g.

    curl --request POST \
         --header "Content-Type: application/vnd.eci.stg.stock.1.5.0.xml; charset=utf-8" \
         --user user123:password123 \
         --url http://vendor-host/vendor-stock-endpoint
         --data ''


# Versions


## Version 1.0

No longer published


## Version 1.5


### TODO


## Version 2.0


### TODO


# Use Cases


## As an unidentified buyer I would like to see the cost for one or more products

Version 1.5


### Request

In this example a buyer is asking for her cost, the seller's asking price, for a product known to the
seller as *abc-123*.

1.  JSON

        { "items": [{ "sellerRef": "abc-123" }]}

2.  XML

        <?xml version='1.0' encoding='utf-8'?>

        <Stock>
          <Items>
            <Item>
              <Reference>
                <SellerReference>abc-123</SellerReference>
              </Reference>
            </Item>
          </Items>
        </Stock>


### Response

The seller's response is intended to inform the buyer that the the item will cost her *99.99$USD*.

1.  JSON

        { "items": [{ "sellerRef": "abc-123", "unitCost": 99.99}]}

2.  XML

        <?xml version='1.0' encoding='utf-8'?>

        <Stock>
          <Items>
            <Item>
              <Reference>
                <SellerReference>abc-123</SellerReference>
              </Reference>
              <UnitCost>
                <Amount>99.99</Amount>
              </UnitCost>
            </Item>
          </Items>
        </Stock>


## As an unidentified buyer I would like to know if the seller has enough stock to satisfy my order

Version 1.5

In this case the buyer's intent is to understand if the seller an supply the requested number of
items ( *24* ) for a product known to the seller as *abc-123*.


### Request

1.  JSON

        { "items": [{ "sellerRef": "abc-123", "quantity": 24}]}

2.  XML

        <?xml version='1.0' encoding='utf-8'?>

        <Stock>
          <Items>
            <Item>
              <Quantity>24</Quantity>
              <Reference>
                <SellerReference>abc-123</SellerReference>
              </Reference>
            </Item>
          </Items>
        </Stock>


### Response

1.  If the seller can deliver the buyer's requested quantity ( *24* ) the seller may reply with

    1.  the requested quantity ( *24* )

        1.  JSON

                { "items": [{ "sellerRef": "abc-123", "quantity": 24}]}

        2.  XML

                <?xml version='1.0' encoding='utf-8'?>

                <Stock>
                  <Items>
                    <Item>
                      <Quantity>24</Quantity>
                      <Reference>
                        <SellerReference>abc-123</SellerReference>
                      </Reference>
                    </Item>
                  </Items>
                </Stock>

    2.  the quantity on hand ( *103* )

        1.  JSON

                { "items": [{ "sellerRef": "abc-123", "quantity": 103}]}

        2.  XML

                <?xml version='1.0' encoding='utf-8'?>

                <Stock>
                  <Items>
                    <Item>
                      <Quantity>103</Quantity>
                      <Reference>
                        <SellerReference>abc-123</SellerReference>
                      </Reference>
                    </Item>
                  </Items>
                </Stock>

    3.  a fixed value e.g. *1,000*.

        1.  JSON

                { "items": [{ "sellerRef": "abc-123", "quantity": 1000}]}

        2.  XML

                <?xml version='1.0' encoding='utf-8'?>

                <Stock>
                  <Items>
                    <Item>
                      <Quantity>1000</Quantity>
                      <Reference>
                        <SellerReference>abc-123</SellerReference>
                      </Reference>
                    </Item>
                  </Items>
                </Stock>

2.  If the seller cannot deliver the buyer's requested quantity ( *24* ) the seller may reply with

    1.  the quantity on hand ( *12* ).

        1.  JSON

                { "items": [{ "sellerRef": "abc-123", "quantity": 12}]}

        2.  XML

                <?xml version='1.0' encoding='utf-8'?>

                <Stock>
                  <Items>
                    <Item>
                      <Quantity>12</Quantity>
                      <Reference>
                        <SellerReference>abc-123</SellerReference>
                      </Reference>
                    </Item>
                  </Items>
                </Stock>

    2.  a fixed value e.g. *0*.

        1.  JSON

                { "items": [{ "sellerRef": "abc-123", "quantity": 0}]}

        2.  XML

                <?xml version='1.0' encoding='utf-8'?>

                <Stock>
                  <Items>
                    <Item>
                      <Quantity>0</Quantity>
                      <Reference>
                        <SellerReference>abc-123</SellerReference>
                      </Reference>
                    </Item>
                  </Items>
                </Stock>


## As an unidentified buyer I would like to be able to specify a date when the order must be received.

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


### If the seller does not support this feature the reply can omit dateExpected

    { "count": 1,
      "date" : "2018-04-24T17:00:00.000Z",
      "items": [
        { "line": 1,
          "item": { "sellerRef": "abc-123" }}]}


### If the seller supports this feature the reply should contain a date the buyer can expect the item to be delivered

In this example the seller is telling the buyer they can expect deliver on 30 April 2008

    { "count": 1,
      "date" : "2018-04-24T17:00:00.000Z",
      "dateExpected" : "2018-04-30T17:00:00.000Z",
      "items": [
        { "line": 1,
          "item": { "sellerRef": "abc-123" }}]}


## As a seller I would like to be able to provide a replacement item when the seller specifies an outdated item number

Version 2.0


### TODO


## As a seller I would like to be able to provide a substitue when the item specified by the buyer is not in stock

Version 2.0


### TODO


# Resource Schemas


## Version 1.0

No longer published


## Version 1.5


### JSON

    {
      "id": "./vnd.eci.stg.stock.1.5.0.json",
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


### XML

    <?xml version='1.0' encoding='utf-8'?>

    <xs:schema xmlns:xs='http://www.w3.org/2001/XMLSchema'
               elementFormDefault='qualified'
               xml:lang='en'>

      <xs:element name='Stock' type='StockType'/>

      <xs:complexType name='AddressType'>
        <xs:sequence>
          <xs:element name='AlternateLocation' type='xs:string' />
          <xs:element name='Attention'         type='xs:string' />
          <xs:element name='City'              type='xs:string' />
          <xs:element name='Country'           type='xs:string' />
          <xs:element name='MailStopCode'      type='xs:string' />
          <xs:element name='Recipient'         type='xs:string' />
          <xs:element name='Remarks'           type='xs:string' />
          <xs:element name='State'             type='xs:string' />
          <xs:element name='Street'            type='xs:string' />
          <xs:element name='Tag'               type='xs:string' />
          <xs:element name='Zip'               type='xs:string' />
        </xs:sequence>
      </xs:complexType>

      <xs:complexType name='BuyerType'>
        <xs:sequence>
          <xs:element name='Address'   type='AddressType'   />
          <xs:element name='Email'     type='xs:string'     />
          <xs:element name='Name'      type='xs:string'     />
          <xs:element name='Phone'     type='xs:string'     />
          <xs:element name='Reference' type='ReferenceType' />
          <xs:element name='Remarks'   type='xs:string'     />
          <xs:element name='TaxNumber' type='xs:string'     />
        </xs:sequence>
      </xs:complexType>

      <xs:complexType name='CurrencyType'>
        <xs:sequence>
          <xs:element name='Code'      type='xs:string'  />
          <xs:element name='Number'    type='xs:integer' />
          <xs:element name='Precision' type='xs:integer' />
          <xs:element name='Scale'     type='xs:integer' />
        </xs:sequence>
      </xs:complexType>

      <xs:complexType name='ItemType'>
        <xs:sequence>
          <xs:element name='Amount'               type='MoneyType'       minOccurs='0' maxOccurs='1' />
          <xs:element name='AmountSubjectToTerms' type='MoneyType'       minOccurs='0' maxOccurs='1' />
          <xs:element name='Description'          type='xs:string'       minOccurs='0' maxOccurs='1' />
          <xs:element name='Discount'             type='MoneyType'       minOccurs='0' maxOccurs='1' />
          <xs:element name='ExpectedDate'         type='xs:dateTime'     minOccurs='0' maxOccurs='1' />
          <xs:element name='Freight'              type='MoneyType'       minOccurs='0' maxOccurs='1' />
          <xs:element name='LineNumber'           type='xs:integer'      minOccurs='0' maxOccurs='1' />
          <xs:element name='Make'                 type='xs:string'       minOccurs='0' maxOccurs='1' />
          <xs:element name='Model'                type='xs:string'       minOccurs='0' maxOccurs='1' />
          <xs:element name='Quantity'             type='xs:float'        minOccurs='0' maxOccurs='1' />
          <xs:element name='QuantityAcknowledged' type='xs:decimal'      minOccurs='0' maxOccurs='1' />
          <xs:element name='Reference'            type='ReferenceType'   minOccurs='0' maxOccurs='1' />
          <xs:element name='Remarks'              type='xs:string'       minOccurs='0' maxOccurs='1' />
          <xs:element name='SerialNumber'         type='xs:string'       minOccurs='0' maxOccurs='1' />
          <xs:element name='Tax'                  type='MoneyType'       minOccurs='0' maxOccurs='1' />
          <xs:element name='Unit'                 type='UnitMeasureType' minOccurs='0' maxOccurs='1' />
          <xs:element name='UnitCost'             type='MoneyType'       minOccurs='0' maxOccurs='1' />
        </xs:sequence>
      </xs:complexType>

      <xs:complexType name='ItemsType'>
        <xs:sequence minOccurs='1' maxOccurs='5000'>
          <xs:element name='Item' type='ItemType'/>
        </xs:sequence>
      </xs:complexType>

      <xs:complexType name='MoneyType'>
        <xs:sequence>
          <xs:element name='Amount'   type='xs:decimal'   maxOccurs='1' />
          <xs:element name='Currency' type='CurrencyType' minOccurs='0' maxOccurs='1' />
        </xs:sequence>
      </xs:complexType>

      <xs:complexType name='ReferenceType'>
        <xs:sequence>
          <xs:element name='BuyerReference'        type='xs:string' minOccurs='0' maxOccurs='1' />
          <xs:element name='ConsumerReference'     type='xs:string' minOccurs='0' maxOccurs='1' />
          <xs:element name='Description'           type='xs:string' minOccurs='0' maxOccurs='1' />
          <xs:element name='DocumentReference'     type='xs:string' minOccurs='0' maxOccurs='1' />
          <xs:element name='LineNumberReference'   type='xs:string' minOccurs='0' maxOccurs='1' />
          <xs:element name='ManufacturerReference' type='xs:string' minOccurs='0' maxOccurs='1' />
          <xs:element name='SellerReference'       type='xs:string' minOccurs='0' maxOccurs='1' />
        </xs:sequence>
      </xs:complexType>

      <xs:complexType name='StockType'>
        <xs:sequence>
          <xs:element name='Buyer'           type='BuyerType'     minOccurs='0' maxOccurs='1' />
          <xs:element name='CountEmbedded'   type='xs:integer'    minOccurs='0' maxOccurs='1' />
          <xs:element name='Currency'        type='CurrencyType'  minOccurs='0' maxOccurs='1' />
          <xs:element name='Date'            type='xs:dateTime'   minOccurs='0' maxOccurs='1' />
          <xs:element name='DateExpected'    type='xs:dateTime'   minOccurs='0' maxOccurs='1' />
          <xs:element name='Items'           type='ItemsType'     minOccurs='1' maxOccurs='1' />
          <xs:element name='Reference'       type='ReferenceType' minOccurs='0' maxOccurs='1' />
          <xs:element name='Remarks'         type='xs:string'     minOccurs='0' maxOccurs='1' />
          <xs:element name='SellerReference' type='ReferenceType' minOccurs='0' maxOccurs='1' />
        </xs:sequence>
      </xs:complexType>

      <xs:complexType name='UnitMeasureType'>
        <xs:sequence>
          <xs:element name='Description'     type='xs:string'  />
          <xs:element name='MachineFacingID' type='xs:string'  />
          <xs:element name='Quantity'        type='xs:decimal' />
        </xs:sequence>
      </xs:complexType>

      <xs:simpleType name='CostType'>
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


## Version 2.0


### Stock

1.  TODO


### Stock Item

1.  TODO


# Testing

    ../test-json.sh 2>&1
    ../test-xml.sh 2>&1
    xmllint --noout --schema ../rsrc-schema/src/vnd.eci.stg.stock.1.5.0.xsd ../rsrc-schema/tst/vnd.eci.stg.stock.1.5.0*.xml

    find: ./rsrc-schema/tst: No such file or directory
    find: ./rsrc-schema/src: No such file or directory
    find: ./rsrc-schema/src: No such file or directory
    find: ./rsrc-schema/tst: No such file or directory
