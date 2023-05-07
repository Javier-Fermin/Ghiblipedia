<xsl:stylesheet version="1.0" xmlns:xsl= "http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="iso-8859-1" omit-xml-declaration="yes" />
    <xsl:template match= "ghiblipedia"> 
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="ghiblipedia.css"/>
            </head>
            <body>
                <table>
                    <tr>
                        <th> Title </th>
                        <th> Lenght </th>
                        <th> Release date </th>
                        <th> Ratings </th>
                        <th> Streaming Platforms </th>
                        <th> Director </th>
                    </tr>
                    <tr>
                        <xsl:for-each select="films/film">
                            <tr>
                                <td>
                                    <xsl:value-of select="title"/>
                                </td>
                                <td>
                                    <xsl:value-of select="length"/>
                                </td>
                                <td>
                                    <xsl:value-of select="rDate"/>
                                </td>
                                <td>
                                    <xsl:value-of select="ratings"/>
                                </td>
                                <td>
                                    <xsl:for-each select="streamingPlatforms">
                                        <ul>
                                            <li>
                                                <xsl:value-of select="name"/>
                                            </li>   
                                        </ul>
                                    </xsl:for-each>
                                </td>
                                <xsl:call-template name="ListDirectors">
                                    <xsl:with-param select="director/@id" name="codDirector"/>
                                </xsl:call-template> 
                            </tr>
                        </xsl:for-each>
                    </tr>
                </table>
                <br/>
                <br/>
                <table>
                    <tr>
                        <th> Title </th>
                        <th> Characters </th>
                        <th> Voice Actor </th>
                    </tr>
                    <tr>
                        <xsl:for-each select="films/film">
                            <tr>
                                <td>
                                    <xsl:value-of select="title"/>
                                </td>
                                <td>
                                <xsl:call-template name="ListCharacter">
                                    <xsl:with-param select="characters/character/@id" name="codCharacter"/>
                                </xsl:call-template>
                                </td>
                                <td>
                                    <xsl:call-template name="ListVoiceActors">
                                        <xsl:with-param select="characters/character/@id" name="codCharacter"/>
                                    </xsl:call-template>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template name ="ListDirectors">
        <xsl:param name ="codDirector"/>
        <xsl:for-each select="/ghiblipedia/workers/worker/director[@id=$codDirector]">
            <td>
                <xsl:value-of select="name"/>
            </td>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name ="ListCharacter">
        <xsl:param name ="codCharacter"/>
        <xsl:for-each select="/ghiblipedia/characters/character[@id=$codCharacter]">
            
            <ul>
                <li>
                    <xsl:value-of select="name"/>
                </li>   
            </ul>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name ="ListVoiceActors">
        <xsl:param name ="codCharacter"/>
        <xsl:for-each select="/ghiblipedia/workers/worker/voiceActor[charactersDub/character[@id=$codCharacter]]">
            
            <ul>
                <li>
                    <xsl:value-of select="name"/>
                </li>   
            </ul>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>

