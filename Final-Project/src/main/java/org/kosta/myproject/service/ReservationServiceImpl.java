package org.kosta.myproject.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.myproject.model.mapper.ReservationMapper;
import org.kosta.myproject.model.vo.ReservationVO;
import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl implements ReservationService{
	@Resource
	private ReservationMapper reservationMapper;
	
	@Override
	public void registerReservation(ReservationVO resVO) {
		reservationMapper.registerReservation(resVO);
	}

	@Override
	public List<ReservationVO> findReservationById(String id) {
		return reservationMapper.findReservationById(id);
	}

	public List<ReservationVO> getReservationListByDay(String revTime, String resNo) {
		return reservationMapper.getReservationListByDay(revTime,resNo);
	}

	@Override
	public String getReservationListByTime(String hour) {
		return reservationMapper.getReservationListByTime(hour);
	}

	@Override
	public List<ReservationVO> getReservationByIdAndResNo(String id, String resNo) {
		return reservationMapper.getReservationByIdAndResNo(id,resNo);
	}
	
	@Override
	public String findRestaurantDetailLoc(String resNo) {
		return reservationMapper.findRestaurantDetailLoc(resNo);
	}

	@Override
	public void deleteReservation(String revNo) {
		reservationMapper.deleteReservation(revNo);
	}

	@Override
	public void deleteReservationRecord(String record_no) {
		reservationMapper.deleteReservationRecord(record_no);
	}
}
