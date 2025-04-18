/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.entities;

import java.io.Serializable;
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
@Table(name = "BM_COMPLAINT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BmComplaint.findAll", query = "SELECT b FROM BmComplaint b")
    , @NamedQuery(name = "BmComplaint.findByBComplaintid", query = "SELECT b FROM BmComplaint b WHERE b.bComplaintid = :bComplaintid")
    , @NamedQuery(name = "BmComplaint.findByBDescription", query = "SELECT b FROM BmComplaint b WHERE b.bDescription = :bDescription")
    , @NamedQuery(name = "BmComplaint.findByBStatus", query = "SELECT b FROM BmComplaint b WHERE b.bStatus = :bStatus")
    , @NamedQuery(name = "BmComplaint.findByBCreatedat", query = "SELECT b FROM BmComplaint b WHERE b.bCreatedat = :bCreatedat")})
public class BmComplaint implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "B_COMPLAINTID")
    private Integer bComplaintid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "B_DESCRIPTION")
    private String bDescription;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "B_STATUS")
    private String bStatus;
    @Column(name = "B_CREATEDAT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date bCreatedat;
    @JoinColumn(name = "B_CUSTOMERID", referencedColumnName = "B_CUSTOMERID")
    @ManyToOne(optional = false)
    private BmCustomer bCustomerid;

    public BmComplaint() {
    }

    public BmComplaint(Integer bComplaintid) {
        this.bComplaintid = bComplaintid;
    }

    public BmComplaint(Integer bComplaintid, String bDescription, String bStatus) {
        this.bComplaintid = bComplaintid;
        this.bDescription = bDescription;
        this.bStatus = bStatus;
    }

    public Integer getBComplaintid() {
        return bComplaintid;
    }

    public void setBComplaintid(Integer bComplaintid) {
        this.bComplaintid = bComplaintid;
    }

    public String getBDescription() {
        return bDescription;
    }

    public void setBDescription(String bDescription) {
        this.bDescription = bDescription;
    }

    public String getBStatus() {
        return bStatus;
    }

    public void setBStatus(String bStatus) {
        this.bStatus = bStatus;
    }

    public Date getBCreatedat() {
        return bCreatedat;
    }

    public void setBCreatedat(Date bCreatedat) {
        this.bCreatedat = bCreatedat;
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
        hash += (bComplaintid != null ? bComplaintid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BmComplaint)) {
            return false;
        }
        BmComplaint other = (BmComplaint) object;
        if ((this.bComplaintid == null && other.bComplaintid != null) || (this.bComplaintid != null && !this.bComplaintid.equals(other.bComplaintid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.BmComplaint[ bComplaintid=" + bComplaintid + " ]";
    }
    
}
