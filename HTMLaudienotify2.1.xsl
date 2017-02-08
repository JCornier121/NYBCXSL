<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" exclude-result-prefixes="xs xd" version="2.0" xmlns:myns="not:important">
	<xsl:variable name="Dir" select="document('userdir.xml')/Directory/EE"/>
	<xsl:variable name="Name" select="$Dir[@id=(current()/Username)]/@Name"/>
	<xsl:variable name="Department" select="$Dir[@id=(current()/Username)]/@Department"/>
	<xsl:variable name="Job_Title" select="$Dir[@id=(current()/Username)]/@Job_Title"/>
	<xsl:template match="/">
		<catalog xmlns="urn:oasis:names:tc:entity:xmlns:xml:catalog">
			<system systemId="/userdir.xml" uri="userdir.xml"/>
		</catalog>
		<xsl:variable name="dateNow" select="current-dateTime()"/>
		<xsl:variable name="dateNow2" select="format-dateTime($dateNow, '[Y0001][M01][D01]')"/>
		<xsl:variable name="datetime" select="format-dateTime(current-dateTime(), '[M01][D01][Y0001][h][m]')"/>
		<xsl:for-each-group select="root/row" group-by="Mapped_Item_Name">
			<xsl:variable name="File" select="substring(Mapped_Item_Name/text(),1,85)"/>
			<xsl:result-document href="/c:/{$dateNow2}/0001CourseAudience/{$File}.html">
				<html>
					<head>
						<script src="https://pulse.nybc.org/dept/Education/learning-plus/Document%20Library/sorttable%20(1).js"></script>
						<link rel="stylesheet" type="text/css" href="https://pulse.nybc.org/dept/Education/learning-plus/LMS-sops/Document%20Library/XML%20Text%20Files/AUTP.css"/>
						<h6>
							<xsl:text>This report was generated on:</xsl:text>
							<xsl:value-of select="format-dateTime(current-dateTime(), '[MNn] [D01], [Y0001] at [h]:[m] [PN]')"/>
						</h6>
						<table class="ReportInfo">
							<tr class="ItemHead">
								<td>Audience Report for <xsl:value-of select="current-grouping-key()"/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:value-of select="count(current-group())"/>:Current Audience <xsl:value-of select="count(current-group()[not(string(Mapped_Item_Completed_Date))])"/>:Current Incomplete <xsl:value-of select="count(current-group()[string(Mapped_Item_Completed_Date)])"/>:Current Complete
								</td>
							</tr>
						</table>
						<p/>
					</head>
					<body>
						<h2>
							<xsl:value-of select="current-grouping-key()"/>
						</h2>
						<table class="sortable">
							<caption>
								<xsl:text>Click header row to sort table by any column.</xsl:text>
							</caption>
							<thead class="audience" style="bold" align="justify" valign="bottom" bgcolor="#1F54F2">
								<td class="audience" style="bold" align="justify" valign="bottom" bgcolor="#1F54F2">ID</td>
								<td class="audience" style="bold" align="justify" valign="bottom" bgcolor="#1F54F2">Name</td>
								<td class="audience" style="bold" align="justify" valign="bottom" bgcolor="#1F54F2">Department</td>
								<td class="audience" style="bold" align="justify" valign="bottom" bgcolor="#1F54F2">Job Title</td>
								<td class="audience" style="bold" align="justify" bgcolor="#1F54F2" valign="bottom">Date Completed</td>
							</thead>
							<xsl:for-each select="current-group()">
								<xsl:sort select="Mapped_Item_Completed_Date" order="descending"/>
								<xsl:call-template name="colorstatus">
									<xsl:with-param name="Dir" select="$Dir"/>
								</xsl:call-template>
							</xsl:for-each>
						</table>
						<xsl:text>This report was generated on:</xsl:text>
						<xsl:value-of select="current-dateTime()"/>
						<div hidden="yes">
							<span id="audienceincompletes">
								<xsl:call-template name="notify">
									<xsl:with-param name="Dir" select="$Dir"/>
								</xsl:call-template>
							</span>
							<span id="audiencewhole">
								<xsl:call-template name="emails">
									<xsl:with-param name="Dir" select="$Dir"/>
								</xsl:call-template>
							</span>
						</div>
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each-group>
	</xsl:template>
	<xsl:template name="emails">
		<xsl:param name="Dir"/>
		<xsl:for-each select="current-group()">
			<xsl:value-of select="$Dir[@id=(current()/Username)]/@Email"/>
			<xsl:text>; </xsl:text>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="notify">
		<xsl:param name="Dir"/>
		<xsl:for-each select="current-group()">
			<xsl:choose>
				<xsl:when test="not(string(Mapped_Item_Completed_Date))">
					<xsl:value-of select="$Dir[@id=(current()/Username)]/@Email"/>
					<xsl:text>; </xsl:text>
				</xsl:when>
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="colorstatus">
		<xsl:param name="Dir"/>
		<xsl:choose>
			<xsl:when test="not(string(Mapped_Item_Completed_Date))">
				<tr class="incomplete">
					<td>
						<xsl:value-of select="$Dir[@id=(current()/Username)]/@id"/>
					</td>
					<td>
						<xsl:value-of select="$Dir[@id=(current()/Username)]/@Name"/>
					</td>
					<td>
						<xsl:value-of select="$Dir[@id=(current()/Username)]/@Department"/>
					</td>
					<td>
						<xsl:value-of select="$Dir[@id=(current()/Username)]/@Job_Title"/>
					</td>
					<td/>
				</tr>
			</xsl:when>
			<xsl:otherwise>
				<tr>
					<td>
						<xsl:value-of select="$Dir[@id=(current()/Username)]/@id"/>
					</td>
					<td>
						<xsl:value-of select="$Dir[@id=(current()/Username)]/@Name"/>
					</td>
					<td>
						<xsl:value-of select="$Dir[@id=(current()/Username)]/@Department"/>
					</td>
					<td>
						<xsl:value-of select="$Dir[@id=(current()/Username)]/@Job_Title"/>
					</td>
					<td>
						<xsl:value-of select="substring(Mapped_Item_Completed_Date, 1, 10)"/>
					</td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>

