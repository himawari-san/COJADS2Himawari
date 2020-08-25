<?xml version="1.0" encoding="utf-8"?>
<!--
  cojads_sample.xsl
  Written by Masaya YAMAGUCHI, 2020-08-25
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- 表示用 -->

  <xsl:template match="記事">
    <html xmlns:xhtml="http://www.w3.org/1999/xhtml">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta http-equiv="Content-Style-Type" content="text/css" />
        <link rel="stylesheet" href="cojads_sample.css" type="text/css" />
	<title>
	  <xsl:value-of select="@タイトル"/>
	</title>
      </head>

      <body>
        <h1>
          <xsl:value-of select="@タイトル" />
        </h1>
	<hr />
	<ul>
	  <li>県，地点：<xsl:value-of select="//utterance[1]/@ken" />県，<xsl:value-of select="//utterance[1]/@chiten" /></li>
	  <li>file番号：<xsl:value-of select="//utterance[1]/@file_bango" /></li>
	  <li>データ名：<xsl:value-of select="//utterance[1]/@data_mei" /></li>
	  <li>収録年月日：<xsl:value-of select="//utterance[1]/@shuroku_nen" /></li>
	  <li>収録場所：<xsl:value-of select="//utterance[1]/@shuroku_basho" /></li>
	  <li>話題：<xsl:value-of select="//utterance[1]/@wadai" /></li>
	  <li>談話ジャンル：<xsl:value-of select="//utterance[1]/@danwa_genre" /></li>
	</ul>
	<table>
	  <thead>
	    <tr>
	      <th>ID</th>
	      <th>話者</th>
	      <th>方言テキスト</th>
	      <th>標準語テキスト</th>
	    </tr>
	  </thead>
	  <tbody>
            <xsl:apply-templates />
	  </tbody>
	</table>
	<!-- reffer to http://www.feedthebot.com/pagespeed/defer-loading-javascript.html -->
	<script type="text/javascript">
          function jumpToAnchor () {
	      var c = 0;
	      
	      var tid = setInterval(function(){
		  if(document.getElementById("himawari") != null){
		      clearInterval(tid);
		      location.href="#himawari";
		  } else{
		      c++;
		      if(c > 10){
			  clearInterval(tid);
		      }
		  }
	      }, 100);
	  }

          if (window.addEventListener){
	      window.addEventListener("load", jumpToAnchor, false);
	  } else if (window.attachEvent) {
	      window.attachEvent("onload", jumpToAnchor);
	  } else {
	      window.onload = jumpToAnchor;
	  }
	</script>
      </body>
    </html>
</xsl:template>

<xsl:template match="utterance">
  <tr class="line">
    <td style="vertical-align: top">
      <xsl:value-of select="@id"/>
    </td>
    <td style="vertical-align: top">
      <span title="{@washa_seinen},{@washa_nenrei},{@washa_seibetsu}">
	<xsl:value-of select="@washa"/>
      </span>
    </td>
    <td style="width: 42%; vertical-align: top">
      <xsl:apply-templates select="dialect" />
    </td>
    <td style="width: 42%; vertical-align: top">
      <xsl:apply-templates select="standard" />
    </td>
  </tr>
</xsl:template>

<xsl:template match="tg">
  <span class="target_char">
    <xsl:attribute name="id">
      <xsl:value-of select="@id"/>
    </xsl:attribute>
    <xsl:apply-templates/>
  </span>
</xsl:template>

</xsl:stylesheet>
