<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <!-- error: xsl:call-template clears current-merge-group() -->
    <xsl:template match="/">
            <events>
                <xsl:merge>
                    <xsl:merge-source select="doc('log-file-1.xml')/events/event">
                            <xsl:merge-key select="@timestamp"/>
                    </xsl:merge-source>
                    <xsl:merge-action>
                        <xsl:call-template name="cmg"/>
                    </xsl:merge-action>
                </xsl:merge>
            </events> 
    </xsl:template>
    
    <xsl:template name="cmg">
        <xsl:copy-of select="current-merge-group()"/>
    </xsl:template>
</xsl:stylesheet>