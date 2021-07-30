package org.kosta.myproject.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.mapper.RecordMapper;
import org.kosta.myproject.model.vo.RecordVO;
import org.springframework.stereotype.Service;

@Service
public class RecordServiceImpl implements RecordService{
	@Resource
	private RecordMapper recordMapper;
	
	@Override
	public void registerRecordMember(String id, String revTime, String resNo) {
		recordMapper.registerRecordMember(id,revTime,resNo);
	}

	@Override
	public List<RecordVO> findRecordByIdAndResNo(String memberId, String resNo) {
		return recordMapper.findRecordByIdAndResNo(memberId,resNo);
	}

	@Override
	public void updateCheck(String memberId, String recordTime, String resNo) {
		recordMapper.updateCheck(memberId,recordTime,resNo);
	}

	@Override
	public void deleteRecord(String revTime, String id, String resNo) {
		recordMapper.deleteRecord(revTime,id,resNo);
		
	}

}
