
/**
 * name=10&minWeight=100 -> {name:10,minWeight：100}
 * @param paramsAndValues
 * @returns {___anonymous82_83}
 */
function conveterParamsToJson(paramsAndValues) {  
	//jsonObj:定义空的json对象（没有属性）
    var jsonObj = {};  
  
    var param = paramsAndValues.split("&");  
    for ( var i = 0; param != null && i < param.length; i++) {  
        var para = param[i].split("=");  
        //para[0]: 代表参数名称
        //para[1]: 代表参数值
        
        //jsonObj[name] = 10: 给jsonObj的json对象添加name属性，且赋值10  {name:10}
        jsonObj[para[0]] = para[1];  
    }  
  
    return jsonObj;  
}  
 
/**
 * 将表单数据封装为json
 * @param form
 * @returns
 */
function getFormData(form) {  // searchForm
	//formValues: name=10&minWeight=100
    var formValues = $("#" + form).serialize();  
    // decodeURIComponent(formValues): url编码
    return conveterParamsToJson(decodeURIComponent(formValues));  
}  