import React from 'react'
import Helmet from 'react-helmet'
import useSiteMetadata from '@primer/gatsby-theme-doctocat/src/use-site-metadata'

// Reset PrimerCSS changing body font-size to 14px
const bodyStyle = `
  body {
    font-size: 16px;
  }
`

function Head(props) {
  const siteMetadata = useSiteMetadata()
  const title = props.title
    ? `${props.title} | ${siteMetadata.title}`
    : siteMetadata.title
  const description = props.description || siteMetadata.description

  return (
    <Helmet>
      <title>{title}</title>
      <meta name="description" content={description} />
      <meta property="og:title" content={title} />
      <meta property="og:description" content={description} />
      <meta property="og:image" content={siteMetadata.imageUrl} />
      <meta property="twitter:card" content="summary_large_image" />
      <link href="https://unpkg.com/@primer/css@16.0.0-rc.873c0d1/dist/primer.css" rel="stylesheet" />
      <script src="https://unpkg.com/@primer/view-components@latest/app/assets/javascripts/primer_view_components.js"></script>
      <style>{bodyStyle}</style>
    </Helmet>
  )
}

export default Head
