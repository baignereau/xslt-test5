<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

 <?spec xslt#creating-attributes?>
  <!-- PURPOSE: xsl:attribute with select="x" (XSLT 2.0). -->
  <?same-as-1.0 no?>
  <xsl:attribute-set name="set1">
    <xsl:attribute name="color" select="'black'"/>
  </xsl:attribute-set>

  <xsl:template match="/">
    <out>
      <test1 xsl:use-attribute-sets="set1"></test1>
    </out>
  </xsl:template>

</xsl:stylesheet>