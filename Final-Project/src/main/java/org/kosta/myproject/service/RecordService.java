package org.kosta.myproject.service;

import java.util.List;

import org.kosta.myproject.model.vo.RecordVO;

public interface RecordService {

	void registerRecordMember(String id, String revTime, String resNo);

	List<RecordVO> findRecordByIdAndResNo(String memberId, String resNo);

	void updateCheck(String memberId, String recordTime, String resNo);

	void deleteRecord(String revTime, String id, String resNo);

}
