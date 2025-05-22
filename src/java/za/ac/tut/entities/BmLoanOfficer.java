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
@Table(name = "BM_LOAN_OFFICER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BmLoanOfficer.findAll", query = "SELECT b FROM BmLoanOfficer b")
    , @NamedQuery(name = "BmLoanOfficer.findByBOfficerid", query = "SELECT b FROM BmLoanOfficer b WHERE b.bOfficerid = :bOfficerid")
    , @NamedQuery(name = "BmLoanOfficer.findByBFullname", query = "SELECT b FROM BmLoanOfficer b WHERE b.bFullname = :bFullname")
    , @NamedQuery(name = "BmLoanOfficer.findByBEmail", query = "SELECT b FROM BmLoanOfficer b WHERE b.bEmail = :bEmail")
    , @NamedQuery(name = "BmLoanOfficer.findByBPhone", query = "SELECT b FROM BmLoanOfficer b WHERE b.bPhone = :bPhone")
    , @NamedQuery(name = "BmLoanOfficer.findByBPassword", query = "SELECT b FROM BmLoanOfficer b WHERE b.bPassword = :bPassword")})
public class BmLoanOfficer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "B_OFFICERID")
    private Integer bOfficerid;
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
        
    public BmLoanOfficer() {
    }

    public BmLoanOfficer(Integer bOfficerid) {
        this.bOfficerid = bOfficerid;
    }

    public BmLoanOfficer(Integer bOfficerid, String bFullname, String bEmail, String bPhone,String bPassword) {
        this.bOfficerid = bOfficerid;
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

    public Integer getBOfficerid() {
        return bOfficerid;
    }

    public void setBOfficerid(Integer bOfficerid) {
        this.bOfficerid = bOfficerid;
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
        hash += (bOfficerid != null ? bOfficerid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BmLoanOfficer)) {
            return false;
        }
        BmLoanOfficer other = (BmLoanOfficer) object;
        if ((this.bOfficerid == null && other.bOfficerid != null) || (this.bOfficerid != null && !this.bOfficerid.equals(other.bOfficerid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.BmLoanOfficer[ bOfficerid=" + bOfficerid + " ]";
    }
    
}
