<?xml version="1.0"?>
<?spec xslt#sorting?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <!-- FileName: SORT38 -->
  <!-- Document: http://www.w3.org/TR/xslt -->
  <!-- DocVersion: 19991116 -->
  <!-- Section: 10 -->
    <!-- Purpose: Numeric sort, but no items are true numbers. -->

<xsl:template match="doc">
  <out>
    Ascending order....
    <xsl:for-each select="t">
      <xsl:sort data-type="number"/>
      <xsl:value-of select="."/><xsl:text>|</xsl:text>
    </xsl:for-each>
  </out>
</xsl:template>

</xsl:stylesheet>
