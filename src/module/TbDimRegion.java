package module;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * TbDimRegion entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="TB_DIM_REGION",schema="MK_VGOP")
public class TbDimRegion implements java.io.Serializable {

	private static final long serialVersionUID = 1456470786149169631L;

	// Fields
	@Id
	@Column(name="REGION_ID")
	private String regionId;
    
	@Column(name="REGION_PARENT_ID")
	private String regionParentId;
    
	@Column(name="LVL_ID")
	private String lvlId;
    
	@Column(name="REGION_NAME")
	private String regionName;
    
	@Column(name="REGION_DESC")
	private String regionDesc;

	// Constructors

	/** default constructor */
	public TbDimRegion() {
	}

	/** minimal constructor */
	public TbDimRegion(String regionId) {
		this.regionId = regionId;
	}

	/** full constructor */
	public TbDimRegion(String regionId, String regionParentId, String lvlId,
			String regionName, String regionDesc) {
		this.regionId = regionId;
		this.regionParentId = regionParentId;
		this.lvlId = lvlId;
		this.regionName = regionName;
		this.regionDesc = regionDesc;
	}

	// Property accessors

	public String getRegionId() {
		return this.regionId;
	}

	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}

	public String getRegionParentId() {
		return this.regionParentId;
	}

	public void setRegionParentId(String regionParentId) {
		this.regionParentId = regionParentId;
	}

	public String getLvlId() {
		return this.lvlId;
	}

	public void setLvlId(String lvlId) {
		this.lvlId = lvlId;
	}

	public String getRegionName() {
		return this.regionName;
	}

	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}

	public String getRegionDesc() {
		return this.regionDesc;
	}

	public void setRegionDesc(String regionDesc) {
		this.regionDesc = regionDesc;
	}

}