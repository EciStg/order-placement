![img](./images/currency-conceptual-diagram.puml.png)


# Test Results

    echo $(date -u +"%Y-%m-%dT%H:%M:%SZ") started
    xmllint --noout --schema ./other-schema/src/vnd.eci.stg.currency.1.5.0.xsd ./other-schema/tst/vnd.eci.stg.currency.1.5.0*.xml 2>&1
    ajv -s ./other-schema/src/vnd.eci.stg.currency.1.5.0.json -d "./other-schema/tst/vnd.eci.stg.currency*.json" 2>&1
    echo $(date -u +"%Y-%m-%dT%H:%M:%SZ") stopped

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<tbody>
<tr>
<td class="org-left">2019-07-29T19:26:49Z</td>
<td class="org-left">started</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">warning:</td>
<td class="org-left">failed</td>
<td class="org-left">to</td>
<td class="org-left">load</td>
<td class="org-left">external</td>
<td class="org-left">entity</td>
<td class="org-left">./other-schema/src/vnd.eci.stg.currency.1.5.0.xsd</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">Schemas</td>
<td class="org-left">parser</td>
<td class="org-left">error</td>
<td class="org-left">:</td>
<td class="org-left">Failed</td>
<td class="org-left">to</td>
<td class="org-left">locate</td>
<td class="org-left">the</td>
<td class="org-left">main</td>
<td class="org-left">schema</td>
<td class="org-left">resource</td>
<td class="org-left">at</td>
<td class="org-left">'./other-schema/src/vnd.eci.stg.currency.1.5.0.xsd'.</td>
</tr>


<tr>
<td class="org-left">WXS</td>
<td class="org-left">schema</td>
<td class="org-left">./other-schema/src/vnd.eci.stg.currency.1.5.0.xsd</td>
<td class="org-left">failed</td>
<td class="org-left">to</td>
<td class="org-left">compile</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">warning:</td>
<td class="org-left">failed</td>
<td class="org-left">to</td>
<td class="org-left">load</td>
<td class="org-left">external</td>
<td class="org-left">entity</td>
<td class="org-left">./other-schema/tst/vnd.eci.stg.currency.1.5.0\*.xml</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">error:</td>
<td class="org-left">Cannot</td>
<td class="org-left">find</td>
<td class="org-left">schema</td>
<td class="org-left">'/Users/me/code/architecture/order-placement/other-schema/other-schema/src/vnd.eci.stg.currency.1.5.0.json'</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">2019-07-29T19:26:49Z</td>
<td class="org-left">stopped</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>
</table>


# Overview


## TODO


# Definition of Terms

-   **code:** every currency has a registered ISO alphabetic code
-   **description:** not used
-   **name:** human facing value that uniquely identifies the currency.
-   **remarks:** not used
-   **number:** every currency has a registered ISO numeric code
-   **precision:** total number of digits in a number
-   **scale:** number of digits to the right of the decimal point in a number


# Example


## JSON

    { "code": "CLF",
      "name": "Unidad de Fomento",
      "number": 900,
      "precision": 18,
      "scale": 4 }


## XML

    <?xml version='1.0' encoding='utf-8'?>

    <currency>
      <code>CLF</code>
      <name>Unidad de Fomento</name>
      <number>900</number>
      <precision>18</precision>
      <scale>4</scale>
    </currency>


# Resource Schema


## Version 1.0

> Not supported.


## Version 1.5


### JSON

    {
      "id": "./vnd.eci.stg.code.1.5.0.json",
      "$schema": "http://json-schema.org/draft-07/schema#",
      "title": "code",
      "description": "",

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
    }


### XML

    <?xml version='1.0' encoding='utf-8'?>

    <xs:schema xmlns:xs='http://www.w3.org/2001/XMLSchema'
               elementFormDefault='qualified'
               xml:lang='en'>

      <xs:element name='currency' type='CurrencyType'/>

      <xs:complexType name='CurrencyType'>
          <xs:sequence>
            <xs:element name='code'        type='xs:string'  minOccurs='0' maxOccurs='1' />
            <xs:element name='name'        type='xs:string'  minOccurs='0' maxOccurs='1' />
            <xs:element name='description' type='xs:string'  minOccurs='0' maxOccurs='1' />
            <xs:element name='remarks'     type='xs:string'  minOccurs='0' maxOccurs='1' />
            <xs:element name='number'      type='xs:integer' minOccurs='0' maxOccurs='1' />
            <xs:element name='precision'   type='xs:integer' minOccurs='0' maxOccurs='1' />
            <xs:element name='scale'       type='xs:integer' minOccurs='0' maxOccurs='1' />
          </xs:sequence>
        </xs:complexType>
    </xs:schema>


# © 2018-2019 ECI Software Solutions, Inc. All rights reserved.
