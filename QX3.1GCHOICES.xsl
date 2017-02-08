<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">
				<xsl:variable name="dateNow" select="current-dateTime()"/>
		<xsl:variable name="dateNow2" select="format-dateTime($dateNow, '[Y0001][M01][D01]')"/>
            <xsl:element name="questestinterop">
                <xsl:for-each select="root/row">
                    <xsl:element name="item">
                        <xsl:attribute name="ident">
                            <xsl:value-of select="X"/>
                        </xsl:attribute>
                        <xsl:element name="material">
                            <xsl:element name="mattext">
                                <xsl:value-of select="Q"/>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="response_lid">
                            <xsl:attribute name="ident">
                                <xsl:value-of select="X"/>
                            </xsl:attribute>
                            <xsl:element name="response_label">
                                <xsl:attribute name="ident">A</xsl:attribute>
                                <xsl:element name="material">
                                    <xsl:element name="mattext">
                                        <xsl:value-of select="A"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="response_label">
                                <xsl:attribute name="ident">B</xsl:attribute>
                                <xsl:element name="material">
                                    <xsl:element name="mattext">
                                        <xsl:value-of select="B"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="response_label">
                                <xsl:attribute name="ident">C</xsl:attribute>
                                <xsl:element name="material">
                                    <xsl:element name="mattext">
                                        <xsl:value-of select="C"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="response_label">
                                <xsl:attribute name="ident">D</xsl:attribute>
                                <xsl:element name="material">
                                    <xsl:element name="mattext">
                                        <xsl:value-of select="D"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="response_label">
                                <xsl:attribute name="ident">E</xsl:attribute>
                                <xsl:element name="material">
                                    <xsl:element name="mattext">
                                        <xsl:value-of select="E"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="response_label">
                                <xsl:attribute name="ident">F</xsl:attribute>
                                <xsl:element name="material">
                                    <xsl:element name="mattext">
                                        <xsl:value-of select="F"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="response_label">
                                <xsl:attribute name="ident">G</xsl:attribute>
                                <xsl:element name="material">
                                    <xsl:element name="mattext">
                                        <xsl:value-of select="G"/>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="resprocessing">
                            <xsl:element name="outcomes">
                                <xsl:element name="decvar"/>
                            </xsl:element>
                            <xsl:element name="respcondition">
                                <xsl:attribute name="title">Correct</xsl:attribute>
                                <xsl:element name="conditionvar">
                                    <xsl:element name="varequal">
                                        <xsl:attribute name="respident">
                                            <xsl:value-of select="X"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="CA"/>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="setvar">1</xsl:element>
                                <xsl:element name="displayfeedback">
                                    <xsl:attribute name="linkrefid">Correct</xsl:attribute>
                                </xsl:element>
                            </xsl:element>
                            <xsl:element name="respcondition">
                                <xsl:attribute name="title">Incorrect</xsl:attribute>
                                <xsl:element name="conditionvar">
                                    <xsl:element name="not">
                                        <xsl:element name="varequal">
                                            <xsl:attribute name="respident">
                                                <xsl:value-of select="X"/>
                                            </xsl:attribute>
                                            <xsl:value-of select="CA"/>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                                <xsl:element name="setvar">0</xsl:element>
                                <xsl:element name="displayfeedback">
                                    <xsl:attribute name="linkrefid">Incorrect</xsl:attribute>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="itemfeedback">
                            <xsl:attribute name="ident">Correct</xsl:attribute>
                            <xsl:element name="material">
                                <xsl:element name="mattext">Correct!</xsl:element>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="itemfeedback">
                            <xsl:attribute name="ident">Incorrect</xsl:attribute>
                            <xsl:element name="material">
                                <xsl:element name="mattext">Incorrect! <xsl:value-of select="FB"/></xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
    </xsl:template>
</xsl:stylesheet>
