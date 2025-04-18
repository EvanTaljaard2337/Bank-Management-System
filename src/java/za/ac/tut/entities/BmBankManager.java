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
@Table(name = "BM_BANK_MANAGER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BmBankManager.findAll", query = "SELECT b FROM BmBankManager b")
    , @NamedQuery(name = "BmBankManager.findByBManagerid", query = "SELECT b FROM BmBankManager b WHERE b.bManagerid = :bManagerid")
    , @NamedQuery(name = "BmBankManager.findByBFullname", query = "SELECT b FROM BmBankManager b WHERE b.bFullname = :bFullname")
    , @NamedQuery(name = "BmBankManager.findByBEmail", query = "SELECT b FROM BmBankManager b WHERE b.bEmail = :bEmail")
    , @NamedQuery(name = "BmBankManager.findByBPhone", query = "SELECT b FROM BmBankManager b WHERE b.bPhone = :bPhone")
    , @NamedQuery(name = "BmBankManager.findByBPassword", query = "SELECT b FROM BmBankManager b WHERE b.bPassword = :bPassword")
})
public class BmBankManager implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "B_MANAGERID")
    private Integer bManagerid;
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

    public BmBankManager() {
    }

    public BmBankManager(Integer bManagerid) {
        this.bManagerid = bManagerid;
    }

    public BmBankManager(Integer bManagerid, String bFullname, String bEmail, String bPhone) {
        this.bManagerid = bManagerid;
        this.bFullname = bFullname;
        this.bEmail = bEmail;
        this.bPhone = bPhone;
    }

    public Integer getBManagerid() {
        return bManagerid;
    }

    public void setBManagerid(Integer bManagerid) {
        this.bManagerid = bManagerid;
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
        hash += (bManagerid != null ? bManagerid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BmBankManager)) {
            return false;
        }
        BmBankManager other = (BmBankManager) object;
        if ((this.bManagerid == null && other.bManagerid != null) || (this.bManagerid != null && !this.bManagerid.equals(other.bManagerid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.BmBankManager[ bManagerid=" + bManagerid + " ]";
    }
    
}
