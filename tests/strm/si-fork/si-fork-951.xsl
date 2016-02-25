<xsl:transform version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:err="http://www.w3.org/2005/xqt-errors"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs err">
    
  <!-- Non-streamable fork/for-each-group: current-group() used repeatedly -->
  
  <xsl:template name="xsl:initial-template">
    <xsl:stream href="../docs/books.xml">
      <out>
          <xsl:fork>
            <xsl:for-each-group select="/BOOKLIST/BOOKS/ITEM" group-by="@CAT">
              <in a="{count(current-group())}" b="{avg(current-group()/PRICE)}"/>
            </xsl:for-each-group>
          </xsl:fork>
      </out>  
    </xsl:stream>
  </xsl:template>
  
  
</xsl:transform>  