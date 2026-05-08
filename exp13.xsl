<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html>
<head>
    <title>Student Application</title>

    <style>
        body {
            font-family: Arial;
        }

        h2 {
            text-align: center;
        }

        table {
            border-collapse: collapse;
            width: 70%;
            margin: auto;
        }

        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>

<body>

<h2>Student Result Application</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Age</th>
        <th>Marks</th>
        <th>Status</th>
    </tr>

    <xsl:for-each select="students/student">

    <tr>
        <td><xsl:value-of select="id"/></td>
        <td><xsl:value-of select="name"/></td>
        <td><xsl:value-of select="age"/></td>
        <td><xsl:value-of select="marks"/></td>

        <td>
            <xsl:choose>
                <xsl:when test="marks &gt;= 75">
                    Distinction
                </xsl:when>

                <xsl:when test="marks &gt;= 50">
                    Pass
                </xsl:when>

                <xsl:otherwise>
                    Fail
                </xsl:otherwise>
            </xsl:choose>
        </td>
    </tr>

    </xsl:for-each>

</table>

<br/>

<div style="text-align:center;">
    <xsl:for-each select="students/student">
        <xsl:if test="marks &lt; 50">
            <p style="color:red;">
                Warning: <xsl:value-of select="name"/> is in FAIL category
            </p>
        </xsl:if>
    </xsl:for-each>
</div>

</body>
</html>

</xsl:template>

</xsl:stylesheet>