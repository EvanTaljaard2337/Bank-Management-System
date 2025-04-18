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
@Table(name = "BM_SYSTEM_ADMINISTRATOR")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BmSystemAdministrator.findAll", query = "SELECT b FROM BmSystemAdministrator b")
    , @NamedQuery(name = "BmSystemAdministrator.findByBAdminid", query = "SELECT b FROM BmSystemAdministrator b WHERE b.bAdminid = :bAdminid")
    , @NamedQuery(name = "BmSystemAdministrator.findByBFullname", query = "SELECT b FROM BmSystemAdministrator b WHERE b.bFullname = :bFullname")
    , @NamedQuery(name = "BmSystemAdministrator.findByBEmail", query = "SELECT b FROM BmSystemAdministrator b WHERE b.bEmail = :bEmail")
    , @NamedQuery(name = "BmSystemAdministrator.findByBPhone", query = "SELECT b FROM BmSystemAdministrator b WHERE b.bPhone = :bPhone")
    , @NamedQuery(name = "BmSystemAdministrator.findByBPassword", query = "SELECT b FROM BmSystemAdministrator b WHERE b.bPassword = :bPassword")})
public class BmSystemAdministrator implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "B_ADMINID")
    private Integer bAdminid;
    
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

    @Basic(optional = false) // Make this field mandatory
    @NotNull
    @Size(min = 1, max = 100) // Adjust size as needed
    @Column(name = "B_PASSWORD")
    private String bPassword; // New password field
        
    public BmSystemAdministrator() {
    }

    public BmSystemAdministrator(Integer bAdminid) {
        this.bAdminid = bAdminid;
    }

    public BmSystemAdministrator(Integer bAdminid, String bFullname, String bEmail, String bPhone) {
        this.bAdminid = bAdminid;
        this.bFullname = bFullname;
        this.bEmail = bEmail;
        this.bPhone = bPhone;
        this.bPassword = bPassword; // Initialize the password
    }

    public Integer getBAdminid() {
        return bAdminid;
    }

    public void setBAdminid(Integer bAdminid) {
        this.bAdminid = bAdminid;
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
    public String getBPassword() {
        return bPassword; // Getter for password
    }

    public void setBPassword(String bPassword) {
        this.bPassword = bPassword; // Setter for password
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bAdminid != null ? bAdminid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BmSystemAdministrator)) {
            return false;
        }
        BmSystemAdministrator other = (BmSystemAdministrator) object;
        if ((this.bAdminid == null && other.bAdminid != null) || (this.bAdminid != null && !this.bAdminid.equals(other.bAdminid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.BmSystemAdministrator[ bAdminid=" + bAdminid + " ]";
    }
    
}
