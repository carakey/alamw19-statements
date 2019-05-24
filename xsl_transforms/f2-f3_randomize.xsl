<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- 
        Takes as input the second generation document (F2) of encoded texts in custom XML schema.
        "Randomizes" data: 
            * Uses a list of numbers 1-18 derived externally using Python random.shuffle function.
            * Re-orders <group> section of document by copying each <text> 
            according to its index position, following the "random" list. 
        Creates as output a third generation document (F3) of random-ordered encoded texts in custom XML schema.
    -->
    
    <xsl:output method="xml" indent="yes"/>
    
    
    <!-- Identity transform template makes an initial copy of the input document -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- 
        Reordering template copies each <text> element under <group>, using the shuffled list 
        of integers to determine index position of <text> elements durying copying. 
    -->
    <xsl:template match="group">
        <group>
            <xsl:apply-templates select="text[14]"/>
            <xsl:apply-templates select="text[1]"/>
            <xsl:apply-templates select="text[16]"/>
            <xsl:apply-templates select="text[18]"/>
            <xsl:apply-templates select="text[17]"/>
            <xsl:apply-templates select="text[3]"/>
            <xsl:apply-templates select="text[10]"/>
            <xsl:apply-templates select="text[5]"/>
            <xsl:apply-templates select="text[13]"/>
            <xsl:apply-templates select="text[12]"/>
            <xsl:apply-templates select="text[9]"/>
            <xsl:apply-templates select="text[15]"/>
            <xsl:apply-templates select="text[4]"/>
            <xsl:apply-templates select="text[6]"/>
            <xsl:apply-templates select="text[8]"/>
            <xsl:apply-templates select="text[2]"/>
            <xsl:apply-templates select="text[11]"/>
            <xsl:apply-templates select="text[7]"/>
        </group>
    </xsl:template>
    
</xsl:stylesheet>