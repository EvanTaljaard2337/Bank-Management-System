/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "BM_ACCOUNT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BmAccount.findAll", query = "SELECT b FROM BmAccount b")
    , @NamedQuery(name = "BmAccount.findByBAccountid", query = "SELECT b FROM BmAccount b WHERE b.bAccountid = :bAccountid")
    , @NamedQuery(name = "BmAccount.findByBAccounttype", query = "SELECT b FROM BmAccount b WHERE b.bAccounttype = :bAccounttype")
    , @NamedQuery(name = "BmAccount.findByBBalance", query = "SELECT b FROM BmAccount b WHERE b.bBalance = :bBalance")
    , @NamedQuery(name = "BmAccount.findByBStatus", query = "SELECT b FROM BmAccount b WHERE b.bStatus = :bStatus")})
public class BmAccount implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "B_ACCOUNTID")
    private Integer bAccountid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "B_ACCOUNTTYPE")
    private String bAccounttype;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "B_BALANCE")
    private BigDecimal bBalance;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "B_STATUS")
    private String bStatus;
    @JoinColumn(name = "B_CUSTOMERID", referencedColumnName = "B_CUSTOMERID")
    @ManyToOne(optional = false)
    private BmCustomer bCustomerid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bAccountid")
    private List<BmTransaction> bmTransactionList;

    public BmAccount() {
    }

    public BmAccount(Integer bAccountid) {
        this.bAccountid = bAccountid;
    }

    public BmAccount(Integer bAccountid, String bAccounttype, String bStatus) {
        this.bAccountid = bAccountid;
        this.bAccounttype = bAccounttype;
        this.bStatus = bStatus;
    }

    public Integer getBAccountid() {
        return bAccountid;
    }

    public void setBAccountid(Integer bAccountid) {
        this.bAccountid = bAccountid;
    }

    public String getBAccounttype() {
        return bAccounttype;
    }

    public void setBAccounttype(String bAccounttype) {
        this.bAccounttype = bAccounttype;
    }

    public BigDecimal getBBalance() {
        return bBalance;
    }

    public void setBBalance(BigDecimal bBalance) {
        this.bBalance = bBalance;
    }

    public String getBStatus() {
        return bStatus;
    }

    public void setBStatus(String bStatus) {
        this.bStatus = bStatus;
    }

    public BmCustomer getBCustomerid() {
        return bCustomerid;
    }

    public void setBCustomerid(BmCustomer bCustomerid) {
        this.bCustomerid = bCustomerid;
    }

    @XmlTransient
    public List<BmTransaction> getBmTransactionList() {
        return bmTransactionList;
    }

    public void setBmTransactionList(List<BmTransaction> bmTransactionList) {
        this.bmTransactionList = bmTransactionList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bAccountid != null ? bAccountid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BmAccount)) {
            return false;
        }
        BmAccount other = (BmAccount) object;
        if ((this.bAccountid == null && other.bAccountid != null) || (this.bAccountid != null && !this.bAccountid.equals(other.bAccountid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.BmAccount[ bAccountid=" + bAccountid + " ]";
    }
    
}
