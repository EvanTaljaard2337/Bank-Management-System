/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author thand
 */
@Entity
@Table(name = "BM_CUSTOMER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BmCustomer.findAll", query = "SELECT b FROM BmCustomer b")
    , @NamedQuery(name = "BmCustomer.findByBCustomerid", query = "SELECT b FROM BmCustomer b WHERE b.bCustomerid = :bCustomerid")
    , @NamedQuery(name = "BmCustomer.findByBFullname", query = "SELECT b FROM BmCustomer b WHERE b.bFullname = :bFullname")
    , @NamedQuery(name = "BmCustomer.findByBEmail", query = "SELECT b FROM BmCustomer b WHERE b.bEmail = :bEmail")
    , @NamedQuery(name = "BmCustomer.findByBPhone", query = "SELECT b FROM BmCustomer b WHERE b.bPhone = :bPhone")
    , @NamedQuery(name = "BmCustomer.findByBAddress", query = "SELECT b FROM BmCustomer b WHERE b.bAddress = :bAddress")
    , @NamedQuery(name = "BmCustomer.findByBPassword", query = "SELECT b FROM BmCustomer b WHERE b.bPassword = :bPassword")})
public class BmCustomer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "B_CUSTOMERID")
    private Integer bCustomerid;
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
    @Size(max = 100)
    @Column(name = "B_ADDRESS")
    private String bAddress;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "B_PASSWORD")
    private String bPassword;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bCustomerid")
    private List<BmComplaint> bmComplaintList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bCustomerid")
    private List<BmAccount> bmAccountList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bCustomerid")
    private List<BmLoan> bmLoanList;

    public BmCustomer() {
    }

    public BmCustomer(Integer bCustomerid) {
        this.bCustomerid = bCustomerid;
    }

    public BmCustomer(Integer bCustomerid, String bFullname, String bEmail, String bPhone, String bPassword) {
        this.bCustomerid = bCustomerid;
        this.bFullname = bFullname;
        this.bEmail = bEmail;
        this.bPhone = bPhone;
        this.bPassword = bPassword;
    }

    public Integer getBCustomerid() {
        return bCustomerid;
    }

    public void setBCustomerid(Integer bCustomerid) {
        this.bCustomerid = bCustomerid;
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

    public String getBAddress() {
        return bAddress;
    }

    public void setBAddress(String bAddress) {
        this.bAddress = bAddress;
    }

    public String getBPassword() {
        return bPassword;
    }

    public void setBPassword(String bPassword) {
        this.bPassword = bPassword;
    }

    @XmlTransient
    public List<BmComplaint> getBmComplaintList() {
        return bmComplaintList;
    }

    public void setBmComplaintList(List<BmComplaint> bmComplaintList) {
        this.bmComplaintList = bmComplaintList;
    }

    @XmlTransient
    public List<BmAccount> getBmAccountList() {
        return bmAccountList;
    }

    public void setBmAccountList(List<BmAccount> bmAccountList) {
        this.bmAccountList = bmAccountList;
    }

    @XmlTransient
    public List<BmLoan> getBmLoanList() {
        return bmLoanList;
    }

    public void setBmLoanList(List<BmLoan> bmLoanList) {
        this.bmLoanList = bmLoanList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bCustomerid != null ? bCustomerid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BmCustomer)) {
            return false;
        }
        BmCustomer other = (BmCustomer) object;
        if ((this.bCustomerid == null && other.bCustomerid != null) || (this.bCustomerid != null && !this.bCustomerid.equals(other.bCustomerid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.BmCustomer[ bCustomerid=" + bCustomerid + " ]";
    }
    
}
