<xsl:stylesheet version="3.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="map xs">
    
    <xsl:variable name="RUN" select="true()" static="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="insertion" as="element()*">
      <a>A</a>
      <b>B</b>
    </xsl:variable>
    
    <!-- Streaming comma operator: grounded operand -->
    
    <xsl:template name="r-001" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(data(/BOOKLIST/BOOKS/ITEM/PRICE), $insertion)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: grounded operand -->
    
    <xsl:template name="r-002" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(copy-of(/BOOKLIST/BOOKS/ITEM/PRICE), $insertion)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: grounded atomic operand -->
    
    <xsl:template name="r-003" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="/BOOKLIST/BOOKS/ITEM/DIMENSIONS ! (tokenize(., ' '), $insertion)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, inspection usage -->
    
    <xsl:template name="r-010" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="count((/BOOKLIST/BOOKS/ITEM/PRICE, $insertion))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, absorption usage -->
    
    <xsl:template name="r-011" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="sum((/BOOKLIST/BOOKS/ITEM/PRICE, $insertion))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, transmission usage -->
    
    <xsl:template name="r-012" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM/PRICE, $insertion)[position() mod 2 = 0]"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, focus-setting usage -->
    
    <xsl:template name="r-013" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM/PRICE, $insertion) ! (.+1)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, focus-controlled usage -->
    
    <!-- Saxon 26 Nov 2013. Failing. A for-each that returns streamed nodes
         can't currently be handled by a ComposingWatch. Need to generalize
         TransmissionAdjunct -->
    
    <xsl:template name="r-014" use-when="true() or $RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="/BOOKLIST/BOOKS/ITEM[1] ! (*, $insertion)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, focus-setting usage -->
    
    <xsl:template name="r-015" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:for-each select="(/BOOKLIST/BOOKS/ITEM/PRICE, $insertion)">
            <xsl:value-of select=".+1 || ' '"/>
          </xsl:for-each>  
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, focus-controlled usage -->
    
    <xsl:template name="r-016" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:for-each select="/BOOKLIST/BOOKS/ITEM[1]">
            <xsl:copy-of select="(*, $insertion)"/>
          </xsl:for-each>  
        </out>
      </xsl:stream>
    </xsl:template>    
    
    <!-- Streaming comma operator: striding operand, focus-setting usage for inspection action -->
    
    <xsl:template name="r-017" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM[1]/*, $insertion) ! contains(name(), 'E')"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: striding operand, apply-templates usage -->
    
    <xsl:template name="r-018" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:apply-templates select="(/BOOKLIST/BOOKS/ITEM[1]/*, $insertion)" mode="r-018-mode"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <xsl:mode name="r-018-mode" streamable="yes" on-no-match="deep-skip"/>
    <xsl:template match="ITEM/*" mode="r-018-mode"><xsl:value-of select="."/></xsl:template>
    
    <!-- Streaming comma operator: crawling operand, inspection usage -->
    
    <xsl:template name="r-020" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="count((//PRICE, $insertion))"/>
        </out>
      </xsl:stream>
    </xsl:template> 
    
    <!-- Streaming comma operator: crawling operand, absorption usage -->
    
    <xsl:template name="r-021" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="count((/BOOKLIST/BOOKS/ITEM[1]//text(), $insertion))"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: crawling operand, transmission usage -->
    
    <xsl:template name="r-022" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(/BOOKLIST/BOOKS/ITEM[1]//text(), $insertion)[position() lt 4]"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: crawling operand, focus-setting usage -->
    
    <xsl:template name="r-023" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(//PRICE/text(), $insertion) ! (.+1)"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: climbing operand, inspection usage -->
    
    <xsl:template name="r-030" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(/BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::*, $insertion) ! name()"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: climbing operand, inspection usage, removal of duplicates -->
    
    <xsl:template name="r-031" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:copy-of select="(/BOOKLIST/BOOKS/ITEM/PRICE/ancestor::*, $insertion) ! name()"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: climbing operand, absorption usage -->
    
    <xsl:template name="r-032" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM[1]/PRICE/ancestor::*/@*, $insertion)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: climbing operand, absorption usage -->
    
    <xsl:template name="r-033" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM/ancestor-or-self::*/@CAT, $insertion)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: climbing operand, absorption usage, removal of duplicates -->
    
    <xsl:template name="r-034" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(/BOOKLIST/BOOKS/ITEM/PRICE/ancestor-or-self::*/@CAT, $insertion)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>
    
    <!-- Streaming comma operator: climbing operand, absorption usage, removal of duplicates -->
    
    <xsl:template name="r-035" use-when="$RUN">
      <xsl:stream href="../docs/books.xml">
        <out>
          <xsl:value-of select="(//PRICE/ancestor-or-self::*/@*, $insertion)" separator="|"/>
        </out>
      </xsl:stream>
    </xsl:template>               
    
</xsl:stylesheet>