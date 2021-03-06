package com.sergeev.itroi.entity;

import com.sergeev.itroi.util.XML;
import lombok.Data;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.XmlValue;

@Data
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = XML.Airline.TYPE_NAME, namespace = XML.Ticket.SCHEMA_URI)
public class Airline implements Codifiable<String> {

    @XmlAttribute(required = true)
    private String code;

    @XmlValue
    private String value;
}
