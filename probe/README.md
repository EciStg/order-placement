

# Probe


## Overview

The purpose of a Probe is to allow ECi and Seller health monitoring systems and staff to detect
problems before customers do, provide actionable information, allowing problems to be identified
and corrected as quickly as possible. It is expected that QA, IT, and Support health monitoring
systems and staff will have access to these probes and will access them multiple times throughout
the day.


## Details

There are three well-defined probe routes for each service and any number of custom or special
purpose routes available. Discussion of the function of each route is found in the Use Cases
section of this document.

The three well-defined probe routes are:

`./probes`

`./probes/top`

`./probes/bottom`

Information returned from the probes that return a body may be cached by the client, the server, or
both. If implementors decide to cache on the server please note these probes are be designed to be
accessed, via HTTP GET), several times per hour. The cache time needs to be balanced against the
purpose of the probes which is to alert IT systems and staff of problems before customers and
customer support staff experience the problem. The means and length of time probe results are cached
are at the implementor's discretion. The date and time field in the probe resource, called `When`,
will tell readers when the probe was last executed and, with a bit of simple math, how long the
results have been cached.

Custom probes will be executed on demand by IT, QA, and Support staff and should not be used by
frequent running software as they may strain the API and have a negative impact on users and
systems.

Implementors may instruct clients to cache results for a certain period of time, in this example 5
minutes, using HTTP/1.1 `Cache-Control`.

    Cache-Control: public, max-age=300

Implementors may also include an HTTP/1.0 `Expires` header (not shown). To further decrease unwanted
volume or strain implementors may wish protect probe routes by traditional DDOS mitigation measures
including white listing.


## Definition of Terms

-   **Code:** Software facing value that uniquely identifies the probe. If `Code` is not populated, `Name` must be.
-   **Description:** Human facing text that describes the purpose of the probe and the purpose of the activity or function being probed.
-   **HttpStatusCode:** Human and Software facing value populated in the returned body of an HTTP GET for all probes except the top probe. Values in the **200s** are successful, values in the **400s** and **500s** indicate something is wrong. If `HttpStatusCode` is populated, `When` must also be populated.
-   **Name:** Human facing value that uniquely identifies the probe. If `Name` is not populated, `Description` must be.
-   **Remarks:** Human facing text, populated when there is a failure or warning. The text should give the human user some idea of where and why the failure or warning is occurring and what can be done to correct the problem.
-   **Self:** URL identifying the probe that was executed. It is always required.
-   **When:** Date and time of probe execution. If `When` is populated, `HttpStatusCode` must be.


## Use Cases


### ./probes/top

This probe must be a light weight fast, running indicator of API availability; think of it like
a **ping**. It must do as little as possible yet still be able to announce that the API is up and
running. It is expected this probe will be called one or more times per minute. Calling applications
are required to check the HTTP Status Code and interpret it as pass **200 - 299** or fail **400 - 599**.
A body must not be returned to the caller.

1.  Version 1.0

    > Not supported.

2.  Version 1.5

    > Required for ECi implementations.
    >
    > Recommended for Seller implementations.

    Checking the HTTP Status Code for the top probe:

        curl -sw "%{http_code}\\n" http://some-host/some-api/probes/top

3.  Version 2.0

    > TBD


### ./probes/bottom

The bottom probe should test all of the layers of the API or application and all vital connections
to other systems, APIs, databases, etc. IT, QA, and Support staff and their applications must be
able to execute this modest impact probe by an HTTP GET. This probe will be called several times per
hour by automated systems and on demand by staff.

Implementors are required to return a valid, meaningful HTTP Status Code.

Calling applications are required to check the HTTP Status Code. Calling applications are also
required to read and obey HTTP/1.1 `Cache-Control` headers.

A body is optional. When a body is provided it must contain an array of one or more probe objects,
each of which will contain its own HTTP Status Code. If the array contains a single object the HTTP
Status Code must match the value returned by the HTTP GET.

The bottom probe's `Code` value must be `bottom`.

1.  Version 1.0

    > Not supported.

2.  Version 1.5

    > Required for ECi implementations.
    >
    > Recommended for Seller implementations.

    1.  JSON

            [
              {
                "Code" :"bottom",
                "Name": "Bottom Probe",
                "Description":"Ensures the API can reach all of the systems, databases, files, and other resources required to operate normally.",
                "Remarks":"The database cannot be contacted. Ensure the database is running and network reachable.",
                "Self": "https://some-host/some-api/probes/bottom",
                "HttpStatusCode": 500,
                "When": "2018-04-23T18:25:40.611Z"
              }
            ]

    2.  XML

            <Items>
              <Probe>
                <Code>bottom</Code>
                <Name>Bottom Probe</Name>
                <Description>The database cannot be contacted. Ensure the database is running and network reachable.</Description>
                <Remarks>The database cannot be contacted. Ensure the database is running and network reachable.</Remarks>
                <Self>https://some-host/some-api/probes/bottom</Self>
                <HttpStatusCode>500</HttpStatusCode>
                <When>2018-04-23T18:25:40.611Z</When>
              </Probe>
            </Items>

3.  Version 2.0

    > TBD


### ./probes

In addition to top and bottom probes, implementors may choose to support additional probes that can
provide useful information to QA, IT, and Support staff. The purpose of this route is to enumerate
all of the probes supported by the API, including top and bottom. IT, QA, and Support staff and
their applications will will expect the a list of probes they can execute. Each probe provides a
unique URL, called `Self`. Users and applications will execute the probe my means of an HTTP GET.

Custom probes should be run on demand by staff and should not be routinely executed by automated
systems and applications.

1.  Version 1.0

    > Not supported.

2.  Version 1.5

    > Optional.

    1.  JSON

            [
              {
                "Self": "https://some-host/some-api/probes/top",
                "Code": "top",
                "Name": "Top Probe"
              },
              {
                "Self": "https://some-host/some-api/probes/bottom",
                "Code" :"bottom",
                "Name": "Bottom Probe",
                "Description":"The database cannot be contacted. Ensure the database is running and network reachable."
              },
              {
                "Self": "https://some-host/some-api/probes/auth",
                "Code" :"auth"
              },
              {
                "Self": "https://some-host/some-api/probes/con-db",
                "Code": "con-db",
                "Name": "database connection test"
              }
            ]

    2.  XML

            <Items>
              <Probe>
                <Code>top</Code>
                <Name>Top Probe</Name>
                <Self>https://some-host/some-api/probes/top</Self>
              </Probe>
              <Probe>
                <Code>bottom</Code>
                <Name>Bottom Probe</Name>
                <Description>The database cannot be contacted. Ensure the database is running and network reachable.</Description>
                <Self>https://some-host/some-api/probes/bottom</Self>
              </Probe>
              <Probe>
                <Code>auth</Code>
                <Self>https://some-host/some-api/probes/auth</Self>
              </Probe>
              <Probe>
                <Code>db</Code>
                <Name>database connection test</Name>
                <Self>https://some-host/some-api/probes/con-db</Self>
              </Probe>
            </Items>

3.  Version 2.0

    > TBD


## Resource Schema


### Version 1.0

> Not supported.


### Version 1.5

1.  JSON

        {
          "id": "./vnd.eci.stg.probe.1.5.0.json",
          "$schema": "http://json-schema.org/draft-08/schema#",
          "title": "Probe",
          "description": "Defines the location and description of a probe. Upon execution ( HTTP GET ) defines the state of the probe.",
          "type": "array",
          "items": {
            "type": "object",
            "additionalProperties": false,
            "required": ["Self"],
            "anyOf": [{"required": ["Code"]},
                      {"required": ["Name"]}],
            "dependencies": {
              "httpStatusCode": { "required": [ "When" ]},
              "when": { "required": [ "HttpStatusCode" ]}
            },

            "properties" : {
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

              "Remarks": {
                "description": "details of the error that may help users solve the problem",
                "type": "string",
                "minLength": 1,
                "maxLength" : 256
              },

              "Self": {
                "description": "system function identifying a unique system owned resource as a URL",
                "type": "string",
                "minLength": 1,
                "maxLength": 1024
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
              <xs:sequence minOccurs='1' maxOccurs='500'>
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
              <xs:element name='Code'           type='xs:string'   minOccurs='0' maxOccurs='1' />
              <xs:element name='Name'           type='xs:string'   minOccurs='0' maxOccurs='1' />
              <xs:element name='Description'    type='xs:string'   minOccurs='0' maxOccurs='1' />
              <xs:element name='Remarks'        type='xs:string'   minOccurs='0' maxOccurs='1' />
              <xs:element name='Self'           type='xs:string'   minOccurs='0' maxOccurs='1' />
              <xs:element name='HttpStatusCode' type='xs:integer'  minOccurs='0' maxOccurs='1' />
              <xs:element name='When'           type='xs:dateTime' minOccurs='0' maxOccurs='1' />
            </xs:sequence>
          </xs:complexType>
        </xs:schema>


### Version 2.0

> TBD


## Test Results

    ../test-json.sh 2>&1
    ../test-xml.sh 2>&1
    xmllint --noout --schema ../rsrc-schema/src/vnd.eci.stg.probe.1.5.0.xsd ../rsrc-schema/tst/vnd.eci.stg.probe.1.5.0*.xml

    find: ./rsrc-schema/tst: No such file or directory
    find: ./rsrc-schema/src: No such file or directory
    find: ./rsrc-schema/src: No such file or directory
    find: ./rsrc-schema/tst: No such file or directory


### © 2018 ECi Software Solutions, Inc. All rights reserved.
