# Product Catalog

This is an extended version of the sample project developed in the book [Anwendungsentwicklung auf der SAP Cloud Platform](https://www.rheinwerk-verlag.de/anwendungsentwicklung-auf-der-sap-cloud-platform-das-sap-cloud-application-programming-model/) (in German).


## DISCLAIMER
This project does not represent a productive application. This sample code can change at any time without prior notice. See [License](./LICENSE).

## What's more ...
This project shows some features which are not in the sample of my book:
+ Fiori draft handling. To support this, key fields of entities must be of type ``UUID``. **Note**: Fiori draft for OData v4 might still not be released for productive use. Check back with your SAP contact of trust ...
+ CAP configuration in [package.json](/package.json) makes use of the configuration profiles ``development`` and ``production``. Choose between these two by setting the environment variable NODE_ENV to the desired profile name.
+ CAP database configuration now uses ``"kind": "sql"``. This is resolved according to the active configuration profile. For ``development`` it resolves to ``sqlite``, for ``production`` it resolves to ``hana``.

## How to run locally ...

### SAP-server only
+ open a terminal and run ``npm  intall`` once and then ``cds watch``
+ services are now served at http://localhost:4004

### With UI
+ create the file ``app/default-env.json`` and fill it with the following content:
  ```json
  {
   "destinations": [
    {
      "name": "backend",
      "url": "http://localhost:4004",
      "forwardAuthToken": true
    }
   ]
  }
  ```
+ open a second terminal and change directory to the app-folder with ``cd app``
+ run ``npm install`` once
+ start the application router with ``npm start``
+ approuter will serve the UI at http://localhost:5000
