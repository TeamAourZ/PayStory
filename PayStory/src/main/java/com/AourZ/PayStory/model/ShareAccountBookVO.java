package com.AourZ.PayStory.model;

public class ShareAccountBookVO {
	private String participant_list[];
	private String participant;
	private String owner;
	
	public String[] getParticipant_list() {
		return participant_list;
	}
	public void setParticipant_list(String participant_list[]) {
		this.participant_list = participant_list;
	}
	public String getParticipant() {
		return participant;
	}
	public void setParticipant(String participant) {
		this.participant = participant;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
			
}


