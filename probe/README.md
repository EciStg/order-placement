

# Probe


## Technical Overview

We recommend Seller systems support two HTTP GET operations allowing QA/IT/Support and other
applications the ability to pro-actively monitor the health of APIs and applications. ECi systems
must support top and bottom probes.

It is expected that IT will routinely call the required probes with network and application health
monitoring system many times throughout the day. These probes should also be made available to
Customer Care ( Support ) where they can execute probes on demand. Custom probes will be executed
on demand by IT, QA, and Support staff and are not expected to be used by frequent running
software as they may cause strain on the system and have a negative impact on users and systems.


## Definition of Terms

-   **Code:** Software facing value that uniquely identifies the probe. If `Code` is not populated `Name` MUST be populated
-   **Description:** Human facing text. Generally populated when there is a failure or warning of some type but the implementor can use this field in any way they see fit. If populated the value should give the human user some idea of where the failure or warning is happening and why it might be happening.
-   **HttpStatusCode:** This property is normally populated when used as the body of an HTTP GET on *./probes/bottom* and may be populated when executing custom API or application probes. Since the bottom probe may aggregate many probes we need a way to communicate pass (*200* ) or fail ( *500* ) status of each individual probe function aggregated by the bottom probe. If `HttpStatusCode` is populated `When` MUST also be populated
-   **Name:** Human facing value that uniquely identifies the probe. If `Name` is not populated `Description` MUST be populated
-   **Self:** Required. URL identifying the probe
-   **When:** The date and time of probe execution. If `When` is populated `HttpStatusCode` MUST also be populated


## Details

A word about volume. The intended purpose is for ECi and Seller health monitoring systems to detect
problems before customers do. To decrease unwanted volume implementors may protect these routes
by caching and traditional DDOS mitigation measures. Some seller systems may require white listing,
we are happy to accommodate this and other needs of our partners.

The information returned from probes which return a body may be cached by the client, the server,
or both. If implementor decide to cache on the server please note these probe should be designed to
be fetched ( HTTP GET ) several times per hour. The means and length of time results should be cached
are at the implementor's discretion. The cache time needs to be balanced against the purpose of the
probes which is to alert IT systems and staff of problems before customers and customer support staff
experience the problem.

An example: implementors may instruct clients to cache results for a certain period of time, in this
case 5 minutes, using HTTP/1.1 header and values indicating. Implementors may also include HTTP/1.0
Expires header ( not shown ).

    Cache-Control: public, max-age=300


### ./probes/top

1.  Version 1.0 *unsupported*

2.  Version 1.5 *required*

    This probe must be a light weight indicator of API or application availability. QA/IT/Support and
    other applications must be able to GET this low impact fast running probe. It is expected that this
    probe will be called one or more times per minute. Calling applications are required to check the
    HTTP status code as a pass ( *200* ) or fail ( *500* ) indicator. A body must not be returned to
    the caller.

        curl -sw "%{http_code}\\n" http://localhost/apis/v0/order/probes/top

3.  Version 2.0

    No changes to date


### ./probes/bottom

1.  Version 1.0 *unsupported*

2.  Version 1.5 *required*

    This probe should test all of the layers of the API or application and all vital connections to
    required systems, APIs, databases, etc. QA/IT/Support staff and other applications must be able to
    GET this modest impact probe. It is expected that this probe will be called several times per hour.
    Calling applications are required to check the HTTP status code as a pass ( *200* ) or fail ( *500* )
    indicator. A body is optional. If a body is provided by the endpoint it must contain an array of one
    or more probe resources, each of which will contain its own HTTP Status Code.

    1.  JSON

            [
              {
                "Self": "https://some.server/some.service/probes/bottom#auth",
                "Code" :"auth",
                "HttpStatusCode": 200,
                "When": "2018-04-23T18:25:43.511Z"
              },
              {
                "Self": "https://some.server/some.service/probes/bottom",
                "Name": "database connection test",
                "Description":"The database cannot be contacted. Ensure the database is running and network reachable.",
                "HttpStatusCode": 400,
                "When": "2018-04-23T18:25:44.511Z"
              }
            ]

    2.  XML

            <Items>
              <Probe>
                <Self>https://some.server/some.service/probes/bottom#auth</Self>
                <Code>auth</Code>
                <HttpStatusCode>200</HttpStatusCode>
                <When>2018-04-23T18:25:43.511Z</When>
              </Probe>
              <Probe>
                <Self>https://some.server/some.service/probes/bottom</Self>
                <Name>database connection test</Name>
                <Description>The database cannot be contacted. Ensure the database is running and network reachable.</Description>
                <HttpStatusCode>400</HttpStatusCode>
                <When>2018-04-23T18:25:44.511Z</When>
              </Probe>
            </Items>

3.  Version 2.0

    No changes to date


### ./probes

1.  Version 1.0 *unsupported*

2.  Version 1.5 *optional*

    APIs or Applications MAY choose to support individual probes outside of the top / bottom convention.
    QA/IT/Support staff and other applications may attempt a GET on this URL and will expect the endpoint
    to return an ordered list of probes the application can call ( HTTP GET ) to determine the pass
    ( *200* ) or fail ( *500* ) state of the probe. The body must contain an array of one or more probe
    resources. These custom probes are expected to be run on demand, not routinely executed by IT network
    and application health monitoring systems as the duration and impact of the probe's execution is not
    defined.

    1.  JSON

            [
              {
                "Self": "https://some.server/some.service/probes/auth",
                "Code" :"auth"
              },
              {
                "Self": "https://some.server/some.service/probes/con-db",
                "Name": "database connection test"
              }
            ]

    2.  XML

            <Items>
              <Probe>
                <Self>https://some.server/some.service/probes/auth</Self>
                <Code>auth</Code>
              </Probe>
              <Probe>
                <Self>https://some.server/some.service/probes/con-db</Self>
                <Name>database connection test</Name>
              </Probe>
            </Items>

3.  Version 2.0

    No changes to date


## Resource Schema


### Version 1.0

Not supported


### Version 1.5

1.  JSON

        {
          "id": "./vnd.eci.stg.probe.1.5.0.json",
          "$schema": "http://json-schema.org/draft-08/schema#",
          "title": "Probe",
          "description": "Defines the location and description of a probe. Upon execution ( HTTP GET ) defines the state of the probe.",
          "type": "array",
          "Items": {
            "additionalProperties": false,
            "required": ["Self"],
            "anyOf": [{"required": ["Code"]},
                      {"required": ["Name"]}],
            "dependencies": {
              "httpStatusCode": { "required": [ "When" ]},
              "when": { "required": [ "HttpStatusCode" ]}
            },

            "properties" : {

              "Self": {
                "description": "system function identifying a unique system owned resource as a URL",
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
              },

              "Code": {
                "description": "software facing value that uniquely identifies the probe",
                "type": "string",
                "minLength": 1,
                "maxLength": 32
              },

              "Name": {
                "description": "human readable string describing the probe's purpose",
                "type": "string",
                "minLength": 1,
                "maxLength": 32
              },

              "Description": {
                "description": "details from the probe that may help users understand the health of an endpoint",
                "type": "string",
                "minLength": 1,
                "maxLength" : 128
              },

              "HttpStatusCode": {
                "description": "usually used bottom probe but may also be returned by api or application specific probes",
                "type": "integer",
                "default": 200,
                "minimum": 100,
                "maximum": 599
              },

              "When": {
                "description": "origination date and time of probe execution",
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

2.  XML

        <?xml version='1.0' encoding='utf-8'?>

        <xs:schema xmlns:xs='http://www.w3.org/2001/XMLSchema'
                   elementFormDefault='qualified'
                   xml:lang='en'>

          <xs:element name='Items'>
            <xs:complexType>
              <xs:sequence minOccurs='1' maxOccurs='50'>
                <xs:element name='Probe' type='ProbeType'/>
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
              <xs:element name='Self'           type='xs:string'   minOccurs='0' maxOccurs='1' />
              <xs:element name='Code'           type='xs:string'   minOccurs='0' maxOccurs='1' />
              <xs:element name='Name'           type='xs:string'   minOccurs='0' maxOccurs='1' />
              <xs:element name='Description'    type='xs:string'   minOccurs='0' maxOccurs='1' />
              <xs:element name='HttpStatusCode' type='xs:integer'  minOccurs='0' maxOccurs='1' />
              <xs:element name='When'           type='xs:dateTime' minOccurs='0' maxOccurs='1' />
            </xs:sequence>
          </xs:complexType>
        </xs:schema>


### Version 2.0

1.  TODO


## Test Results

    ../test-json.sh 2>&1
    ../test-xml.sh 2>&1
    xmllint --noout --schema ../rsrc-schema/src/vnd.eci.stg.probe.1.5.0.xsd ../rsrc-schema/tst/vnd.eci.stg.probe.1.5.0*.xml

    find: ./rsrc-schema/tst: No such file or directory
    find: ./rsrc-schema/src: No such file or directory
    find: ./rsrc-schema/src: No such file or directory
    find: ./rsrc-schema/tst: No such file or directory
