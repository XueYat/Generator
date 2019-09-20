package ${package}.service;

import java.util.List;

import ${package}.model.Page;
import ${package}.model.${className}Model;

/**
 * @author ${author}
 * @date ${date} ${time}
 */
public interface ${className}Service {
	/**
	 * ${table.tableDesc}数据分页查询
	 * @param page ${table.tableDesc}数据分页条件
	 * @param ${classNameLower}Model ${table.tableDesc}数据查询条件
	 * @param queryFields ${table.tableDesc}数据查询字段集合
	 * @return List<${className}Model>分页数据
	 */
	 public	List<${className}Model> queryPage${className}(Page page, ${className}Model ${classNameLower}Model, String queryFields);
	 
	 /**
	 * ${table.tableDesc}数据不分页查询
	 * @param ${classNameLower}Model ${table.tableDesc}数据查询条件
	 * @param queryFields ${table.tableDesc}数据查询字段集合
	 * @return List<${className}Model>分页数据
	 */
	 public	List<${className}Model> queryList${className}(${className}Model ${classNameLower}Model, String queryFields);
	
	/**
	 * ${table.tableDesc}数据查询总条数
	 * @param ${classNameLower}Model ${table.tableDesc}数据查询条件
	 * @return 查询条数
	 */
	public Long queryCount${className}(${className}Model ${classNameLower}Model);
	
	/**
	 * 根据id查询${table.tableDesc}数据
	 * @param id ${table.tableDesc}数据id
	 * @return ${className}Model 单条数据
	 */
	public ${className}Model query${className}ById(String id);
	
	/**
	 * ${table.tableDesc}数据新增
	 * @param ${classNameLower}Model ${table.tableDesc}数据
	 * @return String 添加成功的id
	 */
	public int save(${className}Model ${classNameLower}Model);
	
	/**
	 * ${table.tableDesc}数据编辑
	 * Created on ${date}
	 * @param ${classNameLower}Model ${table.tableDesc}数据
	 * @return 成功条数
	 */
	public int edit(${className}Model ${classNameLower}Model);
	
	/**
	 * ${table.tableDesc}数据删除
	 * Created on ${date}
	 * @param id ${table.tableDesc}数据id
	 * @return 成功条数
	 */
	public int remove${className}ById(String id);
	
	/**
	 * ${table.tableDesc}数据批量删除
	 * Created on ${date}
	 * @param ids ${table.tableDesc}数据id的集合
	 * @return 成功条数
	 */
	public int remove${className}ByIds(String ids);
}