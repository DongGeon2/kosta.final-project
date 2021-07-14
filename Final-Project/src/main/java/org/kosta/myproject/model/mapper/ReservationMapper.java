package org.kosta.myproject.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.vo.ReservationVO;

@Mapper
public interface ReservationMapper {

	void registerReservation(ReservationVO resVO);

	List<ReservationVO> findReservationById(String id);

}
