<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:param name="istylesheet" as="xs:string"/>
    <xsl:param name="stylesheet" select="document($istylesheet)"/>
    <xsl:variable name="idname"> <xsl:value-of select="concat(@id, @Last_Name)"/> </xsl:variable>
    <xsl:template match="/">
        
        <xsl:call-template name="look"/>
    </xsl:template>
    
    <xsl:template match="EE">
        <xsl:variable name="idname">
            <xsl:value-of select="concat(@id, @Last_Name)"/>
        </xsl:variable>
        <xsl:for-each select=".">
            <xsl:result-document href="{@id}.xml">
                <xsl:value-of select="*"/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="look">
        <xsl:variable name="idname"> <xsl:value-of select="concat(@id, @Last_Name)"/> </xsl:variable>
        <xsl:variable name="idx">
            <xsl:for-each select="EE">
                <xsl:value-of select="'@id'"></xsl:value-of>
            </xsl:for-each>
        </xsl:variable>
            <xsl:result-document href="/output/{$istylesheet}">
                <xsl:element name="collection">
                    <xsl:for-each select="Directory/EE">
                        <xsl:element name="doc">
                            <xsl:attribute name="href" select="$idx"/>
                        </xsl:element>
                    </xsl:for-each>
                </xsl:element>
                <xsl:copy-of select="$stylesheet"/>
                <xsl:apply-templates/>
            </xsl:result-document>
        
        
    </xsl:template>
</xsl:stylesheet>