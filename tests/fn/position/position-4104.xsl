<?xml version="1.0"?> 
<?spec fo#func-position?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <!-- Purpose: Exercise potential optimization when position() appears in a predicate using the descendant axis. -->

  <xsl:output method="xml" indent="no" encoding="UTF-8"/>

  <xsl:template match="doc">
    <out>
      <xsl:apply-templates select="*"/>
    </out>
  </xsl:template>

  <xsl:template match="doc/descendant::*[position() mod 2 = 0]">
    <even/>
  </xsl:template>

  <xsl:template match="doc/descendant::*[position() mod 2 = 1]">
    <odd/>
  </xsl:template>

</xsl:stylesheet>
