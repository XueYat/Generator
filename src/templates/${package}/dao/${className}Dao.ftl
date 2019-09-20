package ${package}.dao;

import org.apache.ibatis.annotations.Mapper;
import ${package}.model.${className}Model;
import ${package}.model.Page;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
 * @author ${author}
 * @date ${date} ${time}
 */
@Mapper
public interface ${className}Dao{
	/**
	 * 分页查询固定参数
	 * @param page page
	 * @param entity entity
	 * @param queryFields queryFields
	 * @return List
	 */
	List<${className}Model> queryPage${className}(@Param(value = "page") Page page, @Param(value = "entity" )${className}Model entity, @Param(value = "queryFields") List queryFields);
	
	/**
	 * 查询固定参数
	 * @param entity entity
	 * @param queryFields queryFields
	 * @return List
	 */
	List<${className}Model> queryList${className}(@Param(value = "entity") ${className}Model entity, @Param(value = "queryFields") List queryFields);
	
	/**
	 * 查询总数量
	 * @param entity entity
	 * @return Long
	 */
	Long queryCount${className}(@Param(value = "entity") ${className}Model entity);
	
	/**
	 * 查询单个实体
	 * @param id id
	 * @param queryFields queryFields
	 * @return ${className}Model
	 */
	${className}Model query${className}ById(@Param(value = "id") String id, @Param(value = "queryFields") List queryFields);
	
	/**
	 * 新增
	 * @param entity entity
	 * @return int
	 */
	int add${className}(${className}Model entity);
	
	/**
	 * 修改
	 * @param entity entity
	 * @return int
	 */
	int update${className}(${className}Model entity);

	/**
	 * 删除
	 * @param id id
	 * @return int
	 */
	int remove${className}ById(@Param(value = "id") String id);

	/**
	 * 批量删除
	 * @param code code
	 * @return int
	 */
	int remove${className}ByIds(List code);
}