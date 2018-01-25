# Demonstration client for OAI-PMH metadata provider

Demonstration OAI-PHM data provider application using the fccn/oai-pmh-core library

## About

This project presents an example of a client for the OAI-PMH 2.0 Data Provider using the [oai-pmh-core project](https://github.com/fccn/oai-pmh-core) for core functionalities.

This implementation completely complies to OAI-PMH 2.0, including the support of on-the-fly output compression which may significantly reduce the amount of data being transfered.

The implementation also provides a xsl transform to convert OAI 2.0 responses into XHTML, developed by Christopher Gutteridge of the University of Southampton.   

## Structure
The project has the following structure:

* **app.ini.dist**: Sample configuration file with information for setting up the client.
* **lib/**: place additional libs for the client here
* **html/**: web content
  * **index.php**: entry page for the service
  * **info.php**: information page about the service
  * **base.xsl**: xsl transform for presenting the xml responses in a browser
* **db/**: sample databases for testing
  * **demo_db.sql**: MySQL database dump with a test data collection

## Installation and configuration

- Download the contents of this project in a location accessible by your webserver. The directory structure should be preserved.
- Setup the webserver to point the document root to the html folder.
- Copy ```app.ini.dist``` to ```app.ini``` and edit the newly created file. The file already contains an example configuration prepared for the test data collection in ```db/demo_db.sql```. You will need to customize the configuration to adapt the client for your needs (see Customizing the configuration file).
- Allow your webserver to write to the token directory (defined on app.ini in *token.path* property). You can leave the default token directory */tmp* which does not require any attention.
- On the project root run ```composer install``` to install the required project dependencies.
- If you want to run the demo client with no additional configurations you can load the dump file provided in ```db/demo_db.sql``` to a MySQL database. You only need to add to the ```app.ini``` configuration file the information about the database connection:
```
[pdo]
...
kind = ;the database kind (i.e "mysql")
host = ;database host
user = ;the database user
pass = ;the database pass for the user
dbname = ;name of the database
...
```

### Customizing the configuration file

The following instructions show how to customize the ```app.ini``` file to your needs. The sample ```app.ini``` file contains all the properties used by the project and most of the properties are commented. You can check the file to learn more about the client configuration.

- First you need to determine the kinds of elements your client provides. In the demo example we provide two kinds of elements: *videoclip* and *'channel'*. The configuration for this is done in the sets[] properties in the ```app.ini``` file:
```
sets[] = "setSpec=<identifier>&setName=<Friendly Name>"
;add as many sets as necessary using the "setSpec=<>&setName=<>" format
sets[] = ...
```
The identifiers defined in ```setSpec``` are important and will be used to name the properties where the SQL queries are defined (see Fetch queries).
- The database connection is configured using the following properties under the ```[pdo]``` group:
 ```
 [pdo]
 ...
 kind = ;the database kind (i.e "mysql")
 host = ;database host
 user = ;the database user
 pass = ;the database pass for the user
 dbname = ;name of the database
 charset = ; database charset (i.e, "utf8")
 dsn = ; the pdo connection string (i.e, for mysql databases "${pdo.kind}:host=${pdo.host},dbname=${pdo.dbname},${pdo.kind}:charset=${pdo.charset}"
 ...
 ```
You can reuse the ```dsn``` string from the sample configuration file when using a MySQL database. it might need to be modified when using a different kind of database.
- The remaining configurations under the ```[pdo]``` group determine how the data is collected from the database. You need to create your own queries to collect data for each of the supported metadata formats (DublinCore and Learning Object Metadata). You can check the queries in ```app.ini.dist``` for comparison.
There are two groups of queries to create: *list queries* and *fetch queries*.
 - **List queries** provide a summarized list of the elements. The SQL queries are defined under properties named using the format ```<metadata_kind>.listAll``` (*i.e, oai_dc.listAll is the name for the configuration where the SQL query to provide the summarized list of DublinCore elements is defined*). The SQL queries must provide the following structure:
 ```
 oai_id | deleted | datestamp | oai_set
 ```
   - You can customize the names in the structure in the following configurations:
  ```
  [pdo]
  ...
  identifier = ; (default: "oai_id")
  setspec = ; (default: "oai_set")
  datestamp = ; (default: "datestamp")
  delspec = ; (default: "deleted")
  ...
  ```
 - **Fetch queries** provide information about an individual element. The SQL queries are defined under properties named using the format ```<metadata_kind>.<set_name>.fetch``` (*i.e oai_dc.videoclip.fetch is the name for the configuration where the SQL query to fetch DublinCore data for an element of the videoclip set is defined*). The SQL queries must provide the following structure:
   ```
  	identifier | contributor | coverage | creator | date_ | description | format_ | language | publisher | relation | rights | source | subject | title | type_
   ```
    - You also need to define the identifier for each set using the ```<metadata_kind>.<set_name>.identifier``` properties (*i.e, oai_dc.videoclip.identifier defines the identifier for the DublinCore elements of videoclip set*).
    - The PDO Source plugin allows SQL queries to fallback to a default metadata kind if no specific query or identifier for a metadata kind is defined in the configuration. The default metadata kind is defined in:
    ```
    [pdo]
    ...
    oai_default = ; (default: "oai_dc")
    ...
    ```

## Usage

After installation you can visit [your-oai-pmh-client-url]/info.php to get information on all the possible interactions with the client.

If the repository is accessible from the outside you can test it in the [OAI Repository Explorer](http://re.cs.uct.ac.za/)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/fccn/oai-pmh-core/tags).

### v1.0
- initial working version

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
