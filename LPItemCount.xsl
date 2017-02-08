<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
	<xsl:param name="input" as="xs:string"/>
	<xsl:variable name="data" select="unparsed-text($input)"/>
	<xsl:variable name="rort">
		<root>
			<xsl:for-each select="tokenize($data, '\r?\n')">
				<xsl:variable name="tokens" select="tokenize(., ',')"/>
				<row>
					<xsl:element name="lpid">
						<xsl:value-of select="subsequence($tokens, 2, 1)"/>
					</xsl:element>
					<xsl:element name="courseid">
						<xsl:value-of select="subsequence($tokens, 4, 1)"/>
					</xsl:element>
					<xsl:element name="lpname">
						<xsl:value-of select="subsequence($tokens, 1, 1)"/>
					</xsl:element>
					<xsl:element name="coursename">
						<xsl:value-of select="subsequence($tokens, 3, 1)"/>
					</xsl:element>
				</row>
			</xsl:for-each>
		</root>
	</xsl:variable>
	<xsl:variable name="datetime" select="format-dateTime(current-dateTime(), '[M01][D01][Y0001][h][m]')"/>
	<xsl:variable name="dateNow" select="current-dateTime()"/>
	<xsl:variable name="dateNow2" select="format-dateTime($dateNow, '[Y0001][M01][D01]')"/>
	<xsl:variable name="course" select="substring(coursename, 1, 8)"/>
	<xsl:strip-space elements="*"/>
	<xsl:template match="/">
		<xsl:call-template name="stuff"/>
	</xsl:template>
	<xsl:template name="stuff">
		<xsl:result-document href="/c:/LPCount{$dateNow2}/LPCount.html">

					<html>
						<head>
							<script src="sorttable (1).js"/>
							<link rel="stylesheet" type="text/css" href="https://pulse.nybc.org/dept/Education/learning-plus/LMS-sops/Document%20Library/XML%20Text%20Files/AUTP.css"/>
						</head>
						<body>
							<table class="sortable">
								<caption>
									<xsl:text>Click header row to sort table by any column.</xsl:text>
								</caption>
								<thead class="audience">
									<td>Course</td>
									<td>Count</td>
									<td>LP</td>
								</thead>
																	<xsl:for-each select="$rort/root">
				<xsl:for-each-group select="row" group-by="courseid">
				            <xsl:if test="contains(lpname, '(1150)')">
                <xsl:copy-of select="current-group()"/>
				</xsl:if>
								<xsl:for-each select="current-group()">
									<xsl:sort select="date" order="descending"/>
									<tr>
										<td>
											<xsl:value-of select="$course"/>
										</td>
										<td>
											<xsl:value-of select="count(current-group())"/>
										</td>
																				<td>
											<xsl:value-of select="lpname"/>
										</td>
									</tr>
								</xsl:for-each>
																			</xsl:for-each-group>
			</xsl:for-each>
							</table>

						</body>
					</html>

		</xsl:result-document>
	</xsl:template>
</xsl:stylesheet>