<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0 " xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" />
    <xsl:template match="/">
        <p>
            <b>
                <xsl:value-of select="book/author" />
            </b>. <xsl:value-of
                select="book/title" /> - <xsl:value-of select="book/year"></xsl:value-of>
        </p>
    </xsl:template>
</xsl:stylesheet>