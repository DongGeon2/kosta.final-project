package org.kosta.myproject.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.kosta.myproject.model.vo.ReservationVO;

@Mapper
public interface ReservationMapper {

	void registerReservation(ReservationVO resVO);

}
