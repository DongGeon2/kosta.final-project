package org.kosta.myproject.service;

import java.util.List;

import org.kosta.myproject.model.vo.ReservationVO;

public interface ReservationService {

	void registerReservation(ReservationVO resVO);

	List<ReservationVO> findReservationById(String id);

	List<ReservationVO> getReservationListByDay(String revTime, String resNo);

	String getReservationListByTime(String hour);

	List<ReservationVO> getReservationByIdAndResNo(String id, String resNo);

	String findRestaurantDetailLoc(String resNo);
}
