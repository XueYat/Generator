package ${package}.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author ${author}
 * @date ${date} ${time}
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResponseJson implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 返回码
	 */
	private Integer code;
	/**
	 * 返回信息
	 */
	private String msg;
	/**
	 * 返回数据
	 */
	private Object data;
	
	public ResponseJson(Integer code, Object data) {
		super();
		this.code = code;
		this.data = data;
	}
	
	public ResponseJson(Integer code) {
		super();
		this.code = code;
	}
}
