<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    <xsl:template match="/">

        <xsl:for-each select="Directory/EE">
            <xsl:result-document href="sftp://nybloodcenter:PqqzwyCS@sftpnybloodcenter.learn.taleo.net/upload/AllUsers/{./@id}.xml">
    <userinfo>
                <xsl:copy-of select="."/>
    </userinfo>
</xsl:result-document>
            <xsl:apply-templates/>
        </xsl:for-each>

    </xsl:template>
    
</xsl:stylesheet>