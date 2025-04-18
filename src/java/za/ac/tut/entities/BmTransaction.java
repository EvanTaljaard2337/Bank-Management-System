/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author thand
 */
@Entity
@Table(name = "BM_TRANSACTION")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BmTransaction.findAll", query = "SELECT b FROM BmTransaction b")
    , @NamedQuery(name = "BmTransaction.findByBTransactionid", query = "SELECT b FROM BmTransaction b WHERE b.bTransactionid = :bTransactionid")
    , @NamedQuery(name = "BmTransaction.findByBTransactiontype", query = "SELECT b FROM BmTransaction b WHERE b.bTransactiontype = :bTransactiontype")
    , @NamedQuery(name = "BmTransaction.findByBAmount", query = "SELECT b FROM BmTransaction b WHERE b.bAmount = :bAmount")
    , @NamedQuery(name = "BmTransaction.findByBTransactiondate", query = "SELECT b FROM BmTransaction b WHERE b.bTransactiondate = :bTransactiondate")})
public class BmTransaction implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "B_TRANSACTIONID")
    private Integer bTransactionid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "B_TRANSACTIONTYPE")
    private String bTransactiontype;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "B_AMOUNT")
    private BigDecimal bAmount;
    @Column(name = "B_TRANSACTIONDATE")
    @Temporal(TemporalType.TIMESTAMP)
    private Date bTransactiondate;
    @JoinColumn(name = "B_ACCOUNTID", referencedColumnName = "B_ACCOUNTID")
    @ManyToOne(optional = false)
    private BmAccount bAccountid;

    public BmTransaction() {
    }

    public BmTransaction(Integer bTransactionid) {
        this.bTransactionid = bTransactionid;
    }

    public BmTransaction(Integer bTransactionid, String bTransactiontype, BigDecimal bAmount) {
        this.bTransactionid = bTransactionid;
        this.bTransactiontype = bTransactiontype;
        this.bAmount = bAmount;
    }

    public Integer getBTransactionid() {
        return bTransactionid;
    }

    public void setBTransactionid(Integer bTransactionid) {
        this.bTransactionid = bTransactionid;
    }

    public String getBTransactiontype() {
        return bTransactiontype;
    }

    public void setBTransactiontype(String bTransactiontype) {
        this.bTransactiontype = bTransactiontype;
    }

    public BigDecimal getBAmount() {
        return bAmount;
    }

    public void setBAmount(BigDecimal bAmount) {
        this.bAmount = bAmount;
    }

    public Date getBTransactiondate() {
        return bTransactiondate;
    }

    public void setBTransactiondate(Date bTransactiondate) {
        this.bTransactiondate = bTransactiondate;
    }

    public BmAccount getBAccountid() {
        return bAccountid;
    }

    public void setBAccountid(BmAccount bAccountid) {
        this.bAccountid = bAccountid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bTransactionid != null ? bTransactionid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BmTransaction)) {
            return false;
        }
        BmTransaction other = (BmTransaction) object;
        if ((this.bTransactionid == null && other.bTransactionid != null) || (this.bTransactionid != null && !this.bTransactionid.equals(other.bTransactionid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.BmTransaction[ bTransactionid=" + bTransactionid + " ]";
    }
    
}
