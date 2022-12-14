/**
 * @constructor
 * @description ITSONE API
 * @author soonhyeong
 * @version 0.0.1
 * @date 19. 01. 22
 */

// 자바처럼 쓰기 위해 작성
String.format = function() {
    var s = arguments[0];
    for (var i = 0; i < arguments.length - 1; i++) {
        var reg = new RegExp("\\{" + i + "\\}", "gm");
        s = s.replace(reg, arguments[i + 1]);
    }
    return s;
};

// replace All
function replaceAll(str, searchStr, replaceStr) {
	  return str.split(searchStr).join(replaceStr);
}

// 특수문자 변환
function convertSpecialCharacters(content) {
	var returnValue = content;

	returnValue = replaceAll(returnValue, "&#039;", "'");
	returnValue = replaceAll(returnValue, "&amp;amp;", "&");
	returnValue = replaceAll(returnValue, "&amp;", "&");
	returnValue = replaceAll(returnValue, "&lt;", "<");
	returnValue = replaceAll(returnValue, "&gt;", ">");
	returnValue = replaceAll(returnValue, "&quot;", "\"");

	return returnValue;
}

// 서버 통신
function mAjax(sUrl, params, method, proYn, fnSuccess) {
  if(proYn) {
    progressStart();
  }

  var fnError = function(jqXHR, textStatus, errorThrown) {
    progressStop();
    //alert("서버와의 통신에 오류가 있습니다. 잠시 후 다시 시도하여 주세요.");
  };

  if(method == "GET") {
    var sParams = "";
    var i = 0;

    for(var key in params) {
      if(i == 0) {
        sParams += String.format("{0}={1}", key, params[key]);
      } else {
        sParams += String.format("&{0}={1}", key, params[key]);
      }
      i++;
    }

    console.log(sUrl + "?" + sParams);

    setTimeout(function() {
      $.ajax({ "async" : true
        , "type" : "GET"
        , "url" : sUrl
        , "data" : encodeURI(sParams)
        , "cache" : false
        , "success" : function(data) {
          if(proYn) {
            progressStop();
          }
          fnSuccess(data);
        }
        , "error" : fnError
        , "dataType" : "json"
        , "contentType" : "application/json; charset=utf-8"
      });
    }, 300);
  } else if(method == "POST") {
  	setTimeout(function() {
      $.ajax({ "async" : true
      	, "type" : "POST"
    		, "url" : sUrl
    		, "data" : params
    		, "cache" : false
    		, "success" : function(data) {
          if(proYn) {
            progressStop();
          }
    			//var obj = JSON.parse(data);
    			var obj = data;
    			fnSuccess(obj);
    		}
    		, "error" : fnError
      });
  	}, 300);
  }
}

function mFileAjax(sUrl, formData, fnSuccess) {
	var fnError = function(jqXHR, textStatus, errorThrown) {
		progressStop();
        alert("서버와의 통신에 오류가 있습니다. 잠시 후 다시 시도하여 주세요.");
    };

    if (fnSuccess != null) {
    	$.ajax({
            type : 'post',
            url : sUrl,
            data : formData,
            processData : false,
            contentType : false,
            success : function(data) {
            	// fnSuccess(JSON.parse(data));
							fnSuccess(data);
            },
            error : fnError
        });
    }
}

function numberWithCommas(n) {
	if(n == null || n == "") {
		return "0";
	} else {
		return n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
}

/*
 * 캘린더 생성
 * */
function getCalendar(year, month) {
	var returnObj = [];
	var lastDay = new Date(year, Number(month), 0).dd();

	for(day=1; day<=lastDay; day++) {
		var tmpObj;
		var d = new Date(year, Number(month) - 1, day);

		tmpObj = {
			"date" : d.yyyymmdd(),
			"day" : d.dd(),
			"week" : d.weeknum() + 1
		}

		returnObj.push(tmpObj);
	}

	return returnObj;
}

/* 날짜 포맷
 * ex) new Date().yyyymmdd()
 *  */
function getDateFormat(sDate) {
	return new Date(sDate.substring(0, 4) + "-" + sDate.substring(4, 6) + "-" + sDate.substring(6, 8))
}

function addDate(sDate, value) {
	var day = Number(sDate.substring(6, 8)) + value;

	return new Date(sDate.substring(0, 4), Number(sDate.substring(4, 6)) - 1, day);
}

function addMonth(sDate, value) {
	var month = Number(sDate.substring(4, 6)) + (value - 1);

	return new Date(sDate.substring(0, 4), month, 1);
}

function addMonth2(sDate, value) {
	var month = Number(sDate.substring(4, 6)) + (value - 1);

	return new Date(sDate.substring(0, 4), month, Number(sDate.substring(6, 8)));
}

Date.prototype.yyyymmddhhmm = function() {
	var mm = this.getMonth() + 1;
	var dd = this.getDate();
	var hh = this.getHours();
	var mi = this.getMinutes();

	return [this.getFullYear(), (mm>9 ? '' : '0') + mm, (dd>9 ? '' : '0') + dd, (hh>9 ? '' : '0') + hh, (mi>9 ? '' : '0') + mi].join('');
};

Date.prototype.yyyymmdd = function() {
	var mm = this.getMonth() + 1;
	var dd = this.getDate();

	return [this.getFullYear(), (mm>9 ? '' : '0') + mm, (dd>9 ? '' : '0') + dd].join('');
};

Date.prototype.yyyymm = function() {
	var mm = this.getMonth() + 1;

	return [this.getFullYear(), (mm>9 ? '' : '0') + mm].join('');
};

Date.prototype.yyyy = function() {
	return this.getFullYear();
};

Date.prototype.mm = function() {
	var mm = this.getMonth() + 1;

	return (mm>9 ? '' : '0') + mm;
};

Date.prototype.dd = function() {
	var dd = this.getDate();

	return (dd>9 ? '' : '0') + dd;
};

Date.prototype.week = function() {
	var week = ['일', '월', '화', '수', '목', '금', '토'];

	var dayOfWeek = week[this.getDay()];

	return dayOfWeek;
};

Date.prototype.hh = function() {
	var hh = this.getHours();

	return (hh>9 ? '' : '0') + hh;
};

Date.prototype.weeknum = function() {
	return this.getDay();
};

function getTimeStamp() {
  var d = new Date();
  var s = leadingZeros(d.getFullYear(), 4) + leadingZeros(d.getMonth() + 1, 2) + leadingZeros(d.getDate(), 2) +
          leadingZeros(d.getHours(), 2) + leadingZeros(d.getMinutes(), 2) + leadingZeros(d.getSeconds(), 2);

  return s;
}

function leadingZeros(n, digits) {
  var zero = '';
  n = n.toString();

  if (n.length < digits) {
    for (i = 0; i < digits - n.length; i++)
      zero += '0';
  }
  return zero + n;
}

/* 폰 번호 포멧 */
function phoneNumberFormat(phone, div) {
	return phone.substring(0, 3) + div + phone.substring(3, 7) + div + phone.substring(7, 11);
}

/* 프로그래스 모달 */
function progressStart() {
	$.preloader.start({
        modal: true,
        src : "/images/sprites.png"
    });
}

function progressStop() {
    $.preloader.stop();
}

var setCookie = function(name, value, day) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + day);

	var cookie_value = escape(value) + '; expires=' + exdate.toUTCString();
	document.cookie = name + '=' + cookie_value;
};

var getCookie = function(name) {
	var x, y;
	var val = document.cookie.split(';');

	for (var i = 0; i < val.length; i++) {
		x = val[i].substr(0, val[i].indexOf('='));
		y = val[i].substr(val[i].indexOf('=') + 1);
		x = x.replace(/^\s+|\s+$/g, '');
		if (x == name) {
		  return unescape(y);
		}
	}
};

/**
 * 파일명에서 확장자명 추출
 * @param filename   파일명
 * @returns _fileExt 확장자명
 */
function getExtensionOfFilename(filename) {
    var _fileLen = filename.length;

    /**
     * lastIndexOf('.')
     * 뒤에서부터 '.'의 위치를 찾기위한 함수
     * 검색 문자의 위치를 반환한다.
     * 파일 이름에 '.'이 포함되는 경우가 있기 때문에 lastIndexOf() 사용
     */
    var _lastDot = filename.lastIndexOf('.');

    // 확장자 명만 추출한 후 소문자로 변경
    var _fileExt = filename.substring(_lastDot + 1, _fileLen).toLowerCase();

    return _fileExt;
}

/**
 * 테이블 정렬
 * @param type - s : 문자, n : 숫자
 * @param order - asc : 오름차순, desc : 내림차순
 */
function sortTable(selector, type, order, n) {
	var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;

	table = document.getElementById(selector);
	switching = true;
	dir = order;
	while (switching) {
		switching = false;
		rows = table.rows;
		for (i = 0; i < (rows.length - 1); i++) {
			shouldSwitch = false;
			x = rows[i].getElementsByTagName("TD")[n];
			y = rows[i + 1].getElementsByTagName("TD")[n];

			if(type == "n") {
				var x1 = Number(replaceAll(x.innerHTML, ",", ""));
				var y1 = Number(replaceAll(y.innerHTML, ",", ""));

				if (dir == "asc") {
					if (x1 > y1) {
						shouldSwitch = true;
						break;
					}
				} else if (dir == "desc") {
					if (x1 < y1) {
						shouldSwitch = true;
						break;
					}
				}
			} else if (type == "s") {
				if (dir == "asc") {
					if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
						shouldSwitch = true;
						break;
					}
				} else if (dir == "desc") {
					if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
						shouldSwitch = true;
						break;
					}
				}
			}
		}
		if (shouldSwitch) {
			rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
			switching = true;
			switchcount++;
		}
	}
}

function ValidateNumber(pm_obj){
    var e1 = event.srcElement;
    var num="0123456789";
    event.returnValue = true;

    for (var i=0;i<e1.value.length;i++)
    if (-1 == num.indexOf(e1.value.charAt(i)))
       event.returnValue = false;

    if (!event.returnValue) {
      alert("숫자만 입력가능합니다.");
      pm_obj.value = "";
      pm_obj.focus();
    }
}

function isImage(fileName) {
  var rValue = false;
  var s = getExtensionOfFilename(fileName);
  s = s.toLowerCase();

  switch(s) {
    case "bmp":
    case "gif":
    case "jpg":
    case "jpeg":
    case "png":
      rValue = true;
      break;
  }

  return rValue;
}


function moveScroll(selector, add) {
	var offset = $(selector).offset();
    $('html, body').animate({scrollTop : offset.top + add}, 400);
}
