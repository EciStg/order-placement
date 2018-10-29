

# Ship Methods


## Test Results

    echo $(date -u +"%Y-%m-%dT%H:%M:%SZ") started
    xmllint --noout --schema ../rsrc-schema/src/vnd.eci.stg.shipmethod.1.5.0.xsd ../rsrc-schema/tst/vnd.eci.stg.shipmethod.1.5.0*.xml 2>&1
    ajv -s ../rsrc-schema/src/vnd.eci.stg.shipmethod.1.5.0.json -d "../rsrc-schema/tst/vnd.eci.stg.shipmethod*.json" 2>&1
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
<td class="org-left">2018-10-29T23:18:34Z</td>
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
<td class="org-left">Schemas</td>
<td class="org-left">parser</td>
<td class="org-left">error</td>
<td class="org-left">:</td>
<td class="org-left">The</td>
<td class="org-left">XML</td>
<td class="org-left">document</td>
<td class="org-left">'../rsrc-schema/src/vnd.eci.stg.shipmethod.1.5.0.xsd'</td>
<td class="org-left">is</td>
<td class="org-left">not</td>
<td class="org-left">a</td>
<td class="org-left">schema</td>
<td class="org-left">document.</td>
</tr>


<tr>
<td class="org-left">WXS</td>
<td class="org-left">schema</td>
<td class="org-left">../rsrc-schema/src/vnd.eci.stg.shipmethod.1.5.0.xsd</td>
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
<td class="org-left">schema</td>
<td class="org-left">../rsrc-schema/src/vnd.eci.stg.shipmethod.1.5.0.json</td>
<td class="org-left">is</td>
<td class="org-left">invalid</td>
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
<td class="org-left">error:</td>
<td class="org-left">no</td>
<td class="org-left">schema</td>
<td class="org-left">with</td>
<td class="org-left">key</td>
<td class="org-left">or</td>
<td class="org-left">ref</td>
<td class="org-left"><http://json-schema.org/draft-08/schema>#</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">2018-10-29T23:18:34Z</td>
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


## Overview


### TODO

![img](../images/shipmethod-sequence.puml.png)

In the following section, Use Cases, examples of data ( `--data` ) to be sent and
received will be shown. It is assumed that the caller will make the actual *POST*
call with the required headers e.g.

    curl --request GET \
         --header "Accepts: application/vnd.eci.stg.shipmethod.1.5.0.xml; charset=utf-8" \
         --user user123:password123 \
         --url http://vendor-host/vendor-shipmethod-endpoint


## Definition of Terms


### TODO


## Example


### TODO


## Use Cases


### TODO

Version 1.0

1.  Request

    In this example a buyer is

    1.  JSON

            {}

    2.  XML

            <?xml version='1.0' encoding='utf-8'?>
            <shipmethod/>

2.  Response

    The buyer's response is intended to

    1.  JSON

            {}

    2.  XML

            <?xml version='1.0' encoding='utf-8'?>
            <shipmethod/>


## Resource Schemas


### Version 1.0

No longer published


### Version 1.5

1.  JSON

        {
          "id": "./vnd.eci.stg.shipmethod.1.5.0.json",
          "$schema": "http://json-schema.org/draft-08/schema#",
          "title": "ShipMethod"
        }

2.  XML

        <?xml version='1.0' encoding='utf-8'?>
        <shipmethod/>


## © 2018 ECi Software Solutions, Inc. All rights reserved.
