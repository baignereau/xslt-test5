<?xml version="1.0" encoding="UTF-8"?>
<!--In general, a circularity in a stylesheet is a non-recoverable dynamic error.-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

<!-- Test circular reference through anonymous function XPDE0640-->
 
  <xsl:variable name="circular">
    <xsl:sequence select="$other()" />
  </xsl:variable>
  
  <xsl:variable name="other" as="function(*)">
    <xsl:sequence select="function(){$circular}" />
  </xsl:variable>

  <xsl:template name="xsl:initial-template">
      <out wrong="{$circular}"/>
  </xsl:template>
   
</xsl:stylesheet>

