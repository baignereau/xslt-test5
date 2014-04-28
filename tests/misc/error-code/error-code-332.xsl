<?xml version="1.0"?> 

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:my="http://my.com/">

<?error XTDE1150?>
<!-- regex matches zero-length string. No longer an error in 3.0 -->


  <xsl:template name="main">
    <out>
      <xsl:analyze-string select="'bananas'" regex="[A-Z]?">
        <xsl:matching-substring/>
      </xsl:analyze-string>
    </out>
  </xsl:template>



</xsl:stylesheet>