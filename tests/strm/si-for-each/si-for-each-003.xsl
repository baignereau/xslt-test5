<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes=" xs"
    version="3.0">
   
  <!-- within xsl:stream, use xsl:for-each with positional selection -->
   
  <xsl:template name="main">
    <out>
      <xsl:stream href="../docs/transactions.xml">
        <xsl:for-each select="account/transaction[position() &lt; 5]">
          <transaction nr="{position()}">
            <xsl:copy-of select="@*"/>
          </transaction>
        </xsl:for-each>
      </xsl:stream>
    </out>
  </xsl:template> 

       
</xsl:transform>

