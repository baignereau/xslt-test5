<?xml version="1.0" encoding="UTF-8"?>
<!--It is a type error if, when
                        validating a document node, document-level constraints (such as ID/IDREF constraints) are not satisfied.
                        
                        These constraints include identity constraints (xs:unique,
                           xs:key, and xs:keyref) and ID/IDREF
                        constraints.-->

<!-- MHK 2018-09-26: the above is incorrect. xs:unique/key/keyref are not document-level constraints, and they do not result in the 1555 error code -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:my="http://my.com/"
                version="2.0">

<?error XTTE1555?>

  <xsl:import-schema namespace="http://err1555b.com/">
      <xs:schema targetNamespace="http://err1555b.com/">
         <xs:element name="e">
            <xs:complexType>
               <xs:sequence maxOccurs="unbounded">
                  <xs:element name="f" form="qualified">
                     <xs:complexType>
                        <xs:sequence/>
                        <xs:attribute name="id" type="xs:int" use="optional"/>
                        <xs:attribute name="idref" type="xs:int" use="optional"/>
                     </xs:complexType>
                  </xs:element>
               </xs:sequence> 
            </xs:complexType>
            <xs:unique xmlns:b="http://err1555b.com/" name="u1">
               <xs:selector xpath="b:f"/>
               <xs:field xpath="@id"/>
            </xs:unique>
         </xs:element>
      </xs:schema>
  </xsl:import-schema>


  <xsl:template name="main">
      <xsl:result-document validation="strict">
         <e xmlns="http://err1555b.com/">
            <f id="456"/>
            <f id="456"/>
         </e>
      </xsl:result-document>
  </xsl:template>
  




</xsl:stylesheet>
