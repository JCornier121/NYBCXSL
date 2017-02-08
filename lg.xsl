<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <xsl:call-template name="files"/>
        <xsl:call-template name="list"/>
    </xsl:template>
<xsl:output method="xml" indent="yes"/>
    <xsl:preserve-space elements="*"/>
    <xsl:template name="list">
        <xsl:result-document href="sftp://nybloodcenter:PqqzwyCS@sftpnybloodcenter.learn.taleo.net/upload/AllUsers/EElist.xml">
                <collection>
                    <xsl:for-each select="Directory/EE">
                    <xsl:element name="doc">
                        <xsl:attribute name="href">
                            <xsl:value-of select="@id"/>
                            <xsl:text>.xml</xsl:text>
                        </xsl:attribute>
                    </xsl:element>
                    </xsl:for-each>
                </collection>
            </xsl:result-document>
            <xsl:apply-templates/>
        
        
    </xsl:template>
    <xsl:template name="files">
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