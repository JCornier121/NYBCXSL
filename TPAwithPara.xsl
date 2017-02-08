<?xml version="1.0" encoding="UTF-8"?>
	<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"    xmlns:xs="http://www.w3.org/2001/XMLSchema"    exclude-result-prefixes="xs"     version="2.0">
		<xsl:param name="User"/>
		<xsl:param name="SOP"/>
		
			<xsl:template match="/">
					<xsl:for-each select="/Directory/EE">
					<xsl:choose>	
						<xsl:when test="@id = $User">
					<xsl:call-template name="Para">
						<xsl:with-param name="User" select ="$User"/>										<xsl:with-param name="SOP" select ="$SOP"/>
					</xsl:call-template>
</xsl:when>
</xsl:choose>
		</xsl:for-each>
			</xsl:template>
			<xsl:template name="Para">
		<xsl:param name="User"/>
		<xsl:param name="SOP"/>
							<xsl:variable name="dateNow" select="current-dateTime()"/>
								<xsl:variable name="dateNow2" select="format-dateTime($dateNow, '[Y0001][M01][D01]')"/>
<xsl:result-document href="/c:/TPA{$dateNow2}/{@id}.fo" xml:space="preserve">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
<fo:layout-master-set>
<fo:simple-page-master master-name="simple" page-height="8.5in" page-width="11in"
    margin-top=".001in" margin-bottom=".005in" margin-left=".5in" margin-right=".5in"><fo:region-body margin-bottom=".25in" margin-top="1.25in"/><fo:region-before extent=".05in" display-align="before"/><fo:region-after extent=".5in" display-align="after"/>
</fo:simple-page-master></fo:layout-master-set><fo:page-sequence master-reference="simple" id="employeeprofile"><fo:static-content flow-name="xsl-region-before"><fo:block><fo:external-graphic src="/G:/XSL/Training Profile Assignments logo.gif" content-width="scale-to-fit" width="100%" content-height="100%"/></fo:block>
</fo:static-content>
<fo:static-content flow-name="xsl-region-after">
<fo:table table-layout="fixed" width="100%"><fo:table-column column-width="proportional-column-width(1)"/>        <fo:table-column column-width="proportional-column-width(1)"/><fo:table-column column-width="proportional-column-width(1)"/><fo:table-column column-width="proportional-column-width(1)"/><fo:table-body><fo:table-row vertical-align="bottom"><fo:table-cell><fo:block font-size="8pt">KDS</fo:block></fo:table-cell><fo:table-cell><fo:block font-size="8pt">Page
<fo:page-number/> of <fo:page-number-citation-last ref-id="employeeprofile"/></fo:block></fo:table-cell><fo:table-cell><fo:block font-size="8pt">02.0030 F9-1</fo:block></fo:table-cell><fo:table-cell><fo:block font-size="8pt">Effective date: 03/08/2016 </fo:block></fo:table-cell>
</fo:table-row></fo:table-body>
</fo:table>
</fo:static-content>
<fo:flow flow-name="xsl-region-body"><fo:table table-layout="fixed" width="100%" border-collapse="collapse" space-after.optimum="1pt"><fo:table-column column-width="proportional-column-width(1)" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="1pt"/><fo:table-column column-width="proportional-column-width(1)" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="1pt"/><fo:table-column column-width="proportional-column-width(1)" border-bottom-style="solid" border-bottom-color="black" border-bottom-width="1pt"/><fo:table-body>
<fo:table-row border-bottom-style="solid" border-bottom-color="black" border-bottom-width="1pt" border-before-color="transparent" border-after-color="transparent" border-left-color="transparent" border-right-color="transparent" border-top-color="transparent"><fo:table-cell number-columns-spanned="3"><fo:block font-weight="bold" font-size="8pt" text-indent="2pt">Supervisor instructions: <fo:inline font-style="italic" font-size="8pt" font-weight="normal">Use this form to <fo:inline font-weight="bold">create or change </fo:inline>training profiles for the individuals who report to you.  Training and Development (T&amp;D) can populate training assignments if you have an existing worker profile that can be duplicated.  Contact the Learning Plus Helpdesk on 718-707-3550 for a duplicate profile.   Complete all required fields, sign, scan and send to T&amp;D: T&amp;D@nybc.org.</fo:inline></fo:block></fo:table-cell>
</fo:table-row>
<fo:table-row text-indent="5pt" border-left-width="2pt" border-left-color="black" border-left-style="solid" border-right-width="2pt" border-right-color="black" border-right-style="solid"><fo:table-cell><fo:block font-size="8pt">Employee or non-employee name:</fo:block></fo:table-cell><fo:table-cell><fo:block font-size="8pt">NYBC ID Number:</fo:block></fo:table-cell><fo:table-cell><fo:block font-size="8pt">Position Start Date:</fo:block></fo:table-cell></fo:table-row><fo:table-row height="12" text-indent="5pt" border-left-width="2pt" border-left-color="black" border-left-style="solid" border-right-width="2pt" border-right-color="black" border-right-style="solid"><fo:table-cell><fo:block><xsl:value-of select="@Name"/></fo:block></fo:table-cell><fo:table-cell><fo:block text-indent="3pt"><xsl:value-of select="@id"/></fo:block></fo:table-cell><fo:table-cell text-align="right"><fo:block><xsl:value-of select="@Hire_Date"/></fo:block></fo:table-cell>
</fo:table-row>
<fo:table-row text-indent="3pt" border-left-width="2pt" border-left-color="black" border-left-style="solid" border-right-width="2pt" border-right-color="black" border-right-style="solid"><fo:table-cell><fo:block font-size="8pt">Department:</fo:block></fo:table-cell><fo:table-cell><fo:block font-size="8pt">Job Title:</fo:block></fo:table-cell><fo:table-cell><fo:block font-size="8pt">Supervisor Name:</fo:block></fo:table-cell>
</fo:table-row>
<fo:table-row text-indent="3pt" border-left-width="2pt" border-left-color="black" border-left-style="solid" border-right-width="2pt" border-right-color="black" border-right-style="solid"><fo:table-cell><fo:block text-align="start" font-size="12pt"><xsl:value-of select="@Department"/></fo:block></fo:table-cell><fo:table-cell><fo:block text-align="start" font-size="12pt"><xsl:value-of select="@Job_Title"/></fo:block></fo:table-cell><fo:table-cell><fo:block text-align="start" font-size="12pt"><xsl:value-of select="@Supervisor_Name"/></fo:block></fo:table-cell>
</fo:table-row>
<fo:table-row height=".65in" border-width="1pt" border-style="solid" border-spacing="8pt" border-color="black"><fo:table-cell number-columns-spanned="2"><fo:block text-align="start" font-size="10pt" vertical-align="top">Supervisor Signature:</fo:block></fo:table-cell><fo:table-cell width="2.5in"><fo:block text-align="start" vertical-align="top" font-size="10pt">Date:</fo:block></fo:table-cell>
</fo:table-row></fo:table-body></fo:table><fo:block><fo:external-graphic src="/G:/XSL/TPACore.jpg" content-width="scale-to-fit" width="100%" content-height="100%"/></fo:block>
<fo:table table-layout="fixed" width="100%" border-spacing="15pt" border-collapse="collapse" space-after.optimum="3pt" ><fo:table-column column-width="88%"/><fo:table-column column-width="12%"/><fo:table-body><fo:table-row border-width=".5pt" border-style="solid" border-color="black"><fo:table-cell border-left-width=".5pt" border-left-color="black" border-style="solid" border-spacing="8pt"><fo:block-container overflow="hidden"><fo:block text-align="left" font-size="10pt" text-indent="4.5pt"><xsl:value-of select="$SOP"/></fo:block></fo:block-container></fo:table-cell><fo:table-cell border-left-width=".5pt" border-left-color="black" border-style="solid" border-spacing="8pt"><fo:block-container overflow="hidden"><fo:block text-align="left" font-size="10pt" text-indent="4.5pt" >A</fo:block></fo:block-container></fo:table-cell>
</fo:table-row></fo:table-body>
</fo:table>
<fo:table table-layout="fixed" width="100%"><fo:table-body>
<fo:table-row height=".65in" border-width="1pt" border-style="solid" border-spacing="8pt" border-color="black"><fo:table-cell><fo:block text-align="start" font-size="10pt" vertical-align="top">*Reason for changes <fo:inline font-weight="bold" font-style="italic">(required </fo:inline><fo:inline font-style="normal">for removing assignments):</fo:inline></fo:block></fo:table-cell>
</fo:table-row></fo:table-body>
</fo:table>
</fo:flow></fo:page-sequence></fo:root>
</xsl:result-document></xsl:template>
</xsl:stylesheet>