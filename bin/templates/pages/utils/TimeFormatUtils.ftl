package ${package}.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author ${author}
 * @date ${date} ${time}
 */
public class TimeFormatUtils {
	/**
	 * @param time time
	 * @return String
	 */
	public static final String formatDate(Long time) {
		if (time == null) {
			return "";
		}
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(time);
	}

	/**
	 * @param time time
	 * @return String
	 */
	public static final String formatTime(Long time) {
		if (time == null) {
			return "";
		}
		DateFormat df = new SimpleDateFormat("HH:mm:ss");
		return df.format(time);
	}

	/**
	 * @param time time
	 * @return String
	 */
	public static final String formatDateTime(Long time) {
		if (time == null) {
			return "";
		}
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return df.format(time);
	}

	/**
	 * @param time time
	 * @return String
	 */
	public static final String formatDateTimeNoLine(Long time) {
		if (time == null) {
			return "";
		}
		DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		return df.format(time);
	}

	/**
	 * @param time time
	 * @return Date
	 */
	public static final Date formatStringToDate(String time) {
		if (time == null) {
			return null;
		}
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = dateFormat.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	/**
	 * @param time time
	 * @return Date
	 */
	public static final Date formatStringToTime(String time) {
		if (time == null) {
			return null;
		}
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		;
		Date date = null;
		try {
			date = dateFormat.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	/**
	 * @param time time
	 * @return Date
	 */
	public static final Date formatStringToTime(Long time) {
		if (time == null) {
			return null;
		}
		String tempTime = formatTime(time);
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Date date = null;
		try {
			date = dateFormat.parse(tempTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	private static final DateFormat longDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static final DateFormat shortDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static final DateFormat compactDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
	private static final DateFormat millisecondDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	private static final DateFormat simpleDateFormat = new SimpleDateFormat("yyMM");
	/*private static final DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");*/

	/**
	 * 返回当前日期，表现形式：yyyy-MM-dd HH:mm:ss
	 * @return String
	 */
	public static String formatLongDate() {
		return longDateFormat.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyy-MM-dd
	 * @return String
	 */
	public static String formatShortDate() {
		return shortDateFormat.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyyMMddHHmmss
	 * @return String
	 */
	public static String formatCompactDate() {
		return compactDateFormat.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyyMMddHHmmssSSS
	 * @return String
	 */
	public static String formatMillisecondDate() {
		return millisecondDateFormat.format(new Date());
	}

	/**
	 * 返回当前日期，表现形式：yyyyMM
	 * @return String
	 */
	public static String formatSimpleDate() {
		return simpleDateFormat.format(new Date());
	}

	public static Timestamp getNowTimeStamp() {
		Date nowDay = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(nowDay);
		Timestamp ts;
		try {
			ts = new Timestamp(sdf.parse(time).getTime());
		} catch (ParseException e) {
			ts = null;
			e.printStackTrace();
		}
		return ts;
	}

	/**
	 * 获取当前时间
	 * @return String
	 */
	public static String getNowTime() {
		Date nowDay = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(nowDay);
		return time;
	}
}
