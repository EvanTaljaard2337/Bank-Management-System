/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author thand
 */
@Entity
@Table(name = "BM_CUSTOMER_SUPPORT_AGENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BmCustomerSupportAgent.findAll", query = "SELECT b FROM BmCustomerSupportAgent b")
    , @NamedQuery(name = "BmCustomerSupportAgent.findByBAgentid", query = "SELECT b FROM BmCustomerSupportAgent b WHERE b.bAgentid = :bAgentid")
    , @NamedQuery(name = "BmCustomerSupportAgent.findByBFullname", query = "SELECT b FROM BmCustomerSupportAgent b WHERE b.bFullname = :bFullname")
    , @NamedQuery(name = "BmCustomerSupportAgent.findByBEmail", query = "SELECT b FROM BmCustomerSupportAgent b WHERE b.bEmail = :bEmail")
    , @NamedQuery(name = "BmCustomerSupportAgent.findByBPhone", query = "SELECT b FROM BmCustomerSupportAgent b WHERE b.bPhone = :bPhone")
    ,@NamedQuery(name = "BmCustomerSupportAgent.findByBPassword", query = "SELECT b FROM BmCustomerSupportAgent b WHERE b.bPassword = :bPassword")})
public class BmCustomerSupportAgent implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "B_AGENTID")
    private Integer bAgentid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "B_FULLNAME")
    private String bFullname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "B_EMAIL")
    private String bEmail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "B_PHONE")
    private String bPhone;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "B_PASSWORD")
    private String bPassword;
        
    public BmCustomerSupportAgent() {
    }

    public BmCustomerSupportAgent(Integer bAgentid) {
        this.bAgentid = bAgentid;
    }

    public BmCustomerSupportAgent(Integer bAgentid, String bFullname, String bEmail, String bPhone,String bPassword) {
        this.bAgentid = bAgentid;
        this.bFullname = bFullname;
        this.bEmail = bEmail;
        this.bPhone = bPhone;
        this.bPassword=bPassword;
    }

    public String getbPassword() {
        return bPassword;
    }

    public void setbPassword(String bPassword) {
        this.bPassword = bPassword;
    }

    public Integer getBAgentid() {
        return bAgentid;
    }

    public void setBAgentid(Integer bAgentid) {
        this.bAgentid = bAgentid;
    }

    public String getBFullname() {
        return bFullname;
    }

    public void setBFullname(String bFullname) {
        this.bFullname = bFullname;
    }

    public String getBEmail() {
        return bEmail;
    }

    public void setBEmail(String bEmail) {
        this.bEmail = bEmail;
    }

    public String getBPhone() {
        return bPhone;
    }

    public void setBPhone(String bPhone) {
        this.bPhone = bPhone;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bAgentid != null ? bAgentid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BmCustomerSupportAgent)) {
            return false;
        }
        BmCustomerSupportAgent other = (BmCustomerSupportAgent) object;
        if ((this.bAgentid == null && other.bAgentid != null) || (this.bAgentid != null && !this.bAgentid.equals(other.bAgentid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.BmCustomerSupportAgent[ bAgentid=" + bAgentid + " ]";
    }
    
}
