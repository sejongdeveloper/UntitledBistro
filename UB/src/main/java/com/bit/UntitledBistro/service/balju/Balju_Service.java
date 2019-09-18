package com.bit.UntitledBistro.service.balju;

import java.util.List;
import java.util.Map;

import com.bit.UntitledBistro.model.balju.Balju_DTO;
import com.bit.UntitledBistro.model.balju.Balju_PlanDTO;
import com.bit.UntitledBistro.model.balju.Balju_SaveDTO;

public interface Balju_Service {

	void insert_Balju_Plan(Balju_PlanDTO BPdto);
	void insert_Balju(Balju_DTO Bdto);
	void insert_Balju_Save(Balju_SaveDTO BSdto);

	List<Map<String,String>> balju_Plan_list(Balju_PlanDTO BPdto);
	List<Map<String,String>> balju_List(Balju_DTO Bdto);
	List<Map<String,String>> balju_Save_list(Balju_SaveDTO BSdto);
	
	void balju_Plan_modi(Balju_PlanDTO BPdto);
	void balju_Modi(Balju_DTO Bdto);
	void balju_Save_modi(Balju_SaveDTO BSdto);
	
	void Delete_Balju_Plan(Balju_PlanDTO BPdto);
	void Delete_Balju(Balju_DTO Bdto);
	void Delete_Balju_Save(Balju_SaveDTO BSdto);

	
	
}