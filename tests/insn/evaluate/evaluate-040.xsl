<?xml version="1.0" encoding="UTF-8"?>

<!-- Same as evaluate-039 but using @with-params -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ev40="http://example.com/evaluate040" version="3.0"
exclude-result-prefixes="xs ev40">

  <xsl:import-schema>
    <xs:schema targetNamespace="http://example.com/evaluate040">
      <xs:simpleType name="restrictedDate">
        <xs:restriction base="xs:date">
          <xs:minInclusive value="2009-01-01"/>
        </xs:restriction>
      </xs:simpleType>
    </xs:schema>
  </xsl:import-schema>
  
  <xsl:param name="path1">concat(static-base-uri(), "#", $v)</xsl:param>
  <xsl:param name="path2">concat(static-base-uri(), "?", $v)</xsl:param>
  
  <xsl:template match="/" name="main">
    <Result>
      <xsl:for-each select="1 to 100000">
        <xsl:variable name="r" as="xs:string">
          <xsl:evaluate xpath="if (position() mod 7 = 0) then $path1 else $path2"
                        base-uri="{if (position() mod 2 = 0) then 'http://www.w3.org/' else 'http://example.com/'}"
                        schema-aware="{if (position() mod 3 = 0) then ' true ' else 'false'}"
                        with-params="map{xs:QName('v'): position() mod 5}"/>
        </xsl:variable>
        <xsl:if test="position() ge 90 and position() lt 100">
            <out><xsl:value-of select="$r"/></out>
        </xsl:if>
      </xsl:for-each>
    </Result>
  </xsl:template>
  
</xsl:stylesheet> 
