<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
	<xsl:param name="input" as="xs:string"/>
	<xsl:variable name="data" select="unparsed-text($input)"/>
	<xsl:variable name="rort">
		<root>
			<xsl:for-each select="tokenize($data, '\r?\n')">
				<xsl:variable name="tokens" select="tokenize(., ',')"/>
				<row>
					<xsl:element name="username">
						<xsl:value-of select="subsequence($tokens, 2, 1)"/>
					</xsl:element>
					<xsl:element name="item">
						<xsl:value-of select="subsequence($tokens, 1, 1)"/>
					</xsl:element>
					<xsl:element name="date">
						<xsl:value-of select="subsequence($tokens, 3, 1)"/>
					</xsl:element>
				</row>
			</xsl:for-each>
		</root>
	</xsl:variable>
	<xsl:variable name="datetime" select="format-dateTime(current-dateTime(), '[M01][D01][Y0001][h][m]')"/>
	<xsl:variable name="dateNow" select="current-dateTime()"/>
	<xsl:variable name="dateNow2" select="format-dateTime($dateNow, '[Y0001][M01][D01]')"/>
	<xsl:variable name="Dir" select="document('userdir.xml')/Directory/EE"/>
	<xsl:variable name="Name" select="$Dir[@id=(current()/username)]/@Name"/>
	<xsl:variable name="EEID" select="$Dir[@id=(current()/username)]/@id"/>
	<xsl:variable name="Department" select="$Dir[@id=(current()/username)]/@Department"/>
	<xsl:variable name="Job_Title" select="$Dir[@id=(current()/username)]/@Job_Title"/>
	<xsl:variable name="Nameid" select="$Dir[@id=(current()/username)]/@Nameid"/>
	<xsl:output method="html" media-type="text/html"/>
	<xsl:variable name="File" select="substring(item/text(),1,85)"/>
	<xsl:strip-space elements="*"/>
	<xsl:template match="/">
		<xsl:call-template name="FOPTEXT"/>
		<xsl:call-template name="FOP"/>
	</xsl:template>
	<xsl:template name="FOPTEXT">
		<xsl:variable name="dateNow" select="current-dateTime()"/>
		<xsl:variable name="dateNow2" select="format-dateTime($dateNow, '[Y0001][M01][D01]')"/>
		<xsl:variable name="datetime" select="format-dateTime(current-dateTime(), '[M01][D01][Y0001][h][m]')"/>
		<xsl:for-each-group select="/Directory/EE" group-by="@Department">
			<xsl:result-document href="/c:/{$dateNow2}/FOP-{$datetime}/{@Department}/{@Department}.txt">
				<xsl:for-each select="current-group()">
					<xsl:sort select="@id"/>
					<xsl:text>fop </xsl:text>
					<xsl:value-of select="@id"/>
					<xsl:text>.fo "</xsl:text>
					<xsl:value-of select="@Nameid"/> - <xsl:value-of select="@Job_Title"/>
					<xsl:text>".pdf -noedit</xsl:text>
				</xsl:for-each>
			</xsl:result-document>
		</xsl:for-each-group>
	</xsl:template>
	<xsl:template name="FOP">
		<xsl:for-each select="$rort/root">
			<xsl:for-each-group select="row" group-by="username">
				<xsl:variable name="Dir" select="document('userdir.xml')/Directory/EE"/>
				<xsl:variable name="dateNow" select="current-dateTime()"/>
				<xsl:variable name="dateNow2" select="format-dateTime($dateNow, '[Y0001][M01][D01]')"/>
				<xsl:variable name="datetime" select="format-dateTime(current-dateTime(), '[M01][D01][Y0001][h][m]')"/>
				<xsl:variable name="Name" select="$Dir[@id=(current()/username)]/@Name"/>
				<xsl:variable name="EEID" select="$Dir[@id=(current()/username)]/@id"/>
				<xsl:variable name="Department" select="$Dir[@id=(current()/username)]/@Department"/>
				<xsl:variable name="Job_Title" select="$Dir[@id=(current()/username)]/@Job_Title"/>
				<xsl:variable name="Nameid" select="$Dir[@id=(current()/username)]/@Nameid"/>
				<xsl:variable name="Supervisor_Name" select="$Dir[@id=(current()/username)]/@Supervisor_Name"/>
				<xsl:result-document href="/c:/{$dateNow2}FOP/FOP-{$datetime}/{$Department}/{username}.fo">
					<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
						<fo:layout-master-set>
							<fo:simple-page-master master-name="simple" page-height="11in" page-width="8.5in" margin-top=".001in" margin-bottom=".005in" margin-left=".5in"	 margin-right=".5in">
								<fo:region-body margin-bottom=".25in" margin-top="1.25in"/>
								<fo:region-before extent=".05in" display-align="before"/>
								<fo:region-after extent=".5in" display-align="after"/>
							</fo:simple-page-master>
						</fo:layout-master-set>
						<fo:page-sequence master-reference="simple" id="employeeprofile">
							<fo:static-content flow-name="xsl-region-before">
								<fo:block>
									<fo:external-graphic src="/C:/images/logo.gif" content-width="scale-to-fit" width="100%" content-height="100%"/>
								</fo:block>
							</fo:static-content>
							<fo:static-content flow-name="xsl-region-after">
								<fo:table table-layout="fixed" width="100%">
									<fo:table-column column-width="proportional-column-width(1)"/>
									<fo:table-column column-width="proportional-column-width(1)"/>
									<fo:table-column column-width="proportional-column-width(1)"/>
									<fo:table-column column-width="proportional-column-width(1)"/>
									<fo:table-body>
										<fo:table-row vertical-align="bottom">
											<fo:table-cell>
												<fo:block font-size="8pt">KDS</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block font-size="8pt">Page<fo:page-number/> of<fo:page-number-citation-last ref-id="employeeprofile"/>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block font-size="8pt">02.0030 F10-1</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block font-size="8pt">Effective date: 03/08/2016</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:static-content>
							<fo:flow flow-name="xsl-region-body">
								<fo:table table-layout="fixed" width="100%" border-collapse="collapse" space-after.optimum="1pt">
									<fo:table-column column-width="proportional-column-width(1)" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="1pt"/>
									<fo:table-column column-width="proportional-column-width(1)" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="1pt"/>
									<fo:table-column column-width="proportional-column-width(1)" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="1pt"/>
									<fo:table-body>
										<fo:table-row border-bottom-style="solid" border-bottom-color="black" border-bottom-width="1pt" border-before-color="transparent" 	border-after-color="transparent" border-left-color="transparent" border-right-color="transparent" border-top-color="transparent">
											<fo:table-cell number-columns-spanned="3">
												<fo:block font-weight="bold" font-size="8pt" text-indent="2pt">Supervisor instructions:<fo:inline font-style="italic" font-size="8pt" font-weight="normal">Review the employee or non-employee worker Training Profile for your annual training review.Add comments as necessary.Sign and retain in your local Supervisor file or departmental file as appropriate.</fo:inline>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row text-indent="5pt" border-left-width="2pt" border-left-color="black" border-left-style="solid" border-right-width="2pt" 	border-right-color="black" border-right-style="solid">
											<fo:table-cell>
												<fo:block font-size="8pt">Employee or non-employee name:</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block font-size="8pt">NYBC ID Number:</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block font-size="8pt">Date of Report:</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row text-indent="5pt" border-left-width="2pt" border-left-color="black" border-left-style="solid" border-right-width="2pt" 	border-right-color="black" border-right-style="solid">
											<fo:table-cell>
												<fo:block>
													<xsl:value-of select="$Name"/>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block text-indent="3pt">
													<xsl:value-of select="$EEID"/>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block>
													<xsl:value-of select="format-date(current-date(), '[MNn] [D01], [Y0001]')"/>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row text-indent="3pt" border-left-width="2pt" border-left-color="black" border-left-style="solid" border-right-width="2pt" 	border-right-color="black" border-right-style="solid">
											<fo:table-cell>
												<fo:block font-size="8pt">Department:</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block font-size="8pt">Job Title:</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block font-size="8pt">Supervisor Name:</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row text-indent="3pt" border-left-width="2pt" border-left-color="black" border-left-style="solid" border-right-width="2pt" 	border-right-color="black" border-right-style="solid">
											<fo:table-cell>
												<fo:block text-align="start" font-size="10pt">
													<xsl:value-of select="$Department"/>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block text-align="start" font-size="8.5pt">
													<xsl:value-of select="$Job_Title"/>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block text-align="start" font-size="9pt">
													<xsl:value-of select="$Supervisor_Name"/>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
								<fo:table table-layout="fixed" width="100%" border-spacing="15pt" border-collapse="collapse" space-after.optimum="3pt">
									<fo:table-column column-width="88%"/>
									<fo:table-column column-width="12%"/>
									<fo:table-body>
										<fo:table-row border-width="1pt" border-style="solid" border-color="black">
											<fo:table-cell number-columns-spanned="2" text-align="center">
												<fo:block font-size="10pt" vertical-align="top">The following Training Profile represents all currently assigned training	<fo:inline font-style="italic">(to be completed by Training and Development):</fo:inline>
												</fo:block>
												<fo:block font-size="8pt" font-style="italic" vertical-align="bottom">Dates shown below indicate the most recent completion date. A blank in the date field indicates not completed in the LMS.</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<xsl:for-each-group select="$rort/root" group-by="item">
												<fo:table-row border-width=".5pt" border-style="solid" border-color="black">
													<fo:table-cell>
														<fo:block-container overflow="hidden">
															<fo:block keep-together.within-line="always" text-align="left" font-size="10pt" text-indent="4.5pt">
																<xsl:value-of select="current-group()"/>
															</fo:block>
														</fo:block-container>
													</fo:table-cell>
													<xsl:choose>
														<xsl:when test="string(date)">
															<fo:table-cell end-indent="1pt">
																<fo:block text-align="right" font-size="10pt">
																	<xsl:value-of select="substring(date, 1, 10)"/>
																</fo:block>
															</fo:table-cell>
														</xsl:when>
														<xsl:otherwise>
															<fo:table-cell end-indent="1pt">
																<fo:block text-align="right" font-size="10pt"/>
															</fo:table-cell>
														</xsl:otherwise>
													</xsl:choose>
												</fo:table-row>
										</xsl:for-each-group>
									</fo:table-body>
								</fo:table>
								<fo:table table-layout="fixed" width="100%">
									<fo:table-body>
										<fo:table-row height=".65in" border-width="1pt" border-style="solid" border-spacing="8pt" border-color="black">
											<fo:table-cell>
												<fo:block text-align="start" font-size="10pt" vertical-align="top">Annual Competency Assessment Review</fo:block>
												<fo:block text-align="center" font-size="8pt" font-style="italic" font-weight="bold" vertical-align="bottom">If required<fo:inline font-weight="normal">in accordance with SOP 02.0031 (current version)</fo:inline>
													<fo:inline font-family="ZapfDingbats" font-style="normal"> &#x27A4;</fo:inline>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell width="2.5in">
												<fo:block text-align="start" vertical-align="top" font-size="10pt">Enter Date the Competency</fo:block>
												<fo:block text-align="start" vertical-align="top" font-size="10pt">Assessment Review was completed:</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row height=".65in" border-width="1pt" border-style="solid" border-spacing="8pt" border-color="black">
											<fo:table-cell>
												<fo:block text-align="start" font-size="10pt" vertical-align="top">Supervisor / Designee signature:</fo:block>
											</fo:table-cell>
											<fo:table-cell>
												<fo:block text-align="start" font-size="10pt" vertical-align="top">Date:</fo:block>
											</fo:table-cell>
										</fo:table-row>
										<fo:table-row height="2in" border-width="1pt" border-style="solid" border-spacing="8pt" border-color="black" keep-together.within-page="always">
											<fo:table-cell number-columns-spanned="2">
												<fo:block text-align="start" font-size="10pt" vertical-align="top">Supervisor Comments<fo:inline font-style="italic" font-size="8pt">(if applicable)</fo:inline>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-body>
								</fo:table>
							</fo:flow>
						</fo:page-sequence>
					</fo:root>
				</xsl:result-document>
			</xsl:for-each-group>
		</xsl:for-each>
	</xsl:template> 
</xsl:stylesheet>