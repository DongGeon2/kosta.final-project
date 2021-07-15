package org.kosta.myproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.vo.RecordVO;

@Mapper
public interface RecordMapper {

	void registerRecordMember(String id, String revTime, String resNo);

	List<RecordVO> findRecordByIdAndResNo(String id, String resNo);

	void updateCheck(String memberId, String recordTime, String resNo);

}
