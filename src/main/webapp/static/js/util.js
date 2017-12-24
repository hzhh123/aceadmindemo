function date2Str(date){
    if(isNull(date)){
        return "";
    }
    var y = date.getFullYear();
    if(y > 1985 && y < 1992) {
        //夏令时的处理,确保不会少一个小时
        date = new Date(date.getTime() + 3600*1000);
    }
    y = date.getFullYear();
    var m = date.getMonth() + 1;
    if(m<10) m = "0" + m;
    var d = date.getDate();
    if(d<10) d = "0" + d;
    var redate = y + "-" + m + "-" + d;
    return redate;
}


function datetime2Str(dt){
    if(dt==null){
        return "";
    }
    var datetime=new Date(dt);
    var y = datetime.getFullYear();
    var m = datetime.getMonth() + 1;
    if(m < 10) m = "0" + m;
    var d = datetime.getDate();
    if(d < 10) d = "0" + d;
    var h = datetime.getHours();
    if(h < 10) h = "0" + h;
    var min = datetime.getMinutes();
    if(min < 10) min = "0" + min;
    var s=datetime.getSeconds();
    if(s<10)s="0"+s;
    var redatetime = y + "-" + m + "-" + d + " " + h + ":" + min+":"+s;
    return redatetime;
};

/**
 * 获取URL指定参数值。
 * @param {String} name
 */
String.prototype.getQueryString = function(name) {
    var reg = new RegExp("(^|&|\\?)" + name + "=([^&]*)(&|$)");
    var r = this.match(reg);
    if (r) {
        return decodeURIComponent(r[2]);
    }
    return null;
};
$.getQueryString = function (name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return decodeURIComponent(r[2]); return null;
}
/**
 * 是否为空或空字符串
 */
function isNull(obj) {
    if(typeof(obj) == "number") return false;
    if(typeof(obj) == "undefined" || obj == null || !obj || ( typeof(obj) == "string" && obj.trim() == "" )) {
        return true;
    } else {
        return false;
    }
}

/**
 * 验证输入的手机号码是否符合当前实际存在的手机号码
 *
 */
function checkMobile(s){
    var req = new RegExp("^1[358][0-9]{9}$");
    if(!isNumber(s)){
        return false;
    }else{
        if(s !='' && s.search(req) == -1){
            return false;
        }else{
            return true;
        }
    }
}

//验证形如 带区号横杠的电话
function checkPhone(s){
    var req1 = new RegExp("^0([0-9]{2,3})\-([0-9]{7,8})$");
    var req2 = new RegExp("^0([0-9]{2,3})([0-9]{7,8})$");
    if(s !=''&& s.search(req1) == -1 && s.search(req2) == -1 ){
        return false;
    }
    else{
        return true;
    }
}

//验证电子邮箱
function isMailBoxAddress(s){
    //对电子邮件的验证
    var myreg = /^([a-zA-Z0-9_\-]+[_|\_|\.]?)*[a-zA-Z0-9_\-]+@([a-zA-Z0-9_\-]+[_|\_|\.|\-]?)*[a-zA-Z0-9_\-]+\.[a-zA-Z]{2,3}$/;
    if(!myreg.test(s))
    {
        return false;
    } else {
        return true;
    }
}

/**@2012-10-09
 * 验证IPv4地址合法性
 *
 */
function isIpv4(obj) {
    if(obj != null && obj != "" && obj.length > 0){
        if(obj.match( "^(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\."
                +"(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\."
                +"(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\."
                +"(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])$")!=null) {
            return true;
        } else {
            return false;
        }
    }
    return false;
}

function isMoney( s ){
    if(s==null || s=="")
        return true;
    s = s + "";
    //不带负数 "^[0-9]+[\.]{0,1}[0-9]{0,2}$";
    var regu ="^\-?[0-9]+[\.]{0,1}[0-9]{0,2}$";
    var re = new RegExp(regu);
    if (re.test(s)) {
        return true;
    } else {
        return false;
    }
}

function checkMoney(obj) {
    if(obj != null) {
        var value = obj.value;
        if(!isMoney(value)) {
            if(isNumber(value)) obj.value = round(value,2);
            else obj.value = "0";
        }
    }
}

function isNumber( s ){
    if(s==null || s=="")
        return true;

    s = s + "";

    if(s.charAt(0) == '.') return false;

    var regu = "^\-?[0-9.]+$";
    var re = new RegExp(regu);
    if (s.search(re) != -1) {
        return true;
    } else {
        return false;
    }
    return true;
}

function checkNumber(obj) {
    if(obj != null && !isNumber(obj.value)) {
        obj.value = "0";
    }
}

//金额大写
function upperMoney(num) {
    var pref = "";
    num = Number(num);
    if(num < 0) {
        pref = "负";
        num = Math.abs(num);
    }

    var strOutput = "";
    var strUnit = '仟佰拾亿仟佰拾万仟佰拾元角分';
    num += "00";
    var intPos = num.indexOf('.');
    if (intPos >= 0) {
        num = num.substring(0, intPos) + num.substr(intPos + 1, 2);
    }
    strUnit = strUnit.substr(strUnit.length - num.length);
    for (var i=0; i < num.length; i++) {
        strOutput += '零壹贰叁肆伍陆柒捌玖'.substr(num.substr(i,1),1) + strUnit.substr(i,1);
    }
    return pref + strOutput.replace(/零角零分$/, '整').replace(/零[仟佰拾]/g, '零').replace(/零{2,}/g, '零').replace(/零([亿|万])/g, '$1').replace(/零+元/, '元').replace(/亿零{0,3}万/, '亿').replace(/^元/, "零元");
}