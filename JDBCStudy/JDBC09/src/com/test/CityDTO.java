/**
 * 
 */
package com.test;

/**
 * @author sist
 *
 */
public class CityDTO
{
    private int cityId;
    private String cityLoc;
    
    //---- setter / getter -----
    /**
     * @return the cityId
     */
    public int getCityId()
    {
        return cityId;
    }
    /**
     * @param cityId the cityId to set
     */
    public void setCityId(int cityId)
    {
        this.cityId = cityId;
    }
    /**
     * @return the cityLoc
     */
    public String getCityLoc()
    {
        return cityLoc;
    }
    /**
     * @param cityLoc the cityLoc to set
     */
    public void setCityLoc(String cityLoc)
    {
        this.cityLoc = cityLoc;
    }

}
