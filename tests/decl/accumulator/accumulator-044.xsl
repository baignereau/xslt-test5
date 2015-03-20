<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:x="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs x"
>
    <xsl:mode on-no-match="shallow-copy"/>
	
    <!-- Remember the Title of a Document
	    Consider an XHTML document in which the title of the document is represented by the content of the first title element appearing as a child of the head element,
	    which in turn appears as a child of the html element. Suppose that we want to process the document in streaming mode,
	    and that we want to avoid outputting the content of the h1 element if it is the same as the document title.

		This can be achieved by remembering the value of the title in an accumulator variable. -->
	<xsl:accumulator name="firstTitle" as="xs:string?" initial-value="()" streamable="yes" >
    	<xsl:accumulator-rule match="/x:html/x:head/x:title[1]/text()" select="string(.)"/>
	</xsl:accumulator>

	<!-- Subsequently, while processing an h1 element appearing later in the document, the value can be referenced: -->
	<xsl:template match="x:h1">
  		<xsl:variable name="firstTitle" select="accumulator-before('firstTitle')"/>
  		<xsl:variable name="thisTitle" select="string(.)"/>
    	<xsl:if test="$thisTitle ne $firstTitle">
	    	<x:div class="heading-1"><xsl:value-of select="$thisTitle"/></x:div>
	    </xsl:if>
    </xsl:template>
	
</xsl:stylesheet>
