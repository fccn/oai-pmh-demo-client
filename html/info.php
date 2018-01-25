<?php

/**
* MIT License
*
* Copyright (c) 2018 FCT | FCCN - Computação Científica Nacional
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in all
* copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*/

/**
 * \file
 * \brief
 * Information page of client OAI Data Provider.
 * Provides a summary of the OAI-PMH Client
 *
*/

$MY_URI = 'http://'.$_SERVER['SERVER_NAME'].$_SERVER['SCRIPT_NAME'];
$pos = strrpos($MY_URI, '/');
$MY_URI = substr($MY_URI, 0, $pos). '/index.php';

?>
<html>
<head>
<title>OAI-PMH Metadata Provider</title>
</head>
<body>

	<h3>OAI-PMH Metadata Provider - Client</h3>
	<p>
	  This is an implementation of an <a href="http://www.openarchives.org/OAI/openarchivesprotocol.html" target="_blank">OAI-PMH 2.0 Data Provider</a>, written in <a href="http://www.php.net" title="PHP's website" target="_blank">PHP</a> and has been tested with version 5.5.
	  It completely complies to <a href="http://www.openarchives.org/OAI/openarchivesprotocol.html" target="_blank">OAI-PMH 2.0</a>, including the support of on-the-fly output compression which may significantly
	  reduce the amount of data being transfered.
	</p>

	<p> Currently, the metadata can be obtained from following sources:</p>
	<ul>
	  <li>
	    PHP Data Objects (PDO) included in the PHP distribution:
	    allows almost any popular SQL-database to be used without any change in the code.
	    Only thing need to do is to configure	database connection and define a suitable data
	    structure in the client configuration file.
	  </li>
	</ul>
	<p>
	  For requirements and instructions to install and configure, please reference <a href="https://github.com/fccn/oai-pmh-demo-client/blob/master/README.md">the project's README file</a>.
	</p>

	<p>
	<dl>
		<dt>The following actions are possible for this provider</dt>
			<dd><a href="<?php echo $MY_URI; ?>?verb=Identify">Identify</a></dd>
			<dd><a href="<?php echo $MY_URI; ?>?verb=ListMetadataFormats">ListMetadataFormats</a></dd>
			<dd><a href="<?php echo $MY_URI; ?>?verb=ListSets">ListSets</a></dd>
			<dd><a href="<?php echo $MY_URI; ?>?verb=ListIdentifiers&amp;metadataPrefix=oai_dc">ListIdentifiers</a></dd>
			<dd><a href="<?php echo $MY_URI; ?>?verb=ListRecords&amp;metadataPrefix=oai_dc">ListRecords</a></dd>
			<dd><a href="<?php echo $MY_URI; ?>?verb=GetRecord&amp;metadataPrefix=oai_dc&amp;identifier=8b1fcb90-872d-4d7d-a745-fbc37d4561b8">GetRecord</a></dd>
		</dt>
	</dl>
	</p>

	<p>
		For other tests on your own provider or other providers, please use the <a href="http://re.cs.uct.ac.za/" title="OAI Repository Explorer" target="_blank">Repository Explorer</a>.
	</p>
	<br />
		FCT|FCCN <?= date('Y') ?>
	<br />
</body>
</html>
