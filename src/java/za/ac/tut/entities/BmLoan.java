/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.entities;

import java.io.Serializable;
import java.math.BigDecimal;
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
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author thand
 */
@Entity
@Table(name = "BM_LOAN")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BmLoan.findAll", query = "SELECT b FROM BmLoan b")
    , @NamedQuery(name = "BmLoan.findByBLoanid", query = "SELECT b FROM BmLoan b WHERE b.bLoanid = :bLoanid")
    , @NamedQuery(name = "BmLoan.findByBLoanamount", query = "SELECT b FROM BmLoan b WHERE b.bLoanamount = :bLoanamount")
    , @NamedQuery(name = "BmLoan.findByBInterestrate", query = "SELECT b FROM BmLoan b WHERE b.bInterestrate = :bInterestrate")
    , @NamedQuery(name = "BmLoan.findByBStatus", query = "SELECT b FROM BmLoan b WHERE b.bStatus = :bStatus")})
public class BmLoan implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "B_LOANID")
    private Integer bLoanid;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "B_LOANAMOUNT")
    private BigDecimal bLoanamount;
    @Basic(optional = false)
    @NotNull
    @Column(name = "B_INTERESTRATE")
    private BigDecimal bInterestrate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "B_STATUS")
    private String bStatus;
    @JoinColumn(name = "B_CUSTOMERID", referencedColumnName = "B_CUSTOMERID")
    @ManyToOne(optional = false)
    private BmCustomer bCustomerid;

    public BmLoan() {
    }

    public BmLoan(Integer bLoanid) {
        this.bLoanid = bLoanid;
    }

    public BmLoan(Integer bLoanid, BigDecimal bLoanamount, BigDecimal bInterestrate, String bStatus) {
        this.bLoanid = bLoanid;
        this.bLoanamount = bLoanamount;
        this.bInterestrate = bInterestrate;
        this.bStatus = bStatus;
    }

    public Integer getBLoanid() {
        return bLoanid;
    }

    public void setBLoanid(Integer bLoanid) {
        this.bLoanid = bLoanid;
    }

    public BigDecimal getBLoanamount() {
        return bLoanamount;
    }

    public void setBLoanamount(BigDecimal bLoanamount) {
        this.bLoanamount = bLoanamount;
    }

    public BigDecimal getBInterestrate() {
        return bInterestrate;
    }

    public void setBInterestrate(BigDecimal bInterestrate) {
        this.bInterestrate = bInterestrate;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bLoanid != null ? bLoanid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BmLoan)) {
            return false;
        }
        BmLoan other = (BmLoan) object;
        if ((this.bLoanid == null && other.bLoanid != null) || (this.bLoanid != null && !this.bLoanid.equals(other.bLoanid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.BmLoan[ bLoanid=" + bLoanid + " ]";
    }
    
}
