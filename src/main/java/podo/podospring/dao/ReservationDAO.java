package podo.podospring.dao;

import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import podo.podospring.common.dao.AbstractDAO;
import podo.podospring.common.ReturnException;

@Repository
public class ReservationDAO extends AbstractDAO {

    @SuppressWarnings("unchecked")
    public HashMap<String, Object> getCalendar(HashMap<String, Object> params) {

        String nowDate = (String)selectOne("reservation.nowDate",params);

        HashMap<String, Object> resultMap = (HashMap<String, Object>)selectOne("reservation.getCalendarQuery1",params);
        params.put("minDay",resultMap.get("MINDAY"));
        params.put("maxDay",resultMap.get("MAXDAY"));

        List<HashMap<String, Object>> resultList = selectList("reservation.getCalendarQuery2",params);
        resultMap.put("rows",resultList);
        resultMap.put("date",nowDate);
        resultMap.put("resultCode","0000");

        return resultMap;
    }

    @SuppressWarnings("unchecked")
    public HashMap<String, Object> getTeeList(HashMap<String, Object> params) {
        List<HashMap<String, Object>> resultList = selectList("reservation.getTeeQuery1",params);
        params.put("rows",resultList);
        int monthWeek = selectCnt("reservation.getTeeQuery2",params);
        params.put("monthWeek",monthWeek);

        HashMap<String, Object> weekCntMap = (HashMap<String, Object>)selectOne("reservation.getTeeQuery3",params);
        params.put("weekDayCnt",weekCntMap.get("WEEK_DAY_CNT"));
        params.put("weekEndCnt",weekCntMap.get("WEEK_END_CNT"));

        params.put("resultCode","0000");



        return params;
    }

    @SuppressWarnings("unchecked")
    @Transactional(rollbackFor = {Exception.class})
    public HashMap<String, Object> changeReservation(HashMap<String, Object> params)
            throws ReturnException {
        try {
            int bkCnt = selectCnt("reservation.changeReservation1", params);
            if (bkCnt > 0) {
                params.put("M","M");
                params.put("HOMEPAGE","HOMEPAGE");
                selectOne("reservation.changeReservation2", params);
                params.put("sResult", params.get("RESULT"));
                Object sResult = params.get("sResult");
                if (sResult.equals("0000")) {
                    //TODO ????????????
                    //SP_SMS_SEND coDiv, "10001", phone, "", bDate, bCos, bTime, msName, msNum, "", "", "HOMEPAGE", ip, aDate, aCos, aTime
                    params.put("resultCode", "0000");
                } else {
                    params.put("resultCode", params.get("sResult"));
                    if (params.get("resultCode").equals("2000")) {
                        params.put("resultMessage", "?????? ?????? ????????? ????????? ???????????????. ?????? ????????? ????????? ?????????.");
                    } else if (params.get("resultCode").equals("3000")) {
                        params.put("resultMessage", "????????? ???????????? ????????? ??????????????????.");
                    } else if (params.get("resultCode").equals("4000")) {
                        params.put("resultMessage", "???????????? ??? ???????????????. ?????? ?????? ???????????????.");
                    } else {
                        params.put("resultMessage", "????????? ?????????????????????. ?????? ????????? ?????????.");
                    }
                    throw new Exception();
                }
            } else {
                params.put("resultMessage", "????????? ????????? ????????????.");
                throw new Exception();
            }
        } catch (Exception e) {
            throw new ReturnException(params,"????????? ????????? ??????");
        }
        return params;
    }

    @SuppressWarnings("unchecked")
    @Transactional(rollbackFor = {Exception.class})
    public HashMap<String, Object> doReservation(HashMap<String, Object> params) throws Exception{

        HashMap<String, Object> resultMap = (HashMap<String, Object>)selectOne("reservation.reservationQuery1",params);
        params.forEach((key, value) -> resultMap.merge(key, value, (v1, v2) -> v2));
        System.out.println(resultMap);
        try{
            resultMap.put("msName",resultMap.get("MS_NAME"));
            resultMap.put("msDivision",resultMap.get("MS_DIVISION"));
            resultMap.put("msClass",resultMap.get("MS_CLASS"));
            resultMap.put("msLevel",resultMap.get("MS_LEVEL"));
            resultMap.put("phone",resultMap.get("MS_PHONE1"));
            resultMap.put("msPhone1",resultMap.get("MS_FIRST_PHONE1"));
            resultMap.put("msPhone2",resultMap.get("MS_MID_PHONE1"));
            resultMap.put("msPhone3",resultMap.get("MS_LAST_PHONE1"));

            resultMap.put("sResult","0000");
            resultMap.put("marketCd","002");
            resultMap.put("businessCd","001");

            int vCount1 = selectCnt( "reservation.vCount1",resultMap);
            if (vCount1 >= 1) {
                resultMap.put("sResult","2000");
            }
            int vCount2 = selectCnt( "reservation.vCount2",resultMap);
            if (vCount2 >= 1) {
                resultMap.put("sResult","3000");
            }
            int vCount3 = selectCnt( "reservation.vCount3",resultMap);
            if (resultMap.get("MS_DIVISION").equals("21")) {
                if (vCount3 >= 2) {
                    resultMap.put("sResult","5000");
                }
            }
            update("reservation.reservationQuery2",resultMap);
            int vCount4 = selectCnt( "reservation.vCount4",resultMap);
            if (vCount4 == 0) {
                resultMap.put("sResult","2000");
            }
            int bkSeq = selectCnt( "reservation.bkSeq",resultMap);
            resultMap.put("bkSeq",bkSeq);

            insert("reservation.reservationQuery3",resultMap);

            if (resultMap.get("sResult").equals("0000")) {
    //          TODO ?????????????????? SMS ?????? ??????
    //            SP_SMS_SEND coDiv, "10000", phone, "", sDate, sCos, sTime, msName, msNum, "", "", "HOMEPAGE", ip, "", "", ""
                resultMap.put("resultCode", "0000");
            } else {
                resultMap.put("resultCode", resultMap.get("sResult"));
                //TODO ???????????? ?????????(sResult 1000) (sResult 4000)?????? ????????? ??????
                if (resultMap.get("sResult").equals("1000")) {
                    resultMap.put("resultMessage", "??????????????? ?????? ???????????? ????????????.");
                } else if (resultMap.get("sResult").equals("2000")) {
                    resultMap.put("resultMessage", "?????? ?????? ????????? ????????? ???????????????. ?????? ????????? ????????? ?????????.");
                } else if (resultMap.get("sResult").equals("3000")) {
                    resultMap.put("resultMessage", "????????? ???????????? ????????? ??????????????????.");
                } else if (resultMap.get("sResult").equals("4000")) {
                    resultMap.put("resultMessage", "?????? ??? ??????????????? ?????? ?????????????????????.");
                } else if (resultMap.get("sResult").equals("5000")) {
                    resultMap.put("resultMessage", "?????? ??? ??????????????? ?????? ?????????????????????.");
                } else {
                    resultMap.put("resultMessage", "????????? ?????????????????????. ?????? ????????? ?????????.");
                }
                throw new Exception();
            }
        } catch(Exception e) {
            throw new ReturnException(resultMap,"????????? ????????? ??????");
        }

        return resultMap;
    }

    @SuppressWarnings("unchecked")
    public HashMap<String, Object> getReservationList(HashMap<String, Object> params) {
        List<HashMap<String, Object>> getReservationList = selectList("reservation.getReservationList",params);
        params.put("rows",getReservationList);

        params.put("resultCode","0000");
        params.put("resultMessage","");

        return params;
    }

    @SuppressWarnings("unchecked")
    public HashMap<String, Object> blDeleteReservation(HashMap<String, Object> params) {
        return params;
    }

    @SuppressWarnings("unchecked")
    @Transactional(rollbackFor = {Exception.class})
    public HashMap<String, Object> cancelReservation(HashMap<String, Object> params)
            throws ReturnException {

        HashMap<String, Object> resultMap = (HashMap<String, Object>)selectOne("reservation.cancelReservationQuery1",params);
        params.forEach((key, value) -> resultMap.merge(key, value, (v1, v2) -> v2));

        try{
            resultMap.put("msName",resultMap.get("MS_NAME"));
            resultMap.put("phone",resultMap.get("MS_PHONE1"));

            int diff = selectCnt("reservation.cancelReservationQuery2",resultMap);
            resultMap.put("cancelYn","Y");
            if (diff < 5) {
                resultMap.put("cancelYn","N");
            }
            LocalTime now = LocalTime.now();
            int hour = now.getHour();
            if (diff == 5 && hour <17) {
                resultMap.put("cancelYn","Y");
            }

            if (resultMap.get("cancelYn").equals("N")) {
                resultMap.put("resultCode", "2000");
                resultMap.put("resultMessage", "??????????????? ???????????? ??????????????? ??????????????????.");
            } else {
                resultMap.put("RESULT","");
                selectOne("reservation.cancelReservationQuery3",resultMap);
                if (resultMap.get("RESULT").equals("0000")) {
                    // TODO ????????????
                    // SP_SMS_SEND coDiv, "10002", phone, "", sDate, sCos, sTime, msName, msNum, "", "", "HOMEPAGE", ip, "", "", ""
                    resultMap.put("resultCode", "0000");
                } else {
                    resultMap.put("resultCode", (String)resultMap.get("RESULT"));

                    if (resultMap.get("resultCode").equals("1000")) {
                        resultMap.put("resultMessage", "???????????? ??? ???????????????. ?????? ?????? ???????????????.");
                    } else {
                        resultMap.put("resultMessage", "???????????? ?????????????????????. ?????? ????????? ?????????.");
                    }
                    throw new Exception();
                }
            }
        } catch(Exception e) {
            throw new ReturnException(resultMap,"????????? ????????? ??????");
        }
        return resultMap;
    }
}
