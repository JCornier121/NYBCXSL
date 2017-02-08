<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:key name="Dept" match="EE" use="@Department"></xsl:key>
    <xsl:key name="Supervisor" match="EE" use="@Supervisor_Name"></xsl:key>
    <xsl:key name="Title" match="EE" use="concat(@Job_Title, '-', @Department)"></xsl:key>
    <xsl:param name="chain"/>
    <xsl:param name="lock"/>
    <xsl:template match="/">
        <xsl:variable name="Tr" select="document('training.xml')/root/row"/>
        <xsl:result-document href="LIST3.html">
            <html>
                <ol>
                    <li>
                        <xsl:for-each select="key($chain, $lock)">
							<p>
								<xsl:value-of select="@Nameid"/>
							</p>
							<xsl:value-of select="$Tr[Username=(current()/@id)]/Item_Name"/>
						</xsl:for-each>
					</li>
				</ol>
            </html>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
