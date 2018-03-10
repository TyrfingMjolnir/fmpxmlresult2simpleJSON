<?xml version="1.0" encoding="UTF-8"?>
<!-- 
     Written by Gjermund G Thorsen 2018, all rights deserved
     for the purpose of generating JSON from FMPXMLRESULT
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fmp="http://www.filemaker.com/fmpxmlresult" version="1.0">
	<xsl:output method="text" version="1.0" encoding="UTF-8" indent="no"/>
	<xsl:template match="fmp:FMPXMLRESULT">
		<xsl:text>{"</xsl:text><xsl:value-of select="$tableName"/><xsl:text>":{</xsl:text>
		<xsl:call-template name="fieldname"/>
		<xsl:call-template name="data"/>
		<xsl:text>}}</xsl:text>
	</xsl:template>
	<xsl:template name="fieldname">
    <xsl:text>"field":[</xsl:text>			
				<xsl:for-each select="fmp:METADATA/fmp:FIELD">
							<xsl:choose>
					<xsl:when test="position()=last()">
					<xsl:text>"</xsl:text><xsl:value-of select="@NAME"/><xsl:text>"</xsl:text>
				</xsl:when>
					<xsl:otherwise>
						<xsl:text>"</xsl:text><xsl:value-of select="@NAME"/><xsl:text>",</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:for-each>
		<xsl:text>],</xsl:text>
	</xsl:template>
	<xsl:template name="data">
		<xsl:text>"data":{</xsl:text>
		<xsl:for-each select="fmp:RESULTSET/fmp:ROW">
		<xsl:text>"</xsl:text><xsl:value-of select="@RECORDID"/><xsl:text>.</xsl:text><xsl:value-of select="@MODID"/><xsl:text>":[</xsl:text>
			<xsl:for-each select="fmp:COL">
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:text>"</xsl:text><xsl:value-of select="fmp:DATA"/><xsl:text>"</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>"</xsl:text><xsl:value-of select="fmp:DATA"/><xsl:text>",</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
				<xsl:choose>
				<xsl:when test="position()=last()">
					<xsl:text>]</xsl:text>
					</xsl:when>
					<xsl:otherwise>
					<xsl:text>],</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
		</xsl:for-each>
		<xsl:text>}</xsl:text>
	</xsl:template>
	<xsl:variable name="databaseName">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@NAME"/>
	</xsl:variable>
	<xsl:variable name="tableName">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@LAYOUT"/>
	</xsl:variable>
	<xsl:variable name="timeformat">
		<xsl:value-of select="fmp:FMPXMLRESULT/fmp:DATABASE/@TIMEFORMAT"/>
	</xsl:variable>
</xsl:stylesheet><!--
========================================================================================
Copyright (c) 2008 Gjermund Gusland Thorsen, released under the MIT License.
All rights deserved.
This piece comes with ABSOLUTELY NO WARRANTY, to the extent permitted by applicable law.
========================================================================================
-->
