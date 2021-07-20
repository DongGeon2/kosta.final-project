package org.kosta.myproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.vo.ReservationVO;

@Mapper
public interface ReservationMapper {

	void registerReservation(ReservationVO resVO);

	List<ReservationVO> findReservationById(String id);

	List<ReservationVO> getReservationListByDay(String revTime, String resNo);

	String getReservationListByTime(String hour);

	List<ReservationVO> getReservationByIdAndResNo(String id, String resNo);

	String findRestaurantDetailLoc(String resNo);
	
	void deleteReservation(String revNo);

	void deleteReservationRecord(String record_no);
}
