<!--
	ETCMirage customizations to item list constructed by Mirage base theme.

	* Modifies file-list and metadata item summary list views to force closed 
		<span> elements for COinS objects.
-->

<xsl:stylesheet xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
	xmlns:dri="http://di.tamu.edu/DRI/1.0/" xmlns:mets="http://www.loc.gov/METS/"
	xmlns:dim="http://www.dspace.org/xmlns/dspace/dim" xmlns:xlink="http://www.w3.org/TR/xlink/"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
	xmlns:atom="http://www.w3.org/2005/Atom" xmlns:ore="http://www.openarchives.org/ore/terms/"
	xmlns:oreatom="http://www.openarchives.org/ore/atom/" xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xalan="http://xml.apache.org/xalan" xmlns:encoder="xalan://java.net.URLEncoder"
	xmlns:util="org.dspace.app.xmlui.utils.XSLUtils"
	xmlns:confman="org.dspace.core.ConfigurationManager"
	exclude-result-prefixes="xalan encoder i18n dri mets dim  xlink xsl">

	<xsl:output indent="yes"/>

	<!--these templates are modfied to support the 2 different item list views that
    can be configured with the property 'xmlui.theme.mirage.item-list.emphasis' in dspace.cfg-->

	<!-- 
    	Handles the rendering of a single item in a list in file mode.  See 
    	dspace.cfg property 'xmlui.theme.mirage.item-list.emphasis' for details.
    -->
	<xsl:template match="dim:dim" mode="itemSummaryList-DIM-file">
		<xsl:param name="href"/>
		<xsl:variable name="metadataWidth" select="675 - $thumbnail.maxwidth - 30"/>
		
		<div class="item-metadata" style="width: {$metadataWidth}px;">
			<span class="bold">
				<i18n:text>xmlui.dri2xhtml.pioneer.title</i18n:text>
				<xsl:text>:</xsl:text>
			</span>
			
			<span class="content" style="width: {$metadataWidth - 110}px;">
				<span class="Z3988">
					<xsl:attribute name="title">
						<xsl:call-template name="renderCOinS"/>
					</xsl:attribute><xsl:comment> COinS </xsl:comment></span>
				<xsl:element name="a">
					<xsl:attribute name="href">
						<xsl:value-of select="$href"/>
					</xsl:attribute>
						<xsl:choose>
							<xsl:when test="dim:field[@element='title']">
								<xsl:value-of select="dim:field[@element='title'][1]/node()"/>
							</xsl:when>
							<xsl:otherwise>
								<i18n:text>xmlui.dri2xhtml.METS-1.0.no-title</i18n:text>
							</xsl:otherwise>
						</xsl:choose>
				</xsl:element>
			</span>
			
			<span class="bold">
				<i18n:text>xmlui.dri2xhtml.pioneer.author</i18n:text>
				<xsl:text>:</xsl:text>
			</span>
			
			<span class="content" style="width: {$metadataWidth - 110}px;">
				<xsl:choose>
					<xsl:when test="dim:field[@element='contributor'][@qualifier='author']">
						<xsl:for-each select="dim:field[@element='contributor'][@qualifier='author']">
							<span>
								<xsl:if test="@authority">
									<xsl:attribute name="class">
										<xsl:text>ds-dc_contributor_author-authority</xsl:text>
									</xsl:attribute>
								</xsl:if>
								<xsl:copy-of select="node()"/>
							</span>
							<xsl:if
								test="count(following-sibling::dim:field[@element='contributor'][@qualifier='author']) != 0">
								<xsl:text>; </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</xsl:when>
					<xsl:when test="dim:field[@element='creator']">
						<xsl:for-each select="dim:field[@element='creator']">
							<xsl:copy-of select="node()"/>
							<xsl:if test="count(following-sibling::dim:field[@element='creator']) != 0">
								<xsl:text>; </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</xsl:when>
					<xsl:when test="dim:field[@element='contributor']">
						<xsl:for-each select="dim:field[@element='contributor']">
							<xsl:copy-of select="node()"/>
							<xsl:if test="count(following-sibling::dim:field[@element='contributor']) != 0">
								<xsl:text>; </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</xsl:when>
					<xsl:otherwise>
						<i18n:text>xmlui.dri2xhtml.METS-1.0.no-author</i18n:text>
					</xsl:otherwise>
				</xsl:choose>
			</span>
			
			<xsl:if
				test="dim:field[@element='date' and @qualifier='issued'] or dim:field[@element='publisher']">
				<span class="bold">
					<i18n:text>xmlui.dri2xhtml.pioneer.date</i18n:text>
					<xsl:text>:</xsl:text>
				</span>
				<span class="content" style="width: {$metadataWidth - 110}px;">
					<xsl:value-of
						select="substring(dim:field[@element='date' and @qualifier='issued']/node(),1,10)"/>
				</span>
			</xsl:if>
		</div>
	</xsl:template>

	<!--
		Handles the rendering of a single item in a list in metadata mode. See 
		dspace.cfg property 'xmlui.theme.mirage.item-list.emphasis' for details.
	-->
	<xsl:template match="dim:dim" mode="itemSummaryList-DIM-metadata">
		<xsl:param name="href"/>
		
		<div class="artifact-description">
			<div class="artifact-title">
				<span class="Z3988">
					<xsl:attribute name="title">
						<xsl:call-template name="renderCOinS"/>
					</xsl:attribute><xsl:comment> COinS </xsl:comment></span>
				<xsl:element name="a">
					<xsl:attribute name="href">
						<xsl:value-of select="$href"/>
					</xsl:attribute>
						<xsl:choose>
							<xsl:when test="dim:field[@element='title']">
								<xsl:value-of select="dim:field[@element='title'][1]/node()"/>
							</xsl:when>
							<xsl:otherwise>
								<i18n:text>xmlui.dri2xhtml.METS-1.0.no-title</i18n:text>
							</xsl:otherwise>
						</xsl:choose>
				</xsl:element>
			</div>
			<div class="artifact-info">
				<span class="author">
					<xsl:choose>
						<xsl:when test="dim:field[@element='contributor'][@qualifier='author']">
							<xsl:for-each select="dim:field[@element='contributor'][@qualifier='author']">
								<span>
									<xsl:if test="@authority">
										<xsl:attribute name="class">
											<xsl:text>ds-dc_contributor_author-authority</xsl:text>
										</xsl:attribute>
									</xsl:if>
									<xsl:copy-of select="node()"/>
								</span>
								<xsl:if
									test="count(following-sibling::dim:field[@element='contributor'][@qualifier='author']) != 0">
									<xsl:text>; </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="dim:field[@element='creator']">
							<xsl:for-each select="dim:field[@element='creator']">
								<xsl:copy-of select="node()"/>
								<xsl:if test="count(following-sibling::dim:field[@element='creator']) != 0">
									<xsl:text>; </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:when test="dim:field[@element='contributor']">
							<xsl:for-each select="dim:field[@element='contributor']">
								<xsl:copy-of select="node()"/>
								<xsl:if test="count(following-sibling::dim:field[@element='contributor']) != 0">
									<xsl:text>; </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<i18n:text>xmlui.dri2xhtml.METS-1.0.no-author</i18n:text>
						</xsl:otherwise>
					</xsl:choose>
				</span>
				<xsl:text> </xsl:text>
				<xsl:if
					test="dim:field[@element='date' and @qualifier='issued'] or dim:field[@element='publisher']">
					<span class="publisher-date">
						<xsl:text>(</xsl:text>
						<xsl:if test="dim:field[@element='publisher']">
							<span class="publisher">
								<xsl:copy-of select="dim:field[@element='publisher']/node()"/>
							</span>
							<xsl:text>, </xsl:text>
						</xsl:if>
						<span class="date">
							<xsl:value-of
								select="substring(dim:field[@element='date' and @qualifier='issued']/node(),1,10)"/>
						</span>
						<xsl:text>)</xsl:text>
					</span>
				</xsl:if>
			</div>
			<xsl:if test="dim:field[@element = 'description' and @qualifier='abstract']">
				<xsl:variable name="abstract"
					select="dim:field[@element = 'description' and @qualifier='abstract']/node()"/>
				<div class="artifact-abstract">
					<xsl:value-of select="util:shortenString($abstract, 220, 10)"/>
				</div>
			</xsl:if>
		</div>
	</xsl:template>

</xsl:stylesheet>
