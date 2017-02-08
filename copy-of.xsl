<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>
  <xsl:preserve-space elements="*"/>
  
  <xsl:template match="root">
    <xsl:result-document href="countxxx.xml">
    <tot>
      <xsl:value-of select="count((row))"/>
    </tot>
    <inc>
      <xsl:value-of select="count((row[Mapped_Item_Completed_Date eq '']))"/>
    </inc>
    <comp>
      <xsl:value-of select="count((row[Mapped_Item_Completed_Date ne '']))"/>
    </comp>
    </xsl:result-document>
  </xsl:template>
              
</xsl:stylesheet>
