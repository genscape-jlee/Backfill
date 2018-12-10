<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	<xsl:strip-space elements="*"/>
	<xsl:variable name="quot">"</xsl:variable>
	<xsl:variable name="qcq">","</xsl:variable>
	<xsl:template match="/">
		<xsl:text>"lineId","origin","terminus","deliveredTime","deliveredMW"</xsl:text>
		<xsl:for-each select="//*[local-name() = 'Measurement']">
			<xsl:text>&#xd;</xsl:text>
			<xsl:text>&#xa;</xsl:text>
			<xsl:text/><xsl:value-of select="concat($quot,../@lineId,$qcq,../@origin,$qcq,../@terminus,$qcq,@deliveredTime,$qcq,@megawattDelivered,$quot)"/><xsl:text/>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
