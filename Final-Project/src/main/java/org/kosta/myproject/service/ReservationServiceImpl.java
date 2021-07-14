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
	public List<ReservationVO> getReservationListByDay(String revTime, String resNo) {
		return reservationMapper.getReservationListByDay(revTime,resNo);
	}

	@Override
	public String getReservationListByTime(String hour) {
		return reservationMapper.getReservationListByTime(hour);
	}
}
