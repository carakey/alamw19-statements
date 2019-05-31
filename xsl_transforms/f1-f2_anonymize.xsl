<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    
    <!-- 
        Takes as input the first generation document (F1) of encoded texts in custom XML schema.
        Anonymizes data: 
            * Removes references to publishing organizations, as well as contextual and supporting information including source location, contact information, dates.
            * Substitutes titles with generalized category attributes.
            * Removes identifying entity names within text.
            * Removes linked URLs from text.
        Creates as output a second generation document (F2) of anonymized encoded statements in custom XML schema.
    -->
    
    <xsl:output method="xml" indent="yes"/>
    
    <!-- Identity transform template makes an initial copy of the F1 document -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- 
        Text template:
            * Matches each <text> element under <group>.
            * Drops source attribute from F1 <text> element.
            * Copies F1 <text> attributes except @source.
            * Copies <body> element under <text> element.
            * <front> and <back> elements are not copied.
    -->
    <xsl:template match="//text/group/text">
        <xsl:element name="text">
            <xsl:copy-of select="@*[not(name()='source')]"/>
            <xsl:for-each select="body">
                <xsl:copy>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <!-- 
        Entity template:
            * Matches each <entity> element from F1.
            * Replaces the <entity> element and its value with a stand-in text value, enclosed in square brackets, constructed as follows:
                * If an @identity attribute is present:
                    * Replaces the 'self' identity value with 'This' for readability; 
                    * Otherwise, inserts the identity value, capitalizing the first letter;
                    * Inserts a space.
                * Inserts the @type attribute value, transformed as follows:
                    * Divides the value on the underscore;
                    * Capitalizes the first letter of each word;
                    * Inserts a space after all words except the last. 
    -->
    <xsl:template match="entity"> 
        <xsl:text>[</xsl:text>
        <xsl:if test="@identity">
            <xsl:choose>
                <xsl:when test="@identity = 'self'">
                    <xsl:text>This</xsl:text>
                </xsl:when>
                <xsl:otherwise> 
                    <xsl:value-of
                        select="concat(upper-case(substring(@identity, 1, 1)), substring(@identity, 2))"
                    />
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:for-each select="tokenize(@type, '_')">
            <xsl:value-of select="concat(upper-case(substring(., 1, 1)), substring(., 2))"/>
            <xsl:if test="position() != last()">
                <xsl:text> </xsl:text>
            </xsl:if>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
    </xsl:template>

    <!-- 
        Link template:
            * Matches each <link> element from F1.
            * In place of <link> element, inserts stand-in text value: " [Link]".
    -->
    <xsl:template match="link"> 
        <xsl:text> [Link]</xsl:text> 
    </xsl:template>
    
</xsl:stylesheet>