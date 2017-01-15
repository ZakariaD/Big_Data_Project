package com.j2eeproject.mscbgd;


/**
 * class R_CODE : contains all information about an R script
 *  
 */

public class R_CODE
{
	private int codeId;
	private String codeName;
	private String codeScript;
	
	
	public int getCodeId() {
        return this.codeId;
    }
    public void setCodeId(int id) {
        this.codeId = id;
    }
    
	public String getCodeName() {
        return this.codeName;
    }
    public void setCodeName(String name) {
        this.codeName = name;
    }
    public String getCodeScript() {
        return this.codeScript;
    }
    public void setCodeScript(String script) {
        this.codeScript = script;
    }
}


