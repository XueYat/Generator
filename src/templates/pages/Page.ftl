package ${package}.model;

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
public class Page implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 当前页
	 */
	private Integer currentPage = 1;
	/**
	 * 每页量
	 */
	private Integer pageSize = 10;
	/**
	 * 排序字段，多个字段用","隔开
	 */
	private String orderField;
	/**
	 * 排序方式，DESC降序；ASC升序
	 */
	private String sort = "DESC";
	/**
	 * 分页开始记录条数
	 */
	private Integer pageOffset;
	/**
	 * 总记录数
	 */
	private Long totalRecord;
	/**
	 * 总页数
	 */
	private Integer totalPage;
}
