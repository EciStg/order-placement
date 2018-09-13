

# Invoice


## Technical Overview

Lorem ipsum dolor sit amet, sea ad clita sadipscing, mea id antiopam prodesset. Justo scripta vivendum eum id, in vis essent petentium. Qui mutat tritani epicuri et, utamur percipitur an sea. Ad nullam integre eum. Cu atqui inermis pri, tempor causae sanctus at pro. Ea cum tation hendrerit conclusionemque, veri hendrerit definitionem sit at. Vix adipiscing dissentiet eloquentiam eu, decore epicurei liberavisse eu eam.


## Sequence of Events

![img](../images/invoice-sequence.puml.png)

In the following section, Use Cases, examples of data ( `--data` ) to be sent and
received will be shown. It is assumed that the caller will make the actual *POST*
call with the required headers e.g.

    curl --request POST \
         --header "Content-Type: application/vnd.eci.stg.invoice.1.5.0.xml; charset=utf-8" \
         --user user123:password123 \
         --url http://vendor-host/vendor-invoice-endpoint
         --data ''


## Use Cases


### Version 1.0

1.  Request

    In this example a seller is

    1.  JSON

            {}

    2.  XML

            <?xml version='1.0' encoding='utf-8'?>
            <invoice/>

2.  Response

    The buyer's response is intended to

    1.  JSON

            {}

    2.  XML

            <?xml version='1.0' encoding='utf-8'?>
            <invoice/>


## Resource Schemas


### Version 1.0

No longer published


### Version 1.5

1.  JSON

        {}

2.  XML

        <xs:schema attributeFormDefault='unqualified'
                   elementFormDefault='qualified'
                   xmlns:xs='http://www.w3.org/2001/XMLSchema'>

          <xs:element name='Invoice' type='InvoiceType'/>

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

          <xs:complexType name='BillToType'>
            <xs:sequence>
              <xs:element name='Address'   type='AddressType'   />
              <xs:element name='Email'     type='xs:string'     />
              <xs:element name='Name'      type='xs:string'     />
              <xs:element name='Phone'     type='xs:string'     />
              <xs:element name='Reference' type='ReferenceType' />
              <xs:element name='Remarks'   type='xs:string'     />
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

          <xs:complexType name='CarrierType'>
            <xs:sequence>
              <xs:element name='Name'    type='xs:string' />
              <xs:element name='Remarks' type='xs:string' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='CodeType'>
            <xs:simpleContent>
              <xs:extension base='xs:string'>
                <xs:attribute type='xs:string' name='null'/>
              </xs:extension>
            </xs:simpleContent>
          </xs:complexType>

          <xs:complexType name='ConsumerType'>
            <xs:sequence>
              <xs:element name='Address'    type='AddressType'   />
              <xs:element name='ContractId' type='xs:string'     />
              <xs:element name='Email'      type='xs:string'     />
              <xs:element name='Name'       type='xs:string'     />
              <xs:element name='Phone'      type='xs:string'     />
              <xs:element name='Reference'  type='ReferenceType' />
              <xs:element name='Remarks'    type='xs:string'     />
              <xs:element name='TaxNumber'  type='xs:string'     />
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

          <xs:complexType name='InvoiceType'>
            <xs:sequence>
              <xs:element name='BillTo'   type='BillToType'   />
              <xs:element name='Buyer'    type='BuyerType'    />
              <xs:element name='Consumer' type='ConsumerType' />
              <xs:element name='Date'     type='xs:dateTime'  />
              <xs:element name='Id'       type='xs:string'    />
              <xs:element name='Orders'   type='OrdersType'   />
              <xs:element name='Remarks'  type='xs:string'    />
              <xs:element name='Seller'   type='SellerType'   />
              <xs:element name='ShipTo'   type='ShipToType'   />
              <xs:element name='Tax'      type='TaxType'      />
              <xs:element name='Term'     type='xs:string'    />
              <xs:element name='Total'    type='MoneyType'    />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='OrderType'>
            <xs:sequence>
              <xs:element name='Amount'                      type='MoneyType'       />
              <xs:element name='AmountSubjectToTerms'        type='MoneyType'       />
              <xs:element name='BillTo'                      type='BillToType'      />
              <xs:element name='Buyer'                       type='BuyerType'       />
              <xs:element name='Carrier'                     type='CarrierType'     />
              <xs:element name='Code'                        type='CodeType'        />
              <xs:element name='Consumer'                    type='ConsumerType'    />
              <xs:element name='CountEmbedded'               type='xs:integer'      />
              <xs:element name='Currency'                    type='CurrencyType'    />
              <xs:element name='Date'                        type='xs:dateTime'     />
              <xs:element name='Description'                 type='xs:string'       />
              <xs:element name='Discount'                    type='MoneyType'       />
              <xs:element name='ExpectedDate'                type='xs:dateTime'     />
              <xs:element name='Freight'                     type='MoneyType'       />
              <xs:element name='Id'                          type='xs:string'       />
              <xs:element name='Items'                       type='ItemsType'       />
              <xs:element name='LineNumber'                  type='xs:integer'      />
              <xs:element name='Make'                        type='xs:string'       />
              <xs:element name='Model'                       type='xs:string'       />
              <xs:element name='OptionAllowBackorder'        type='xs:boolean'      />
              <xs:element name='OptionAllowCostChanges'      type='xs:boolean'      />
              <xs:element name='OptionAllowPartialShipments' type='xs:boolean'      />
              <xs:element name='OptionAllowSubstitutions'    type='xs:boolean'      />
              <xs:element name='OptionDropShip'              type='xs:boolean'      />
              <xs:element name='Quantity'                    type='xs:float'        />
              <xs:element name='QuantityAcknowledged'        type='xs:float'        />
              <xs:element name='Reference'                   type='ReferenceType'   />
              <xs:element name='Remarks'                     type='xs:string'       />
              <xs:element name='SellerReference'             type='ReferenceType'   />
              <xs:element name='SerialNumber'                type='xs:string'       />
              <xs:element name='ShipTo'                      type='ShipToType'      />
              <xs:element name='Tax'                         type='TaxType'         />
              <xs:element name='Unit'                        type='UnitMeasureType' />
              <xs:element name='UnitCost'                    type='MoneyType'       />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='ItemType'>
            <xs:sequence>
              <xs:element name='a' type='xs:string' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='ItemsType'>
            <xs:sequence>
              <xs:element name='Items' type='ItemType' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='MoneyType'>
            <xs:sequence>
              <xs:element name='Amount' type='xs:float'     />
              <xs:element name='Type'   type='CurrencyType' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='OrdersType'>
            <xs:sequence>
              <xs:element type='OrdersType' name='Orders'/>
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='ReferenceType'>
            <xs:sequence>
              <xs:element name='BuyerReference'        type='xs:string' />
              <xs:element name='ConsumerReference'     type='xs:string' />
              <xs:element name='Description'           type='xs:string' />
              <xs:element name='DocumentReference'     type='xs:string' />
              <xs:element name='LineNumberReference'   type='xs:string' />
              <xs:element name='ManufacturerReference' type='xs:string' />
              <xs:element name='SellerReference'       type='xs:string' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='SellerType'>
            <xs:sequence>
              <xs:element name='Id' type='xs:string' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='ShipToType'>
            <xs:sequence>
              <xs:element name='Address'   type='AddressType'   />
              <xs:element name='Email'     type='xs:string'     />
              <xs:element name='Name'      type='xs:string'     />
              <xs:element name='Phone'     type='xs:string'     />
              <xs:element name='Reference' type='ReferenceType' />
              <xs:element name='Remarks'   type='xs:string'     />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='TaxType'>
            <xs:sequence>
              <xs:element name='Amount' type='MoneyType' />
              <xs:element name='Code'   type='xs:string' />
            </xs:sequence>
          </xs:complexType>

          <xs:complexType name='UnitMeasureType'>
            <xs:sequence>
              <xs:element name='Description'     type='xs:string' />
              <xs:element name='MachineFacingID' type='xs:string' />
              <xs:element name='Quantity'        type='xs:float'  />
            </xs:sequence>
          </xs:complexType>

        </xs:schema>


### Version 2.0

1.  JSON

    1.  TODO include updated json schema

2.  XML

    1.  TODO include updated xml schema


## Testing

    ../test-json.sh 2>&1
    ../test-xml.sh 2>&1
    xmllint --noout --schema ../rsrc-schema/src/vnd.eci.stg.invoice.1.5.0.xsd ../rsrc-schema/tst/vnd.eci.stg.invoice.1.5.0*.xml