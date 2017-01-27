<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
	<xsl:variable name="Dir" select="document('SUPuserdir.xml')/Directory/EE"/>
    <xsl:attribute-set name="user_info">
        <xsl:attribute name="Nameid"><xsl:value-of select="Username"/><xsl:text> - </xsl:text><xsl:value-of select="Last_Name"/><xsl:text>, </xsl:text><xsl:value-of select="First_Name"/></xsl:attribute>
        <xsl:attribute name="Name"><xsl:value-of select="Last_Name"/><xsl:text>, </xsl:text><xsl:value-of select="First_Name"/></xsl:attribute>
        <xsl:attribute name="id" select="Username"/>
        <xsl:attribute name="First_Name" select="First_Name"/>
        <xsl:attribute name="Last_Name" select="Last_Name"></xsl:attribute>
        <xsl:attribute name="Email" select="Email"></xsl:attribute>
        <xsl:attribute name="Job_Title" select="Job_Title"></xsl:attribute>
        <xsl:attribute name="Department" select="Department"></xsl:attribute>
        <xsl:attribute name="Location" select="Location"></xsl:attribute>
        <xsl:attribute name="Supervisor_ID" select="Supervisor_ID"></xsl:attribute>
        <xsl:attribute name="Division" select="Division"></xsl:attribute>
        <xsl:attribute name="Hire_Date" select="Hire_Date"></xsl:attribute>
        <xsl:attribute name="GxP" select="GxP"></xsl:attribute>
		<xsl:attribute name="MGMT" select="MGMT"></xsl:attribute>
        <xsl:attribute name="Per_Diem_Part_Time" select="Per_Diem_Part_Time"></xsl:attribute>
        <xsl:attribute name="esid" select="ESID"></xsl:attribute>
		<xsl:attribute name="NetworkID" select="NetworkID"></xsl:attribute>
		<xsl:attribute name="Tech" select="Tech_Field"></xsl:attribute>
		<xsl:attribute name="Supervisor_Name" select="$Dir[@id=(current()/Supervisor_ID)]/@Name"></xsl:attribute>
    </xsl:attribute-set>

    <xsl:template match="/">
        <xsl:result-document href="userdir.xml">
            <xsl:element name="Directory">
                <xsl:for-each select="root/row">
                    <xsl:element name="EE" use-attribute-sets="user_info"/>
                </xsl:for-each>
            </xsl:element>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>