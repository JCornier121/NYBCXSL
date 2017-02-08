<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd" version="2.0" xmlns:myns="not:important">
    <xsl:template match="/">
	<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">

    <system systemId="userdir.xml" uri="userdir.xml"/>

</catalog>
				<xsl:variable name="dateNow" select="current-dateTime()"/>
		<xsl:variable name="dateNow2" select="format-dateTime($dateNow, '[Y0001][M01][D01]')"/>
        <xsl:for-each-group select="root/row" group-by="Username">
		                <xsl:variable name="Dir" select="document('userdir.xml')/Directory/EE"/>
                <xsl:variable name="Name" select="$Dir[@id=(current()/Username)]/@Name"></xsl:variable>
                <xsl:variable name="Department" select="$Dir[@id=(current()/Username)]/@Department"></xsl:variable>
                <xsl:variable name="Job_Title" select="$Dir[@id=(current()/Username)]/@Job_Title"></xsl:variable>
            <xsl:result-document href="/c:/{$dateNow2}/{$Dir[@id=(current()/Username)]/@Department}/{$Dir[@id=(current()/Username)]/@Nameid}.html">
                <html>
                    <head>
                        <link rel="stylesheet" type="text/css" href="https://pulse.nybc.org/dept/Education/learning-plus/LMS-sops/Document%20Library/XML%20Text%20Files/AUTP.css"/>
                        <h2>Profile Report</h2>
                    <h3>for</h3></head>
                    <body>
					    <h2><xsl:value-of select="Username"/> - <xsl:value-of select="$Name"/> - <xsl:value-of select="$Department"/> - <xsl:value-of select="$Job_Title"/></h2>
                        <h6><xsl:text>This report was generated on:  </xsl:text><xsl:value-of select="current-dateTime()"/></h6>

<!--                         <h5><xsl:value-of select="count(current-group())"/>:  Current Audience</h5>
                        <h5><xsl:value-of select="count(current-group()[Mapped_Item_Completed_Date=''])"/>:  Current Incomplete</h5>
                        <h5><xsl:value-of select="count(current-group()[Mapped_Item_Completed_Date!=''])"/>:  Current Complete</h5> -->
<!--                        <h3><xsl:value-of select="distinct-values($Department)"/></h3>-->
                        <table>
                            <thead class="audience" style="bold" align="justify" valign="bottom" bgcolor="#1F54F2">
<!--                                 <td class="audience" style="bold" align="justify" valign="bottom" bgcolor="#1F54F2">Staff Name</td> -->
                                <td class="audience" style="bold" align="justify" valign="bottom" bgcolor="#1F54F2">Department</td>
<!--                                 <td class="audience" style="bold" align="justify" valign="bottom" bgcolor="#1F54F2">Job Title</td> -->
                                <td class="audience" style="bold" align="justify" bgcolor="#1F54F2" valign="bottom">Date Completed</td>
                            </thead>
                            <xsl:for-each select="current-group()">
                                <xsl:call-template name="colorstatus">
                                    <xsl:with-param name="Dir" select="$Dir"/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </table>
                        <xsl:text>This report was generated on:  </xsl:text><xsl:value-of select="current-dateTime()"/>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>
    <xsl:template name="colorstatus">
        <xsl:param name="Dir"/>
           
        <xsl:choose>
            <xsl:when test="not(string(Mapped_Item_Completed_Date))">
        <tr>
            
                        <td>
                <xsl:value-of select="Mapped_Item_Name"/>
            </td>
			 <td>

            </td>
            
<!--             <td>
                <xsl:value-of select="$Dir[@id=(current()/Username)]/@Department"/>
            </td>
            <td>
                <xsl:value-of select="$Dir[@id=(current()/Username)]/@Job_Title"/>
            </td> -->

        </tr>

            </xsl:when>
            <xsl:otherwise>
                <tr>
                    <td>
                        <xsl:value-of select="Mapped_Item_Name"/>
                    </td>
<!--                     <td>
                        <xsl:value-of select="$Dir[@id=(current()/Username)]/@Department"/>
                    </td>
                    <td>
                        <xsl:value-of select="$Dir[@id=(current()/Username)]/@Job_Title"/>
                    </td> -->
                    <td>
                        <xsl:value-of select="substring(Mapped_Item_Completed_Date, 1, 10)"/>
                    </td>
                </tr>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>

