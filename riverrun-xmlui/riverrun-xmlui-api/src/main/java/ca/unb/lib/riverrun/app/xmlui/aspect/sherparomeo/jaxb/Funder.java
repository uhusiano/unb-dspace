//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vJAXB 2.1.10 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2011.05.05 at 12:04:17 PM ADT 
//


package ca.unb.lib.riverrun.app.xmlui.aspect.sherparomeo.jaxb;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "fundername",
    "funderacronym",
    "julieturl"
})
@XmlRootElement(name = "funder")
public class Funder {

    @XmlElement(required = true)
    protected String fundername;
    protected String funderacronym;
    @XmlElement(required = true)
    protected String julieturl;

    /**
     * Gets the value of the fundername property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFundername() {
        return fundername;
    }

    /**
     * Sets the value of the fundername property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFundername(String value) {
        this.fundername = value;
    }

    /**
     * Gets the value of the funderacronym property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFunderacronym() {
        return funderacronym;
    }

    /**
     * Sets the value of the funderacronym property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFunderacronym(String value) {
        this.funderacronym = value;
    }

    /**
     * Gets the value of the julieturl property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getJulieturl() {
        return julieturl;
    }

    /**
     * Sets the value of the julieturl property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setJulieturl(String value) {
        this.julieturl = value;
    }

}