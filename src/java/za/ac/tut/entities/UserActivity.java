package za.ac.tut.entities;

import java.io.Serializable;
import java.sql.Timestamp;
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

@Entity
@Table(name = "USER_ACTIVITY")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UserActivity.findAll", query = "SELECT u FROM UserActivity u"),
    @NamedQuery(name = "UserActivity.findByUserId", query = "SELECT u FROM UserActivity u WHERE u.userId = :userId"),
    @NamedQuery(name = "UserActivity.findByActivityType", query = "SELECT u FROM UserActivity u WHERE u.activityType = :activityType"),
    @NamedQuery(name = "UserActivity.findByActivityTime", query = "SELECT u FROM UserActivity u WHERE u.activityTime = :activityTime")
})
public class UserActivity implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-increment for primary key
    @Basic(optional = false)
    @Column(name = "ID")
    private Long id;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "USER_ID")
    private String userId; // Track which user is performing the activity
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(name = "ACTIVITY_TYPE")
    private String activityType; // The type of activity (e.g., login, logout)
    
    @Basic(optional = false)
    @NotNull
    @Column(name = "ACTIVITY_TIME")
    private Timestamp activityTime; // When the activity occurred

    @ManyToOne
    @JoinColumn(name = "ADMIN_ID", referencedColumnName = "B_ADMINID", nullable = false)
    private BmSystemAdministrator administrator; // Link to the system administrator who performed the activity

    public UserActivity() {
    }

    public UserActivity(Long id) {
        this.id = id;
    }

    public UserActivity(Long id, String userId, String activityType, Timestamp activityTime, BmSystemAdministrator administrator) {
        this.id = id;
        this.userId = userId;
        this.activityType = activityType;
        this.activityTime = activityTime;
        this.administrator = administrator;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
    }

    public Timestamp getActivityTime() {
        return activityTime;
    }

    public void setActivityTime(Timestamp activityTime) {
        this.activityTime = activityTime;
    }

    public BmSystemAdministrator getAdministrator() {
        return administrator;
    }

    public void setAdministrator(BmSystemAdministrator administrator) {
        this.administrator = administrator;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof UserActivity)) {
            return false;
        }
        UserActivity other = (UserActivity) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.UserActivity[ id=" + id + " ]";
    }
}
