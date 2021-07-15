package org.kosta.myproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.vo.ReservationVO;

@Mapper
public interface ReservationMapper {

	void registerReservation(ReservationVO resVO);

	List<ReservationVO> getReservationListByDay(String revTime, String resNo);

	String getReservationListByTime(String hour);

	List<ReservationVO> findReservationById(String memberId, String resNo);

	List<ReservationVO> getReservationByIdAndResNo(String id, String resNo);

}
