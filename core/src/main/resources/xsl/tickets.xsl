<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ticket="http://itroi.sergeev.com/entity/ticket"
                xmlns:flight="http://itroi.sergeev.com/entity/flight"
                xmlns:passenger="http://itroi.sergeev.com/entity/passenger"
                xmlns:payment="http://itroi.sergeev.com/entity/payment"
                xmlns:airport="http://itroi.sergeev.com/entity/airport">
  <xsl:output method="html" doctype-public="html"/>

  <xsl:template match="ticket:ticketArray">
    <html>
      <head>
        <title>Ticket List</title>
        <style>
          body {
          width: 800px;
          margin: 50px auto;
          padding: 20px;
          font-family: Calibri, sans-serif;
          font-size: 16px;
          border: 3px dashed darkgreen;
          text-align: center;
          }

          h1 {
          font-size: 50px;
          text-decoration-style: wavy;
          text-decoration-color: darkgreen;
          text-decoration-line: underline;
          }

          h2 {
          font-size: 30px;
          }

          h2 {
          font-size: 20px;
          }

          .title {
          text-align: center;
          font-family: Verdana, monospace;
          }

          .status {
          color: darkgreen;
          }

          .info {
          color: cornflowerblue;
          }

          .ticket {
          border: 2px double black;
          margin: 2px;
          padding: 2px;
          }

          .departure {
          border: 4px double black;
          margin: 6px;
          padding: 2px 6px;
          background: #fc3;
          float: left;
          width: 360px;
          }

          .arrival {
          border: 4px double black;
          margin: 6px;
          padding: 2px 6px;
          background: #fc3;
          float: right;
          width: 360px;
          }
        </style>
      </head>
      <body>
        <div class="ticketArray">
          <h1 class="title">Ticket List</h1>
          <xsl:for-each select="ticket:ticket">
            <xsl:sort select="@id"/>
            <div class="ticket">
              <div class="info">
                <h2 class="title">Ticket # <xsl:value-of select="@id"/></h2>
                <xsl:apply-templates select="ticket:flight"/>
                <p>Service Type: <xsl:value-of select="ticket:serviceType"/></p>
                <p>Seat Number: <xsl:value-of select="ticket:seat"/></p>
                <p>Airline: <xsl:value-of select="ticket:airline"/></p>
                <p>Book Date: <xsl:value-of select="ticket:bookDate"/></p>
                <xsl:apply-templates select="ticket:passenger"/>
                <xsl:apply-templates select="ticket:payment"/>
              </div>
            </div>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="ticket:flight">
    <div class="flight">
      <div class="departure">
        <h2 class="title">Departure</h2>
        <p>Time: <xsl:value-of select="flight:departure"/></p>
        <xsl:apply-templates select="flight:departureAirport"/>
      </div>
      <div class="arrival">
        <h2 class="title">Arrival</h2>
        <p>Time: <xsl:value-of select="flight:arrival"/></p>
        <xsl:apply-templates select="flight:arrivalAirport"/>
      </div>
      <h3 class="status">Flight Status: <xsl:value-of select="flight:flightStatus"/></h3>
    </div>
  </xsl:template>

  <xsl:template match="flight:departureAirport">
    <div class="airport">
      <p><xsl:value-of select="airport:airportName"/></p>
      <p><xsl:value-of select="airport:location/airport:city"/>,<xsl:value-of select="airport:location/airport:country"/></p>
    </div>
  </xsl:template>

  <xsl:template match="flight:arrivalAirport">
    <div class="airport">
      <p><xsl:value-of select="airport:airportName"/></p>
      <p><xsl:value-of select="airport:location/airport:city"/>,<xsl:value-of select="airport:location/airport:country"/></p>
    </div>
  </xsl:template>

  <xsl:template match="ticket:passenger">
    <div class="passenger">
      <p>Passenger:<xsl:value-of select="passenger:name"/></p>
    </div>
  </xsl:template>

  <xsl:template match="ticket:payment">
    <div class="payment">
      <p><xsl:value-of select="payment:price"/><xsl:value-of select="payment:price/@currency"/></p>
      <h3 class="status">Payment Status: <xsl:value-of select="payment:paymentStatus"/></h3>
    </div>
  </xsl:template>
</xsl:stylesheet>
