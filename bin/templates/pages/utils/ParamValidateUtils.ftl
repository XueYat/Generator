package ${package}.utils;

import java.util.List;

/**
* @author ${author}
* @date ${date} ${time}
*/
public class ParamValidateUtils {
	/**
	 * 判断字符串是否为空
	 * @param value
	 * @return
	 */
	public static Boolean isEmpty(String value) {
		return value == null || value.trim().length() == 0;
	}

	/**
	 * 判断是否为空
	 * @param obj
	 * @return
	 */
	public static Boolean isEmpty(Object obj) {
		return null == obj || "".equals(obj);
	}

	/**
	 * 判断list是否为空
	 * @param list
	 * @return
	 */
	public static Boolean listIsNull(List list) {
		return list == null || list.size() == 0;
	}
	
	/**
	 * 判断Long数据是否为空
	 * @param value
	 * @return
	 */
	public static Boolean isNull(Long longValue) {
		return null == longValue || longValue == 0;
	}

	/**
	 * 判断Int数据是否为空
	 * @param value
	 * @return
	 */
	public static Boolean isNull(Integer intValue) {
		return null == intValue || intValue == 0;
	}
	
	/**
	 * 判断Int数据是否为空 0不属于空
	 * @param intValue
	 * @return
	 */
	public static Boolean isNullNotContainZero(Integer intValue) {
		return null == intValue;
	}

	public static void main(String[] args) {
		String a = "2017-01a-sss";
		System.out.println(a.lastIndexOf("-"));
		System.out.println(a.indexOf("-"));
		System.out.println(a.substring(7, a.lastIndexOf("-")));
		System.out.println(a.substring(a.lastIndexOf("-") + 1));
	}
}
