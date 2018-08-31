

# Non-technical Overview


## TODO


# Sequence of Events

![img](../images/shipmethod-sequence.puml.png)

In the following section, Use Cases, examples of data ( `--data` ) to be sent and
received will be shown. It is assumed that the caller will make the actual *POST*
call with the required headers e.g.

    curl --request GET \
         --header "Accepts: application/vnd.eci.stg.shipmethod.1.5.0.xml; charset=utf-8" \
         --user user123:password123 \
         --url http://vendor-host/vendor-shipmethod-endpoint


# Versions


## Version 1.0


### TODO


## Version 1.5


### TODO


## Version 2.0


### TODO


# Use Cases


## TODO

Version 1.0


### Request

In this example a buyer is

1.  JSON

        {}

2.  XML

        <?xml version='1.0' encoding='utf-8'?>
        <shipmethod/>


### Response

The seller's response is intended to

1.  JSON

        {}

2.  XML

        <?xml version='1.0' encoding='utf-8'?>
        <shipmethod/>


# Resource Schemas


## Version 1.0

No longer published


## Version 1.5


### JSON


### XML


## Version 2.0


### JSON


### XML


# Testing

    ../test-json.sh 2>&1
    ../test-xml.sh 2>&1
    xmllint --noout --schema ../rsrc-schema/src/vnd.eci.stg.shipmethod.1.5.0.xsd ../rsrc-schema/tst/vnd.eci.stg.shipmethod.1.5.0*.xml